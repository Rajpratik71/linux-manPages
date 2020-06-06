NTFSLABEL(8)                                                                             System Manager's Manual                                                                             NTFSLABEL(8)

NAME
       ntfslabel - display/change the label on an ntfs file system

SYNOPSIS
       ntfslabel [options] device [new-label]

DESCRIPTION
       ntfslabel will display or change the file system label on the ntfs file system located on device.  It can also change the serial number of the device.

       If the optional argument new-label is not present, and no option is present, ntfslabel will simply display the current file system label.

       If the optional argument new-label is present, then ntfslabel will set the file system label to be new-label.  NTFS file system labels can be at most 128 Unicode characters long; if new-label is
       longer than 128 Unicode characters, ntfslabel will truncate it and print a warning message.

       It is also possible to set the file system label using the -L option of mkntfs(8) during creation of the file system.

OPTIONS
       Below is a summary of all the options that ntfslabel accepts.  Nearly all options have two equivalent names.  The short name is preceded by - and the long name is preceded  by  --.   Any  single
       letter options, that don't take an argument, can be combined into a single command, e.g.  -fv is equivalent to -f -v.  Long named options can be abbreviated to any unique prefix of their name.

       -f, --force
              This will override some sensible defaults, such as not working with a mounted volume.  Use this option with caution.

       -h, --help
              Show a list of options with a brief description of each one.

       --new-serial[=ssssssssssssssss], or

       --new-half-serial[=ssssssss]
              Set a new serial number to the device, either the argument value, or a random one if no argument is given. The serial number is a 64 bit number, represented as a sixteen-digit hexadecimal
              number, used to identify the device during the mounting process. As a consequence, two devices with the same serial number cannot be mounted at the same time on the same  computer.   This
              is not the volume UUID used by Windows to locate files which have been moved to another volume.

              The  option --new-half-serial only changes the upper part of the serial number, keeping the lower part which is used by Windows unchanged.  In this case the optional argument is an eight-
              digit hexadecimal number.

       -n, --no-action
              Don't actually write to disk.

       -q, --quiet
              Reduce the amount of output to a minimum.

       -v, --verbose
              Increase the amount of output that ntfslabel prints. The label and the serial number are displayed.

       -V, --version
              Show the version number, copyright and license for ntfslabel.

BUGS
       There are no known problems with ntfslabel.  If you find a bug please send an email describing the problem to the development team:
       ntfs-3g-devel@lists.sf.net

AUTHORS
       ntfslabel was written by Matthew J. Fanto, with contributions from Anton Altaparmakov and Richard Russon.  It was ported to ntfs-3g by Erik Larsson.

AVAILABILITY
       ntfslabel is part of the ntfs-3g package and is available from:
       http://www.tuxera.com/community/

SEE ALSO
       mkntfs(8), ntfsprogs(8)

ntfs-3g 2015.3.14AR.1                                                                          January 2012                                                                                  NTFSLABEL(8)
