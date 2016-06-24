;; you only need to run this, when generating a new spec file with c2ffi

(eval-when (:compile-toplevel :execute :load-toplevel)
  (ql:quickload :cl-autowrap))

(in-package :native-usb)



(progn
  (with-open-file (s "usb0.h"
		     :direction :output
		     :if-does-not-exist :create
		     :if-exists :supersede)
    (format s "#include \"/usr/include/linux/usbdevice_fs.h\"~%"))
  (autowrap::run-check autowrap::*c2ffi-program*
		       (autowrap::list "usb0.h"
				       "-D" "null"
				       "-M" "usb_macros.h"
				       "-A" "x86_64-pc-linux-gnu"
				       ))

  
  (with-open-file (s "usb1.h"
		     :direction :output
		     :if-does-not-exist :create
		     :if-exists :supersede)
    
    (format s "#include <sys/types.h>~%")
    (format s "#include <sys/stat.h>~%")
    (format s "#include <sys/ioctl.h>~%")
    (format s "#include \"usb0.h\"~%")
    (format s "#include \"usb_macros.h\"~%")))

(defparameter *spec-path* (merge-pathnames
			   "quicklisp/local-projects/sb-look-ma-no-libusb/"
			   (user-homedir-pathname)))

(autowrap:c-include "usb1.h"
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
		    ;:trace-c2ffi t
		    )
