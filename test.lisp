(eval-when (:execute :load-toplevel :compile-toplevel)
  ;; make sure no documentation is generated
  (setf cl:*features*
	(set-difference cl:*features* (list :generate-native-usb-doc)))
  (ql:quickload :native-usb))
