;; this file is only required to regenerate the README.md. Load this
;; after native-usb.lisp and call update-markdown-readme whenever new
;; functions were added or documentation was changed.

;; alternatively, if you native-usb.asd is linked into a subfolder of
;; quicklisp/local-projects, this file should load in slime with C-c
;; C-k

(eval-when (:compile-toplevel)
  (ql:quickload :mgl-pax)
  (ql:quickload :native-usb))

(mgl-pax:define-package :native-usb
    (:documentation "Pure Common Lisp based USB interface. Requires SBCL and Linux.")
  (:use #:cl #:mgl-pax))

(in-package :native-usb)


(mgl-pax:defsection @install-sec (:title "Installation")
  "Make sure your user has read and write permissions for the USB device, e.g.:
 
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
 ```")

(mgl-pax:defsection @usage-sec (:title "Usage")
  "```common-lisp
 (eval-when (:load-toplevel :execute :compile-toplevel)
   (ql:quickload :native-usb))
 (in-package :native-usb)
 (with-open-usb (s #x10c4 :product-id #x87a0)
   (let ((buf (make-array 4 :element-type '(unsigned-byte 8))))
     (usb-control-msg s #xc0 #x22 0 0 buf)))
 ```"
  (with-open-usb macro)		
  (usb-control-msg function)
  (usb-bulk-transfer function)
  )

(mgl-pax:defsection @compilation-sec (:title "Compilation")
  "This code uses C2FFI to parse the header file linux/usbdevice_fs.h
  and generate the foreign function interface for usbdevfs. It
  generates a few files in /tmp. If your architecture is AMD64,
  running C2FFI again is not required. It should suffice to load
  native-usb-ffi.lisp with the definitions that C2FFI generated on my
  system. In this case neither the c2ffi binary nor the Common Lisp
  package cl-autowrap are required.")


(mgl-pax:defsection @native-usb-manual (:title "Native USB manual")
  "This is an pure Common Lisp interface for Linux USB. It requires SBCL because I rely on its internals `sb-sys:with-pinned-objects` and `sb-sys:vector-sap`. I use c2ffi and cl-autowrap to obtain the required IOCTL type and constant definitions. However, if you are using AMD64 you might not have to install c2ffi or cl-autowrap.

For debugging and functional verification I use `sudo modprobe usbmon` and `wireshark`.
"
  (@install-sec section)
  (@usage-sec section)
  (@compilation-sec section))




(defun update-markdown-readme ()
 (with-open-file (s (merge-pathnames "quicklisp/local-projects/sb-look-ma-no-libusb/README.md" (user-homedir-pathname))
		    :direction :output
		    :if-exists :supersede
		    :if-does-not-exist :create)
   (mgl-pax:document (list @native-usb-manual) :stream s :format :markdown
    )))

#+nil
(update-markdown-readme)
