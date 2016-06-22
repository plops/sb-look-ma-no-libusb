
(asdf:defsystem native-usb
  :version "0"
  :description "Pure Common Lisp interface for Linux USB. Uses ioctl calls and no libusb."
  :maintainer "Martin Kielhorn <kielhorn.martin@gmail.com>"
  :author "Martin Kielhorn <kielhorn.martin@gmail.com>"
  :licence "GPLv3"
  :depends-on (:sb-bsd-sockets)
  :components ((:file "native-usb")))
