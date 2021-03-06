(eval-when (:execute :load-toplevel :compile-toplevel)
  (ql:quickload :native-usb))

(in-package :native-usb)

(with-open-usb (s #x10c4 :product-id #x87a0)
  (let ((buf (make-array 4 :element-type '(unsigned-byte 8))))
    (usb-control-msg s #xc0 #x22 0 0 buf)))
