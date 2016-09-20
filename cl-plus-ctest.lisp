(ql:quickload :cl-plus-c)
(defpackage :g (:use :cl :plus-c))
(in-package :g)
(autowrap:c-include "usb2.h"
		    :spec-path (merge-pathnames
				"quicklisp/local-projects/sb-look-ma-no-libusb/"
				(user-homedir-pathname))
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
		    :no-accessors t
		    :no-functions t
		    )

(c-let ((u '(:struct usbdevfs-urb) :free t))
  (print u))
