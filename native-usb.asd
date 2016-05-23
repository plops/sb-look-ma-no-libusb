
(asdf:defsystem native-usb
  :version "0"
  :description "Pure Common Lisp interface for Linux USB. Uses ioctl calls and no libusb."
  :maintainer "Martin Kielhorn <kielhorn.martin@gmail.com>"
  :author "Martin Kielhorn <kielhorn.martin@gmail.com>"
  :licence "GPL"
  :depends-on (:sb-bsd-sockets #+generate-native-usb-doc :mgl-pax)
  ;; note the dependency of mgl-pax is only for creating the
  ;; documentation. by default (with generate-native-usb-doc not being
  ;; in *features*) this dependency is ommited.
  :components ((:file "native-usb")))
