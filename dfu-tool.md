DFU-TOOL(1)                                                                                                                                                                                   DFU-TOOL(1)

NAME
       dfu-tool - Device Firmware Upgrade Tool

SYNOPSIS
       dfu-tool [ --verbose ] [ --version ] [ --force ] [ --device=VID:PID ] [ --transfer-size=BYTES ]

DESCRIPTION
       This manual page documents briefly the dfu-tool command.

       dfu-tool  allows  a  user to write various kinds of firmware onto devices supporting the USB Device Firmware Upgrade protocol.  This tool can be used to switch the device from the normal runtime
       mode to `DFU mode' which allows the user to read and write firmware.  Either the whole device can be written in one operation, or individual `targets' can be specified with the alternative  name
       or number.

       dfu-tool  uses  the  libdfu shared library to perform actions.  All synchronous actions can be safely cancelled and on failure will return errors with both a type and a full textual description.
       libdfu supports DFU 1.0, DFU 1.1 and the ST DfuSe vendor extension, and handles many device `quirks' necessary for the real-world implementations of DFU.

       Additionally dfu-tool can be used to convert firmware from various different formats, or to modify details about the elements, images and metadata contained inside the firmware file.  For  exam‐
       ple,  you can easily convert DFU 1.1 firmware into the vendor-specific DfuSe format, convert a Intel HEX file into a raw file padded to a specific size, or add new copyright and licensing infor‐
       mation to an existing file.  Fields such as the vendor and product IDs can be changed, and the firmware elements can be encrypted and decrypted using  various  different  methods.   Merging  two
       DfuSe files together is also possible, although specifying different alt-setting numbers before merging is a good idea to avoid confusion.

       Although  dfu-tool tries to provide a large number of easy-to-use commands, it may only be possible to do certain operations using the libdfu library directly.  This is easier than it sounds, as
       the library is built with GObject Introspection support making it usable in many languages such as C, Javascript and Python.  Furthermore, using the library is a good idea if you want to perform
       multiple  operations  on  large  firmware  files, for instance, converting from an Intel HEX file, padding to a certain size, setting vendor and adding licensing information and then saving to a
       remote location.

OPTIONS
       This program follows the usual GNU command line syntax, with long options starting with two dashes (-).  A summary of options is included below.

                 --help
              Show summary of all the commands available for use.

                 --version
              Show the version of dfu-tool installed.

                 --verbose
              Show extra debugging information.

                 --device=VID:PID
              If multiple DFU-capable devices are attached you can specify the specific vendor and product ID of the DFU device you want to query.

                 --transfer-size=BYTES
              Manually override the size of each USB transfer, which you may want for unreliable hardware or when the device lies about the maximum packet size it accepts.

                 --force
              Force the operation, disregarding warnings or sanity checks like file CRC and checksums.  This is useful if you really know what you are doing, or in the specialised case of  fuzz-testing
              libdfu.

DEVICE COMMANDS
       These commands are used to interface with DFU-capable devices.

                 list
              This command lists currently attached DFU capable devices.  Some devices do not support the official DFU runtime mode and thus do not support auto-discovery using this command.  For those
              devices, putting the device into DFU mode manually (e.g. by holding a button down when rebooting the device) will make it show up here.

                 detach
              This command detaches the currently attached DFU capable device into a special programming mode.  Whilst the device is in this special DFU mode it can not be used as a normal device.  For
              example, a printer will not accept documents when in DFU mode.

                 attach
              This command attaches a DFU capable device back to runtime so it can be used as a normal device.  Some devices do not support attaching, and need to be manually disconnected and connected
              before changing modes.

                 watch
              This command watches DFU devices being hotplugged and can be used to verify libdfu matches up the runtime and DFU modes when attaching and detaching.  Use  CTRL+C  to  make  this  command
              quit.

                 read FILENAME
              This  command  uploads all the firmware from device into a file.  If the device has multiple partitions exported as different alternative sections then they will all be read into a multi-
              image DfuSe-format file.  If you just want the contents of one partition, read-alt is the command you want.

                 read-alt FILENAME DEVICE-ALT-NAME|DEVICE-ALT-ID
              This command uploads firmware from one partition into a file.  You can specify the partition by either the ALT-ID or ALT-NAME if set.

              e.g. dfu-tool read-alt backup.dfu SRAM

                 write
              This command downloads firmware from a file into all possible partitions of a device.  If you only want to write one partition, write-alt is the command you want.

                 write-alt FILENAME DEVICE-ALT-NAME|DEVICE-ALT-ID [IMAGE-ALT-NAME|IMAGE-ALT-ID]
              This command downloads firmware from the file into one partition.  You can specify the partition by either the ALT-ID or ALT-NAME if set.

              e.g. dfu-tool write-alt sram.dfu SRAM __SRAM

FIRMWARE COMMANDS
       These commands are used to read and modify existing firmware files.

                 dump FILENAME
              This command dumps all know details about a firmware file.  The complete memory map is shown, along with any metadata or vendor information about the firmware file.

                 convert FORMAT FILE-IN FILE-OUT [SIZE]
              This command converts the firmware from one format to another, optionally padding to a certain size.  Possible values for the destination FORMAT include: raw, ihex, dfu  and  dfuse.   The
              FILE-IN  and  FILE-OUT  values  can  be  the  same if the source file is to be overwritten.  Although padding increases the file size with no apparent advantages it can be used to support
              devices that do not store the runtime image size and where validation of the written firmware is required.

              e.g. dfu-tool convert dfu firmware.hex firmware.dfu 8000

                 encrypt FILENAME-IN FILENAME-OUT TYPE KEY
              This command encrypts firmware data.  Only the image contents are actually modified, the DFU footer and DfuSe header are left unaltered.  Possible values for the destination TYPE include:
              xtea and nop.  If the KEY is not of the required length it is used as an input to a hash function which can produce a key of the required size.

              e.g. dfu-tool encrypt firmware.dfu firmware.xdfu xtea deadbeef

                 decrypt FILENAME-IN FILENAME-OUT TYPE KEY
              This command decrypts firmware data.  Only the image contents are actually modified, the DFU footer and DfuSe header are left unaltered.  Possible values for the destination TYPE include:
              xtea and nop.  If the KEY is not of the required length it is used as an input to a hash function which can produce a key of the required size.

              e.g. dfu-tool decrypt firmware.xdfu firmware.dfu xtea deadbeef

                 merge FILE-OUT FILE1 FILE2 [FILE3...]
              This command merges multiple firmware files into one file.  Although you can merge files with the same ALT-ID or ALT-NAME this probably isn't what you want to do.

              e.g. dfu-tool merge combined.dfu lib.dfu app.dfu

                 set-alt-setting FILE ALT-ID
              This command modifies the alternative number on firmware file.

              e.g. dfu-tool set-alt-setting firmware.dfu 1

                 set-alt-setting-name
              This command modifies the alternative name on firmware file.

              e.g. dfu-tool set-alt-setting-name firmware.dfu SRAM

                 set-metadata FILE KEY VALUE
              This command adds or modifies existing metadata on a firmware file.  NOTE: There is only very limited metadata storage space in DFU files, so keys and values should be kept  as  short  as
              possible.  In particular, the License value should be specified in SPDX format.

              e.g. dfu-tool set-metadata firmware.dfu Licence GPL-2.0+

                 set-vendor FILE VID
              This command sets vendor ID on a firmware file that will be used to match specific devices.  Values of ffff will match any device vendor.

              e.g. dfu-tool set-vendor firmware.dfu 273f

                 set-product FILE PID
              This command sets the product ID on a firmware file that will be used to match specific devices.  Values of ffff will match any device product.

              e.g. dfu-tool set-product firmware.dfu 1004

                 set-release FILE RELEASE
              This command sets the release version on firmware file that will be used to match specific devices.  Values of ffff will match any device release.

              e.g. dfu-tool set-release firmware.dfu ffff

AUTHOR
       This manual page was written by Richard Hughes <richard@hughsie.com>.

                                                                                             26 February,2015                                                                                 DFU-TOOL(1)
