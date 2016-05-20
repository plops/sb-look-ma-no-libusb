(mapcar #'(lambda (fn)
	    (with-open-file (s fn)
	      (read-line s)))
	(directory "/sys/bus/usb/devices/usb*/*/idVendor"))
