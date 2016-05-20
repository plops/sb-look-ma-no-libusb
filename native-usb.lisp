(defun open-usb (vendor-id &optional (product-id 0))
  (declare (type (unsigned-byte 16) vendor-id product-id))
  (let* ((vendor-files (directory "/sys/bus/usb/devices/usb*/*/idVendor"))
	 (vendors (mapcar #'(lambda (fn)
			      (with-open-file (s fn)
				(parse-integer (read-line s) :radix 16)))
			  vendor-files)))
    ;; FIXME handle multiple devices with same vendor-id
    (elt vendor-files (position vendor-id vendors))))



#+nil
(open-usb #x10c4 #x87a0)


;; https://www.linuxjournal.com/article/7466
