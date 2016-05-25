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
	 (fn (namestring (pathname stream)))
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
       (setf response-timestamp-ns (stat-mtim fn))))
    (values buffer response-timestamp-ns)))

(defun usb-bulk-transfer (stream ep buffer &key (timeout-ms 1000))
  (declare (type (unsigned-byte 32) ep timeout-ms))
  "Initiate a synchronous USB bulk transfer (read or write, depending on EP)."
  (let* ((fd (sb-posix:file-descriptor stream))
	 (fn (namestring (pathname stream)))
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
       (setf response-timestamp-ns (stat-mtim fn))))
    (values buffer response-timestamp-ns)))

#+nil
(with-open-usb (s #x10c4 :product-id #x87a0)
  (let ((buf (make-array 4 :element-type '(unsigned-byte 8))))
    (usb-control-msg s #xc0 #x22 0 0 buf)))

;; http://www.oreilly.com/openbook/linuxdrive3/book/ch13.pdf


(defun usb-urb-bulk-async (stream ep buffer &key (context) (stream-id 0))
  "buffer must not be stack memory and should stay pinned until
response is received"
  (declare (type (unsigned-byte 8) ep))
  (let* ((fd (sb-posix:file-descriptor stream))
	 (fn (namestring (pathname stream)))
	 (response-timestamp-ns 0)
	 (n (length buffer)))
    (declare (type (unsigned-byte 32) n)
	     (type (unsigned-byte 64) response-timestamp-ns))
    (autowrap:with-alloc (u '(:struct (usbdevfs-urb)))
      (setf (usbdevfs-urb.type u) +USBDEVFS-URB-TYPE-BULK+
	    (usbdevfs-urb.endpoint u) ep
	    (usbdevfs-urb.status u) 0
	    (usbdevfs-urb.flags u) 0
	    ;; +USBDEVFS-URB-SHORT-NOT-OK+
	    ;; +USBDEVFS-URB-BULK-CONTINUATION+
	    (usbdevfs-urb.buffer u) (sb-sys:vector-sap buffer)
	    (usbdevfs-urb.buffer-length u) n
	    (usbdevfs-urb.actual-length u) n
	    (usbdevfs-urb.start-frame u) 0
	    ;; stream-id is only used for bulk streams
	    (usbdevfs-urb.field-343.stream-id u) stream-id
	    (usbdevfs-urb.error-count u) 0
	    (usbdevfs-urb.signr u) 0
	    (usbdevfs-urb.usercontext u) (sb-sys:int-sap context))
      (assert (<= 0 (ioctl fd +USBDEVFS-SUBMITURB+ :pointer (AUTOWRAP:PTR u))))
      (setf response-timestamp-ns (stat-mtim fn)))
    response-timestamp-ns))

(defun usb-urb-reap-ndelay (stream)
  (let* ((fd (sb-posix:file-descriptor stream)))
    (autowrap:with-alloc (u '(:struct (usbdevfs-urb)))
      (assert (<= 0 (ioctl fd +USBDEVFS-REAPURBNDELAY+ :pointer (AUTOWRAP:PTR u))))
      (sb-sys:sap-int (usbdevfs-urb.usercontext u)))))

(defun reset (s)
  (usb-control-msg s
		   #x40 #x10
		   0 0
		   (make-array 0 :element-type '(unsigned-byte))))

(progn
  (with-open-usb (s #x10c4 )
    (reset s))
  (sleep 1)
 (let* ((spi-data '(3 #x26 0 0 0 0))
	(n (length spi-data))
	(header `(0 0	;; reserved
		    2	;; cmd id ;; simultaneous write/read
		    #x80 ;; reserved
		    ;; number of bytes to read (little endian, 6 0 0 0 would be 6 bytes)
		    ,(ldb (byte 8 0) n)
		    ,(ldb (byte 8 (* 1 8)) n)
		    ,(ldb (byte 8 (* 2 8)) n)
		    ,(ldb (byte 8 (* 3 8)) n)))
	(read1 (make-array (+ n 8)
			   :element-type '(unsigned-byte 8)))
	(write1 (map-into (make-array (+ n 8)
				      :element-type '(unsigned-byte 8))
			  #'identity
			  (concatenate 'vector header (subseq spi-data 0 2)))))
   (sb-sys:with-pinned-objects (read1 write1)
     (with-open-usb (s #x10c4)
       (usb-urb-bulk-async s #x82 read1 :context 123)
       (usb-urb-bulk-async s #x01 write1 :context 456)
       (sb-unix:unix-simple-poll (sb-posix:file-descriptor s) :output 100)
       (list (usb-urb-reap-ndelay s)
	     (sb-unix:unix-simple-poll (sb-posix:file-descriptor s) :output 100)
	     (usb-urb-reap-ndelay s))
       ))))


#+nil
(let* ((n (length data))
	 (header `(0 0	  ;; reserved
		     2	  ;; cmd id ;; simultaneous write/read
		     #x80 ;; reserved
		     ;; number of bytes to read (little endian, 6 0 0 0 would be 6 bytes)
		     ,(ldb (byte 8 0) n)
		     ,(ldb (byte 8 (* 1 8)) n)
		     ,(ldb (byte 8 (* 2 8)) n)
		     ,(ldb (byte 8 (* 3 8)) n)))
	 ;; combine header and data (data must have length n)
	 (buf (map-into (make-array (+ n 8)
				    :element-type '(unsigned-byte 8))
			#'identity
			(concatenate 'vector header data))))
    (declare (type (unsigned-byte 32) n))
    ;; in mode high-priority write (which is the default) ep 2 is bulk in
    (let ((ret nil)
	  (ret2 nil))
      (with-condition-variables (read1 read1f read2 read2f write1)
	(sb-thread:make-thread #'(lambda ()
				   (wait read1)
				   ;; write usb cp2130 header and a maximum of 56 bytes of payload
				   ;; for read calls first-packet-len is 2 and the first payload 2 bytes
				   (usb-bulk-transfer s #x01
						      (subseq buf 0
							      (+ 8 first-packet-len)))
				   (notify write1))
			       :name "write1")
	(when (< first-packet-len n)
	  ;; write the residual payload. the usb bus will
	  ;; transparently split this into 64byte packets and we will
	  ;; have to hope the the os doesn't wait too much between
	  ;; those packets. the payload can even be 768 bytes

	  (sb-thread:make-thread #'(lambda ()
				     (wait read2)
				     (let* ((len1 (+ 8 first-packet-len))
					    (len2 (- n first-packet-len))
					    (payload2 (subseq buf len1 (+ len1 len2))))
				       (usb-bulk-transfer s #x01 payload2)))
				 :name "write2")
	  (sb-thread:make-thread #'(lambda ()
				     (wait write1)
				     (wait read1f)
				     (notify read2)
				     (setf ret2 (usb-bulk-transfer
						 s #x82
						 (make-array (- n first-packet-len)
							     :element-type '(unsigned-byte 8))))
				     (notify read2f))
				 :name "read2"))
	(sb-thread:make-thread #'(lambda ()
				   (notify read1)
				   (setf ret (usb-bulk-transfer
					      s #x82
					      (make-array n :element-type '(unsigned-byte 8))))
				   (sleep .001)
				   (notify read1f))
			       :name "read1")
	(if (= first-packet-len n)
	    (progn ;; special case if data is small, and no timing
		   ;; requirements, only one usb bulk write is sent
	      (wait read1f)
	      ret)
	    (progn
	      (wait read2f)
	      (map-into (make-array (+ (length ret) (length ret2))
				    :element-type '(unsigned-byte 8))
			#'identity
			(concatenate 'vector ret ret2)))))))
