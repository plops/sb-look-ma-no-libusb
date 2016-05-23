;; this file is only required to regenerate the README.md. Load this
;; after native-usb.lisp and call update-markdown-readme whenever new
;; functions were added or documentation was changed.

(eval-when (:execute :load-toplevel :compile-toplevel)
  (ql:quickload :mgl-pax)
  (push :generate-native-usb-doc cl:*features*))

(in-package :native-usb)


(defun update-markdown-readme ()
 (with-open-file (s (merge-pathnames "stage/sb-look-ma-no-libusb/README.md" (user-homedir-pathname))
		    :direction :output
		    :if-exists :supersede
		    :if-does-not-exist :create)
   (mgl-pax:document (list native-usb:@native-usb-manual) :stream s :format :markdown)))

#+nil
(update-markdown-readme)
