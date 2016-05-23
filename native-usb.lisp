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

(defmacro with-open-usb ((fd vendor-id &key (stream (gensym "USB-STREAM"))
			     (product-id 0))
			 &body body)
  "Scan all USB devices for matching vendor-id, open the usbfs file
and make the file descriptor FD available."
  `(multiple-value-bind (bus dev)
       (get-usb-busnum-and-devnum ,vendor-id ,product-id)
     (with-open-file (,stream (format nil "/dev/bus/usb/~3,'0d/~3,'0d" bus dev)
			 :direction :io
			 :if-exists :overwrite
			 :element-type '(unsigned-byte 8))
       (let ((,fd (sb-posix:file-descriptor ,stream)))
	 ,@body))))

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



(let ((autowrap::*trace-c2ffi* t))
 (autowrap::run-c2ffi "/usr/include/linux/usbdevice_fs.h" "/dev/shm/b"))

(autowrap::run-check autowrap::*c2ffi-program*
		     (autowrap::list "/tmp/usb0.h"
				      "-D" "null"
				      "-M" "/tmp/usb_macros.h"
				      "-A" "x86_64-pc-linux-gnu"
				      ))

(autowrap::run-check autowrap::*c2ffi-program*
		     (autowrap::list "/tmp/usb1.h"
				     "-A" "x86_64-pc-linux-gnu"
				     "-i" "/usr/include/" ))

(with-open-file (s "/tmp/usb0.h"
		   :direction :output
		   :if-does-not-exist :create
		   :if-exists :supersede)
  (format s "#include \"/usr/include/linux/usbdevice_fs.h\"~%"))

(with-open-file (s "/tmp/usb1.h"
		   :direction :output
		   :if-does-not-exist :create
		   :if-exists :supersede)
  
  (format s "#include <sys/ioctl.h>~%")
  (format s "#include \"/tmp/usb0.h\"~%")
  (format s "#include \"/tmp/usb_macros.h\"~%"))

(autowrap:c-include "/usr/include/linux/usbdevice_fs.h"
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

+USBDEVFS-BULK+

(usbdevfs-bulktransfer)
(autowrap:with-alloc (bla '(:struct (USBDEVFS-BULKTRANSFER)))
  (defparameter *bla* bla)
  (autowrap:foreign-record-bit-size bla)
  )
(defparameter *bla* (autowrap:find-type '(:struct (USBDEVFS-BULKTRANSFER))))


(truncate
 (autowrap:foreign-record-bit-size
  (autowrap:find-type '(:struct (USBDEVFS-BULKTRANSFER))))
 8)

(autowrap:foreign-record-bit-size '(:struct USBDEVFS-BULKTRANSFER)
			 ) 

;; why is +USBDEVFS-BULK+ NIL?

;; documentation of the ioctls
;; https://www.kernel.org/doc/htmldocs/usb/usbfs-ioctl.html
(defun ioc (dir type nr size)
  "Size is bytes"
  (let ((nr-bits 8)
        (type-bits 8)
        (size-bits 14)
        (dir-bits 2)
        (ioc 0))
    (declare (type (unsigned-byte 32) ioc))
    (setf (ldb (byte nr-bits 0) ioc) nr
          (ldb (byte type-bits (+ nr-bits)) ioc) type
          (ldb (byte size-bits (+ nr-bits type-bits)) ioc) size
          (ldb (byte dir-bits (+ nr-bits type-bits size-bits)) ioc) (ecase dir
                                                                     (:none 0)
                                                                     (:write 1)
                                                                     (:read 2)))
    ioc))
