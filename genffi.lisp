(eval-when (:compile-toplevel :execute :load-toplevel)
  (ql:quickload :cl-autowrap)
  )

(in-package :native-usb)

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
