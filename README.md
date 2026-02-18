[![Ask DeepWiki](https://deepwiki.com/badge.svg)](https://deepwiki.com/plops/sb-look-ma-no-libusb)

# sb-look-ma-no-libusb

A pure Common Lisp interface for USB device communication on Linux, without requiring libusb. Direct access to USB devices through Linux's usbdevfs interface.

## Overview

This library provides a native Common Lisp implementation for USB communication that bypasses libusb and directly uses Linux kernel USB device filesystem (usbdevfs) via ioctl calls. It's designed specifically for SBCL on Linux systems.  

**Key Features:**
- No libusb dependency - pure Common Lisp implementation
- Direct ioctl-based USB communication
- Support for control and bulk transfers
- Synchronous and asynchronous transfer modes
- SBCL-specific optimizations using pinned memory

## Requirements

- **Operating System:** Linux
- **Lisp Implementation:** SBCL (Steel Bank Common Lisp)
- **Architecture:** Primarily AMD64 (x86_64), though other architectures may work with c2ffi
- **Dependencies:** 
  - cl-autowrap (automatically loaded via Quicklisp)
  - c2ffi (optional, only needed for non-AMD64 architectures)  

## Installation

### 1. Clone the Repository

```bash
mkdir -p ~/stage/
cd ~/stage/
git clone https://github.com/plops/sb-look-ma-no-libusb
ln -s ~/stage/sb-look-ma-no-libusb ~/quicklisp/local-projects/
```  

### 2. Set USB Device Permissions

Ensure your user has read and write permissions for USB devices:

```bash
# Check permissions (should be rw-rw-rw- or similar)
ls -l /dev/bus/usb/001/002

# If needed, add your user to the appropriate group or use udev rules
```  

### 3. Load the Library

```common-lisp
(ql:quickload :native-usb)
```

## Usage

### Basic Example

```common-lisp
(eval-when (:load-toplevel :execute :compile-toplevel)
  (ql:quickload :native-usb))
  
(in-package :native-usb)

;; Open USB device with vendor ID 0x10c4 and product ID 0x87a0
(with-open-usb (s #x10c4 :product-id #x87a0)
  (let ((buf (make-array 4 :element-type '(unsigned-byte 8))))
    (usb-control-msg s #xc0 #x22 0 0 buf)))
```  

### API Reference

#### `with-open-usb` (macro)

Opens a USB device by scanning for matching vendor and product IDs.

**Syntax:**
```common-lisp
(with-open-usb (stream vendor-id &key (product-id 0)) &body body)
```

**Parameters:**
- `stream` - Symbol bound to the USB file stream
- `vendor-id` - USB vendor ID (16-bit unsigned integer)
- `product-id` - USB product ID (16-bit unsigned integer, optional)  

#### `usb-control-msg` (function)

Sends a synchronous USB control transfer.

**Syntax:**
```common-lisp
(usb-control-msg stream requesttype request value index buffer &key (timeout-ms 1000))
```

**Returns:** Buffer with response data and timestamp in nanoseconds  

#### `usb-bulk-transfer` (function)

Initiates a synchronous USB bulk transfer (read or write depending on endpoint).

**Syntax:**
```common-lisp
(usb-bulk-transfer stream ep buffer &key (timeout-ms 1000))
```

**Parameters:**
- `ep` - Endpoint number (bit 7 determines direction: 0=OUT, 1=IN)
- `buffer` - Byte array for data transfer 

#### `usb-urb-bulk-async` (function)

Submits an asynchronous USB bulk transfer using URBs (USB Request Blocks).

#### `usb-urb-reap-ndelay` (function)

Reaps completed asynchronous URBs without blocking.

## How It Works

The library operates by:

1. **Device Discovery:** Scanning `/sys/bus/usb/devices/` to find USB devices by vendor/product ID 

2. **Direct File Access:** Opening `/dev/bus/usb/BUS/DEV` as a file stream 

3. **ioctl Communication:** Using ioctl system calls with Linux USB device filesystem structures 

4. **Memory Pinning:** Leveraging SBCL's `sb-sys:with-pinned-objects` to ensure buffer stability during transfers

## FFI Generation

The library uses c2ffi and cl-autowrap to parse Linux USB headers and generate Foreign Function Interface bindings. Pre-generated bindings for AMD64 are included, so c2ffi is only required for other architectures. 

The FFI generation process is defined in:

## Debugging

For debugging and protocol verification:

```bash
# Load USB monitoring module
sudo modprobe usbmon

# Use Wireshark to capture USB traffic
wireshark
```  

## Documentation Updates

This README is generated using MGL-PAX. To update documentation after modifying docstrings or adding functions:

1. Load `gendoc.lisp`
2. Call `(update-markdown-readme)`  

## Technical Details

### Why SBCL-Specific?

The library relies on SBCL-specific features:
- `sb-sys:with-pinned-objects` - Prevents garbage collector from moving memory during USB transfers
- `sb-sys:vector-sap` - Obtains System Area Pointers to byte arrays for direct memory access

### Why No libusb?

This library demonstrates that libusb isn't strictly necessary for USB communication on Linux. By directly using the kernel's usbdevfs interface, it:
- Reduces dependencies
- Provides more direct control over USB operations
- Serves as an educational example of low-level USB programming
