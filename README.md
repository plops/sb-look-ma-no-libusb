<a id='x-28NATIVE-USB-3A-40NATIVE-USB-MANUAL-20MGL-PAX-3ASECTION-29'></a>

# Native USB manual

## Table of Contents

- [1 Installation][33d1]
- [2 Usage][4e5e]
- [3 Compilation][9722]

###### \[in package NATIVE-USB\]
This is an pure Common Lisp interface for Linux USB. It requires SBCL because I rely on its internals `sb-sys:with-pinned-objects` and `sb-sys:vector-sap`. I use c2ffi and cl-autowrap to obtain the required `IOCTL` type and constant definitions. However, if you are using AMD64 you might not have to install c2ffi or cl-autowrap.

For debugging and functional verification I use `sudo modprobe usbmon` and `wireshark`.

<a id='x-28NATIVE-USB-3A-40INSTALL-SEC-20MGL-PAX-3ASECTION-29'></a>

## 1 Installation

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


<a id='x-28NATIVE-USB-3A-40USAGE-SEC-20MGL-PAX-3ASECTION-29'></a>

## 2 Usage

```common-lisp
;(eval-when (:load-toplevel :execute :compile-toplevel)
;  (ql:quickload :native-usb))
;(in-package :native-usb)
;(with-open-usb (s #x10c4 :product-id #x87a0)
;  (let ((buf (make-array 4 :element-type '(unsigned-byte 8))))
;    (usb-control-msg s #xc0 #x22 0 0 buf)))
```


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

<a id='x-28NATIVE-USB-3A-40COMPILATION-SEC-20MGL-PAX-3ASECTION-29'></a>

## 3 Compilation

This code uses C2FFI to parse the header file linux/usbdevice\_fs.h
and generate the foreign function interface for usbdevfs. It
generates a few files in /tmp. If your architecture is AMD64,
running C2FFI again is not required. It should suffice to load
native-usb-ffi.lisp with the definitions that C2FFI generated on my
system. In this case neither the c2ffi binary nor the Common Lisp
package cl-autowrap are required.

  [33d1]: #x-28NATIVE-USB-3A-40INSTALL-SEC-20MGL-PAX-3ASECTION-29 "Installation"
  [4e5e]: #x-28NATIVE-USB-3A-40USAGE-SEC-20MGL-PAX-3ASECTION-29 "Usage"
  [9722]: #x-28NATIVE-USB-3A-40COMPILATION-SEC-20MGL-PAX-3ASECTION-29 "Compilation"
  [977e]: #x-28NATIVE-USB-3AWITH-OPEN-USB-20-28MGL-PAX-3AMACRO-29-29 "(NATIVE-USB:WITH-OPEN-USB (MGL-PAX:MACRO))"
