<a id='x-28NATIVE-USB-3A-40NATIVE-USB-MANUAL-20MGL-PAX-3ASECTION-29'></a>

# Native USB manual

## Table of Contents


###### \[in package NATIVE-USB\]
Make sure your user has read and write permissions for the USB device, e.g.:

```
crw-rw-rw- 1 root root 189, 1 May 23 14:49 /dev/bus/usb/001/002
```

Open the a USB stream using the macro `WITH-OPEN-USB` and send control
or bulk messages.

<a id='x-28NATIVE-USB-3AUSB-CONTROL-MSG-20FUNCTION-29'></a>

- [function] **USB-CONTROL-MSG** *STREAM REQUESTTYPE REQUEST VALUE INDEX BUFFER &KEY (TIMEOUT-MS 1000)*

    Send a synchronous control message.

<a id='x-28NATIVE-USB-3AUSB-BULK-TRANSFER-20FUNCTION-29'></a>

- [function] **USB-BULK-TRANSFER** *STREAM EP BUFFER &KEY (TIMEOUT-MS 1000)*

    Initiate a synchronous USB bulk transfer (read or write, depending on `EP`).
