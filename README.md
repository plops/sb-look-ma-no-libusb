<a id='x-28NATIVE-USB-3A-40NATIVE-USB-MANUAL-20MGL-PAX-3ASECTION-29'></a>

# Native USB manual

## Table of Contents


###### \[in package NATIVE-USB\]
This is an pure Common Lisp interface for Linux USB. It requires SBCL because I rely on its internals `sb-sys:with-pinned-objects` and `sb-sys:vector-sap`. I use c2ffi and cl-autwrap to obtain the required `IOCTL` type and constant definitions.

Make sure your user has read and write permissions for the USB device,
e.g.:

```
crw-rw-rw- 1 root root 189, 1 May 23 14:49 /dev/bus/usb/001/002
```

Open the a USB stream using the macro [`WITH-OPEN-USB`][977e] and send control
or bulk messages. Example: 

The following commands should install this library into a local
quicklisp installation.  Note that a few header files will be
generated in /tmp.

```
mkdir ~/stage/
cd ~/stage/
git clone https://github.com/plops/sb-look-ma-no-libusb
ln -s ~/stage/sb-look-ma-no-libusb ~/quicklisp/local-projects/
```

```common-lisp
;(eval-when (:load-toplevel :execute :compile-toplevel)
;  (ql:quickload :native-usb))
;(in-package :native-usb)
;(with-open-usb (s #x10c4 :product-id #x87a0)
;  (let ((buf (make-array 4 :element-type '(unsigned-byte 8))))
;    (usb-control-msg s #xc0 #x22 0 0 buf)))
```

For debugging and functional verification I use `sudo modprobe usbmon` and `wireshark`.

<a id='x-28NATIVE-USB-3AWITH-OPEN-USB-20-28MGL-PAX-3AMACRO-29-29'></a>

- [macro] **WITH-OPEN-USB** *(STREAM VENDOR-ID &KEY (PRODUCT-ID 0)) &BODY BODY*

    Scan all USB devices for matching vendor-id, open the usbfs file
    and make `STREAM` available. The filedescriptor and pathname can be
    obtained from `STREAM` using `SB-POSIX:FILE-DESCRIPTOR` and `PATHNAME`.

<a id='x-28NATIVE-USB-3AUSB-CONTROL-MSG-20FUNCTION-29'></a>

- [function] **USB-CONTROL-MSG** *STREAM REQUESTTYPE REQUEST VALUE INDEX BUFFER &KEY (TIMEOUT-MS 1000)*

    Send a synchronous control message.

<a id='x-28NATIVE-USB-3AUSB-BULK-TRANSFER-20FUNCTION-29'></a>

- [function] **USB-BULK-TRANSFER** *STREAM EP BUFFER &KEY (TIMEOUT-MS 1000)*

    Initiate a synchronous USB bulk transfer (read or write, depending on `EP`).

  [977e]: #x-28NATIVE-USB-3AWITH-OPEN-USB-20-28MGL-PAX-3AMACRO-29-29 "(NATIVE-USB:WITH-OPEN-USB (MGL-PAX:MACRO))"
