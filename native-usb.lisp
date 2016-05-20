(defun get-usb-busnum-and-devnum (vendor-id &optional (product-id 0))
  (declare (type (unsigned-byte 16) vendor-id product-id))
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


