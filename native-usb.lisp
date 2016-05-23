;; strace -f -e open sbcl --noinform --noprint --disable-ldb --no-sysinit --no-userinit --script native-usb.lisp

(defun get-usb-busnum-and-devnum (vendor-id &optional (product-id 0))
  (declare (type (unsigned-byte 16) vendor-id product-id))
  "Scan all USB devices for matching vendor-id and return its bus and
device number."
  (let* ((vendor-files (directory "/sys/bus/usb/devices/usb*/*/idVendor"))
	 (vendors (mapcar #'(lambda (fn)
			      (with-open-file (s fn)
				(parse-integer (read-line s) :radix 16)))
			  vendor-files)))
    ;; FIXME handle multiple devices with same vendor-id
    (let* ((path (elt vendor-files (position vendor-id vendors)))
	   (dir (directory-namestring path)))
      (values
       (with-open-file (s (merge-pathnames dir "/busnum"))
	 (read s))
       (with-open-file (s (merge-pathnames dir "/devnum"))
	 (read s))))))


#+nil
(get-usb-busnum-and-devnum #x10c4 #x87a0)

(defmacro with-open-usb ((fd fn vendor-id &key (stream (gensym "USB-STREAM"))
			     (product-id 0))
			 &body body)
  "Scan all USB devices for matching vendor-id, open the usbfs file
and make the file descriptor FD available."
  `(multiple-value-bind (bus dev)
       (get-usb-busnum-and-devnum ,vendor-id ,product-id)
     (let ((,fn (format nil "/dev/bus/usb/~3,'0d/~3,'0d" bus dev)))
      (with-open-file (,stream ,fn
			       :direction :io
			       :if-exists :overwrite
			       :element-type '(unsigned-byte 8))
	(let ((,fd (sb-posix:file-descriptor ,stream)))
	  ,@body)))))

#+nil
(with-open-usb (fd #x10c4 :stream s :product-id #x87a0)
   (read-byte s))



;; https://www.linuxjournal.com/article/7466

;; sudo cat /sys/kernel/debug/usb/devices

;; T:  Bus=02 Lev=01 Prnt=01 Port=01 Cnt=01 Dev#=  8 Spd=12   MxCh= 0
;; D:  Ver= 2.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
;; P:  Vendor=10c4 ProdID=87a0 Rev= 1.00
;; S:  Manufacturer=Silicon Laboratories
;; S:  Product=CP2130 USB-to-SPI Bridge
;; S:  SerialNumber=000029BE
;; C:* #Ifs= 1 Cfg#= 1 Atr=a0 MxPwr=100mA
;; I:* If#= 0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=ff Driver=(none)
;; E:  Ad=01(O) Atr=02(Bulk) MxPS=  64 Ivl=0ms
;; E:  Ad=82(I) Atr=02(Bulk) MxPS=  64 Ivl=0ms

;; https://www.kernel.org/doc/Documentation/usb/proc_usb_info.txt


;; https://github.com/scanlime/ram-tracer/blob/a8f935ca9d275c970a89fca1fed9585f51224edb/host/fastftdi.c

;; definition of ioctls in the kernel
;; drivers/usb/core/devio.c

;; kernel interface for user level
;; usbdevice_fs.h

(ql:quickload :cl-autowrap)
(eval-when (:compile-toplevel :execute :load-toplevel)
  (defparameter *spec-path* (merge-pathnames "stage/sb-look-ma-no-libusb/"
					     (user-homedir-pathname))))

(progn
  (with-open-file (s "/tmp/usb0.h"
		     :direction :output
		     :if-does-not-exist :create
		     :if-exists :supersede)
    (format s "#include \"/usr/include/linux/usbdevice_fs.h\"~%"))
  (autowrap::run-check autowrap::*c2ffi-program*
		       (autowrap::list "/tmp/usb0.h"
				       "-D" "null"
				       "-M" "/tmp/usb_macros.h"
				       "-A" "x86_64-pc-linux-gnu"
				       ))

  
  (with-open-file (s "/tmp/usb1.h"
		     :direction :output
		     :if-does-not-exist :create
		     :if-exists :supersede)
    
    (format s "#include <sys/types.h>~%")
    (format s "#include <sys/stat.h>~%")
    (format s "#include <sys/ioctl.h>~%")
    (format s "#include \"/tmp/usb0.h\"~%")
    (format s "#include \"/tmp/usb_macros.h\"~%")))

(autowrap:c-include "/tmp/usb1.h"
		    :spec-path *spec-path*
		    :exclude-arch ("arm-pc-linux-gnu"
				   "i386-unknown-freebsd"
				   "i686-apple-darwin9"
				   "i686-pc-linux-gnu"
				   "i686-pc-windows-msvc"
				   "x86_64-apple-darwin9"
					;"x86_64-pc-linux-gnu"
				   "x86_64-pc-windows-msvc"
				   "x86_64-unknown-freebsd")
		    :exclude-sources ("/usr/include/linux/types.h"
				      "/usr/include/linux/magic.h")
		    :include-sources ("/usr/include/linux/ioctl.h")
		    :trace-c2ffi t)


#+nil
(truncate
 (autowrap:foreign-record-bit-size
  (autowrap:find-type '(:struct (USBDEVFS-BULKTRANSFER))))
 8)

;; documentation of the ioctls
;; https://www.kernel.org/doc/htmldocs/usb/usbfs-ioctl.html

#+nil
(sb-unix:unix-ioctl )

#+nil
(sb-posix:ioctl )

(defun usb-control-msg (fd requesttype request value index buffer &key (timeout-ms 1000))
  (declare (type (unsigned-byte 8) requesttype request)
	   (type (unsigned-byte 16) value index)
	   (type (unsigned-byte 32) timeout-ms))
  (let ((n (length buffer)))
    (declare (type (unsigned-byte 16) n))
    (sb-sys:with-pinned-objects (buffer)
      (autowrap:with-alloc (c '(:struct (usbdevfs-ctrltransfer)))
       (setf (usbdevfs-ctrltransfer.b-request-type c) requesttype
	     (usbdevfs-ctrltransfer.b-request c) request
	     (usbdevfs-ctrltransfer.w-value c) value
	     (usbdevfs-ctrltransfer.w-index c) index
	     (usbdevfs-ctrltransfer.w-length c) n
	     (usbdevfs-ctrltransfer.data c) (sb-sys:vector-sap buffer)
	     (usbdevfs-ctrltransfer.timeout c) timeout-ms)
       (assert (<= 0 (CFFI-SYS:%FOREIGN-FUNCALL "ioctl"
						(:INT fd :UNSIGNED-LONG +USBDEVFS-CONTROL+
						      :POINTER (AUTOWRAP:PTR C) :INT)
						:CONVENTION :CDECL)))))
    buffer))




(defun stat-mtim (fn)
  (declare (values (unsigned-byte 64) &optional))
  "Return the 64bit mtime (in ns) for the file FN."
  (autowrap:with-alloc (stat '(:struct (stat)))
    (assert (= 0 (stat fn (autowrap:ptr stat))))
    (+ (* 1000000000 (stat.st-mtim.tv-sec stat))
       (stat.st-mtim.tv-nsec stat))))


(with-open-usb (fd fn #x10c4 :stream s :product-id #x87a0)
  (let ((buf (make-array 4 :element-type '(unsigned-byte 8))))
    (usb-control-msg fd #xc0 #x22 0 0 buf)
    (stat-mtim fn)))
