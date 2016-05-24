#+generate-native-usb-doc
(mgl-pax:define-package :native-usb
    (:documentation "Pure Common Lisp based USB interface. Requires SBCL and Linux.")
  (:use #:cl))
#-generate-native-usb-doc
(defpackage :native-usb
  (:use #:cl)
  (:export #:with-open-usb
	   #:usb-control-msg
	   #:usb-bulk-transfer))


(in-package :native-usb)

#+generate-native-usb-doc
(mgl-pax:defsection @native-usb-manual (:title "Native USB manual")
  "This is an pure Common Lisp interface for Linux USB. It requires SBCL bacause I rely on its internals `sb-sys:with-pinned-objects` and `sb-sys:vector-sap`. I use c2ffi and cl-autwrap to obtain the required IOCTL type and constant definitions.


Make sure your user has read and write permissions for the USB device,
e.g.:

```
crw-rw-rw- 1 root root 189, 1 May 23 14:49 /dev/bus/usb/001/002
```

Open the a USB stream using the macro `WITH-OPEN-USB` and send control
or bulk messages. Example: 

The following commands should install this library into a local
quicklisp installation.  Note that a few header files will be
generated in /tmp.

```
mkdir ~/stage/
cd ~/stage/
git clone https://github.com/plops/sb-look-ma-no-libusb
ln -s ~/stage/sb-look-ma-no-libusb ~/quicklisp/local-projects/
```

```common-lisp
(eval-when (:load-toplevel :execute :compile-toplevel)
  (ql:quickload :native-usb))
(in-package :native-usb)
(with-open-usb (s #x10c4 :product-id #x87a0)
  (let ((buf (make-array 4 :element-type '(unsigned-byte 8))))
    (usb-control-msg s #xc0 #x22 0 0 buf)))
```

For debugging and functional verification I use `sudo modprobe usbmon` and `wireshark`.
"
  ;(with-open-usb macro)		
  (usb-control-msg function)
  (usb-bulk-transfer function))


(eval-when (:compile-toplevel :execute :load-toplevel)
  (ql:quickload :cl-autowrap)
  (defparameter *spec-path* (merge-pathnames "stage/sb-look-ma-no-libusb/"
					     (user-homedir-pathname))))

(defun get-usb-busnum-and-devnum (vendor-id &optional (product-id 0))
  (declare (type (unsigned-byte 16) vendor-id product-id)
	   (ignorable product-id))
  "Scan all USB devices for matching vendor-id and return its bus and
device number. 

Example usage:
```
(get-usb-busnum-and-devnum #x10c4 #x87a0) => 1,2
```
"
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

(defmacro with-open-usb ((stream vendor-id &key (product-id 0))
			 &body body)
  "Scan all USB devices for matching vendor-id, open the usbfs file
and make STREAM available. The filedescriptor and pathname can be
obtained from STREAM using SB-POSIX:FILE-DESCRIPTOR and PATHNAME."
  `(multiple-value-bind (bus dev)
       (get-usb-busnum-and-devnum ,vendor-id ,product-id)
     (with-open-file (,stream (format nil "/dev/bus/usb/~3,'0d/~3,'0d" bus dev)
			      :direction :io
			      :if-exists :overwrite
			      :element-type '(unsigned-byte 8))
       ,@body)))

;; https://www.linuxjournal.com/article/7466
;; https://www.kernel.org/doc/Documentation/usb/proc_usb_info.txt

;; definition of ioctls in the kernel
;; drivers/usb/core/devio.c

;; kernel interface for user level
;; usbdevice_fs.h

;; documentation of the ioctls
;; https://www.kernel.org/doc/htmldocs/usb/usbfs-ioctl.html

;; https://github.com/scanlime/ram-tracer/blob/a8f935ca9d275c970a89fca1fed9585f51224edb/host/fastftdi.c




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

(defun stat-mtim (fn)
  (declare (values (unsigned-byte 64) &optional))
  "Return the 64bit mtime (in ns) for the file with name FN."
  (autowrap:with-alloc (stat '(:struct (stat)))
    (assert (= 0 (stat fn (autowrap:ptr stat))))
    (+ (* 1000000000 (stat.st-mtim.tv-sec stat))
       (stat.st-mtim.tv-nsec stat))))

(defun usb-control-msg (stream requesttype request value index buffer &key (timeout-ms 1000))
  (declare (type (unsigned-byte 8) requesttype request)
	   (type (unsigned-byte 16) value index)
	   (type (unsigned-byte 32) timeout-ms))
  "Send a synchronous control message."
  (let* ((fd (sb-posix:file-descriptor stream))
	 (fn (pathname stream))
	 (response-timestamp-ns 0)
	 (n (length buffer)))
    (declare (type (unsigned-byte 16) n)
	     (type (unsigned-byte 64) response-timestamp-ns))
    (sb-sys:with-pinned-objects (buffer)
      (autowrap:with-alloc (c '(:struct (usbdevfs-ctrltransfer)))
       (setf (usbdevfs-ctrltransfer.b-request-type c) requesttype
	     (usbdevfs-ctrltransfer.b-request c) request
	     (usbdevfs-ctrltransfer.w-value c) value
	     (usbdevfs-ctrltransfer.w-index c) index
	     (usbdevfs-ctrltransfer.w-length c) n ;; must be <= PAGE_SIZE
	     (usbdevfs-ctrltransfer.data c) (if (= n 0) ;; i think it is valid to read 0 bytes
						(cffi:null-pointer) 
						(sb-sys:vector-sap buffer))
	     (usbdevfs-ctrltransfer.timeout c) timeout-ms)
       (assert (<= 0 (ioctl fd +USBDEVFS-CONTROL+ :pointer (AUTOWRAP:PTR c))))
       (setf response-timestamp-ns (stat-mtim (namestring fn)))))
    (values buffer response-timestamp-ns)))

(defun usb-bulk-transfer (stream ep buffer &key (timeout-ms 1000))
  (declare (type (unsigned-byte 32) ep timeout-ms))
  "Initiate a synchronous USB bulk transfer (read or write, depending on EP)."
  (let* ((fd (sb-posix:file-descriptor stream))
	 (fn (pathname stream))
	 (response-timestamp-ns 0)
	 (n (length buffer)))
    (declare (type (unsigned-byte 32) n)
	     (type (unsigned-byte 64) response-timestamp-ns))
    (sb-sys:with-pinned-objects (buffer)
      (autowrap:with-alloc (b '(:struct (usbdevfs-bulktransfer)))
       (setf (usbdevfs-bulktransfer.ep b) ep
	     (usbdevfs-bulktransfer.len b) n
	     (usbdevfs-bulktransfer.data b) (sb-sys:vector-sap buffer)
	     (usbdevfs-bulktransfer.timeout b) timeout-ms)
       (assert (<= 0 (ioctl fd +USBDEVFS-BULK+ :pointer (AUTOWRAP:PTR b))))
       (setf response-timestamp-ns (stat-mtim (namestring fn)))))
    (values buffer response-timestamp-ns)))

#+nil
(with-open-usb (s #x10c4 :product-id #x87a0)
  (let ((buf (make-array 4 :element-type '(unsigned-byte 8))))
    (usb-control-msg s #xc0 #x22 0 0 buf)))


