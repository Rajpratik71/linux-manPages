GRUB-PROBE(3)                                                                              Library Functions Manual                                                                             GRUB-PROBE(3)



NAME
       grub-probe — Probe device information for a given path.


SYNOPSIS
       grub-probe  [-m | --device-map=FILE]
                   [-t | --target=(fs|fs_uuid|fs_label|drive|device|partmap|
                                   abstraction|cryptodisk_uuid|
                                   msdos_parttype)]
                   [-v | --verbose] (PATH|DEVICE)


DESCRIPTION
       grub-probe probes a path or device for filesystem and related information.


OPTIONS
       --device
              Final option represents a DEVICE, rather than a filesystem PATH.

       --device-map=FILE
              Use FILE as the device map.  The default value is /boot/grub/device.map.


       --target=(fs|fs_uuid|fs_label|drive|device|partmap|msdos_parttype)
              Select among various output definitions.  The default is fs.

              fs     filesystem module


              fs_uuid
                     filesystem UUID


              fs_label
                     filesystem label


              drive  GRUB drive name


              device System device


              partmap
                     partition map module


              abstraction
                     abstraction module


              cryptodisk_uuid
                     cryptographic container


              msdos_partmap
                     MS-DOS partition map


       --verbose
              Print verbose output.


       (PATH|DEVICE)
              If --device is passed, a block DEVICE.  Otherwise, the PATH of a file on the filesystem.


SEE ALSO
       info grub



                                                                                               Wed Feb 26 2014                                                                                  GRUB-PROBE(3)
