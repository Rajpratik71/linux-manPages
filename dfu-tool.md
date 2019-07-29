DFU-TOOL(1)                                                                                  User Commands                                                                                 DFU-TOOL(1)

NAME
       dfu-tool - dfu-tool

DESCRIPTION
       This manual page documents briefly the dfu-tool command.

       dfu-tool allows a user to write various kinds of firmware onto devices supporting the USB Device Firmware Upgrade protocol.  This tool can be used to switch the device from the normal runtime
       mode to `DFU mode' which allows the user to read and write firmware.  Either the whole device can be written in one operation, or individual `targets' can be specified  with  the  alternative
       name or number.

       dfu-tool uses the libdfu shared library to perform actions.  All synchronous actions can be safely cancelled and on failure will return errors with both a type and a full textual description.
       libdfu supports DFU 1.0, DFU 1.1 and the ST DfuSe vendor extension, and handles many device `quirks' necessary for the real-world implementations of DFU.

       Additionally dfu-tool can be used to convert firmware from various different formats, or to modify details about the elements, images and metadata contained inside  the  firmware  file.   For
       example,  you can easily convert DFU 1.1 firmware into the vendor-specific DfuSe format, convert a Intel HEX file into a raw file padded to a specific size, or add new copyright and licensing
       information to an existing file.  Fields such as the vendor and product IDs can be changed, and the firmware elements can be encrypted and decrypted using various different methods.   Merging
       two DfuSe files together is also possible, although specifying different alt-setting numbers before merging is a good idea to avoid confusion.

       Although  dfu-tool tries to provide a large number of easy-to-use commands, it may only be possible to do certain operations using the libdfu library directly.  This is easier than it sounds,
       as the library is built with GObject Introspection support making it usable in many languages such as C, Javascript and Python.  Furthermore, using the library is a good idea if you  want  to
       perform  multiple operations on large firmware files, for instance, converting from an Intel HEX file, padding to a certain size, setting vendor and adding licensing information and then sav‐
       ing to a remote location.

   Usage:
              dfu-tool [OPTION?]

       attach Attach DFU capable device back to runtime

       convert FORMAT FILE-IN FILE OUT [SIZE]
              Convert firmware to DFU format

       decrypt FILENAME-IN FILENAME-OUT TYPE KEY
              Decrypt firmware data

       detach Detach currently attached DFU capable device

       dump FILENAME
              Dump details about a firmware file

       encrypt FILENAME-IN FILENAME-OUT TYPE KEY
              Encrypt firmware data

       list   List currently attached DFU capable devices

       merge FILE-OUT FILE1 FILE2 [FILE3...]
              Merge multiple firmware files into one

       patch-apply
              Apply a binary patch

       patch-create
              Create a binary patch using two files

       patch-dump
              Dump information about a binary patch to the screen

       read FILENAME
              Read firmware from device into a file

       read-alt FILENAME DEVICE-ALT-NAME|DEVICE-ALT-ID
              Read firmware from one partition into a file

       replace-data
              Replace data in an existing firmware file

       reset  Reset a DFU device

       set-address FILE ADDRESS
              Set element address on firmware file

       set-alt-setting FILE ALT-ID
              Set alternative number on firmware file

       set-alt-setting-name FILE VALUE
              Set alternative name on firmware file

       set-metadata FILE KEY VALUE
              Sets metadata on a firmware file

       set-product FILE PID
              Set product ID on firmware file

       set-release FILE RELEASE
              Set release version on firmware file

       set-target-size FILE SIZE
              Set the firmware size for the target

       set-vendor FILE VID
              Set vendor ID on firmware file

       watch  Watch DFU devices being hotplugged

       write  Write firmware from file into device

       write-alt FILENAME DEVICE-ALT-NAME|DEVICE-ALT-ID [IMAGE-ALT-NAME|IMAGE-ALT-ID]
              Write firmware from file into one partition

   Help Options:
       -h, --help
              Show help options

   Application Options:
       --version
              Print the version number

       -v, --verbose
              Print verbose debug statements

       -d, --device=VID:PID
              Specify Vendor/Product ID(s) of DFU device

       -t, --transfer-size=BYTES
              Specify the number of bytes per USB transfer

       --force
              Force the action ignoring all warnings

dfu-tool 1.0.9                                                                               October 2018                                                                                  DFU-TOOL(1)
