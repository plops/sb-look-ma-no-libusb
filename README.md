# Improved README.md

Here's an improved version of the README.md that removes the auto-generated anchor links and uses clean markdown formatting:

```markdown
# Native USB

A pure Common Lisp interface for Linux USB communication without libusb.

## Overview

This library provides direct USB communication on Linux using native usbfs operations. It requires SBCL because it relies on SBCL-specific internals (`sb-sys:with-pinned-objects` and `sb-sys:vector-sap`). The library uses c2ffi and cl-autowrap to obtain the required `IOCTL` type and constant definitions. For AMD64 systems, pre-generated definitions are included, so c2ffi installation is optional.

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [API Reference](#api-reference)
- [Compilation](#compilation)
- [Debugging](#debugging)
- [Documentation Updates](#documentation-updates)

## Installation

### Prerequisites

Ensure your user has read and write permissions for the USB device:

```bash
crw-rw-rw- 1 root root 189, 1 May 23 14:49 /dev/bus/usb/001/002
```

### Install Steps

1. Clone the repository and link it to your Quicklisp local-projects:

```bash
mkdir ~/stage/
cd ~/stage/
git clone https://github.com/plops/sb-look-ma-no-libusb
ln -s ~/stage/sb-look-ma-no-libusb ~/quicklisp/local-projects/
```

2. Load the library:

```common-lisp
(ql:quickload :native-usb)
```

**Note:** During compilation, a few header files will be generated in `/tmp`.

## Usage

### Basic Example

```common-lisp
(eval-when (:load-toplevel :execute :compile-toplevel)
  (ql:quickload :native-usb))

(in-package :native-usb)

(with-open-usb (s #x10c4 :product-id #x87a0)
  (let ((buf (make-array 4 :element-type '(unsigned-byte 8))))
    (usb-control-msg s #xc0 #x22 0 0 buf)))
```

## API Reference

### `WITH-OPEN-USB`

**Macro:** `(with-open-usb (stream vendor-id &key (product-id 0)) &body body)`

Scans all USB devices for a matching vendor-id, opens the usbfs file, and makes `stream` available within the body. The file descriptor and pathname can be obtained from `stream` using `sb-posix:file-descriptor` and `pathname`.

### `USB-CONTROL-MSG`

**Function:** `(usb-control-msg stream requesttype request value index buffer &key (timeout-ms 1000))`

Sends a synchronous USB control message.

**Parameters:**
- `stream`: USB stream opened with `with-open-usb`
- `requesttype`: Request type byte
- `request`: Request byte
- `value`: 16-bit value
- `index`: 16-bit index
- `buffer`: Byte array for data transfer
- `timeout-ms`: Timeout in milliseconds (default: 1000)

### `USB-BULK-TRANSFER`

**Function:** `(usb-bulk-transfer stream ep buffer &key (timeout-ms 1000))`

Initiates a synchronous USB bulk transfer (read or write, depending on the endpoint).

**Parameters:**
- `stream`: USB stream opened with `with-open-usb`
- `ep`: Endpoint address
- `buffer`: Byte array for data transfer
- `timeout-ms`: Timeout in milliseconds (default: 1000)

## Compilation

This library uses c2ffi to parse the Linux kernel header file `linux/usbdevice_fs.h` and generate the foreign function interface for usbdevfs. 

For **AMD64 systems**, the pre-generated FFI definitions (`generated-ffi-amd64.lisp`) are included, so installing c2ffi is not required. Simply load `native-usb` and the pre-generated definitions will be used automatically.

For **other architectures**, you will need to install c2ffi, and the library will generate the appropriate FFI definitions during compilation. Generated files are placed in `/tmp`.

## Debugging

For debugging and functional verification, you can use:

```bash
sudo modprobe usbmon
wireshark
```

This enables USB monitoring that can be viewed in Wireshark for packet inspection.

## Documentation Updates

This library uses [mgl-pax](https://github.com/melisgl/mgl-pax) for documentation generation. 

To update the documentation after modifying docstrings or adding new functions:

1. Edit the docstrings in the source code
2. Run the code in `gendoc.lisp` to regenerate `README.md`

```common-lisp
(load "gendoc.lisp")
```
