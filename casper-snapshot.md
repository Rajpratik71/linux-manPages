CASPER-SNAPSHOT(1)                                                 User commands                                                CASPER-SNAPSHOT(1)

NAME
       casper-snapshot - a simple script to ease persistence usage.

SYNOPSIS
       casper-snapshot [-c|--cow DIRECTORY] [-d|--device DEVICE] [-e|--exclude-list FILE] [-o|--output FILE] [-t|--type TYPE]

       casper-snapshot -r|--resync-string STRING
       casper-snapshot -h|--help
       casper-snapshot -u|--usage
       casper-snapshot -v|--version

DESCRIPTION
       Casper-snapshot  is  a  script which can be used to build the right types of persistent image files supported by casper. It is also used on
       exit by the casper init script to resync the boot-found snapshots devices.

OPTIONS
       -c, --cow DIRECTORY
              specifies the input directory to be cloned in the image file.  Its default value "/cow" should be right for most  uses.  However  it
              could  be  handy  to  specify "/home" and type ext2 for the type to prepare an image file suited to be directly mounted by casper as
              home.

       -d, --device DEVICE
              sets the device where the media which the snapshot/persistence file/partition will be put. If it is not specified, a tmpfs  will  be
              used  and  linked to the user's desktop to move it where it is needed. If the device has no filesystem, an ext2 fs will be automati‐
              cally created and labelled according to the values specified after the "--output" value or with a sane default.

       -e, --exclude-list FILE
              a file containing a list of filenames/paths that should not be saved. This exclude list will be remebered  on  the  target  snapshot
              media for reuse.

       -o, --output FILE
              the filename/label used for the output file/partition. If left blank, casper-snapshot will search for a proper file on the device or
              use the whole partition.

       -r, --resync-string STRING
              internally used on resyncs.

       -t, --type TYPE
              Type could be one of "cpio", "squashfs" or "ext2".

BUGS
       casper-snapshot Time (and BTS) will tell.

HOMEPAGE
       Debian Live project <http://live.debian.net/>

SEE ALSO
       casper(7)

AUTHOR
       casper-snapshot was written Marco Amadori <marco.amadori@gmail.com>.

       This manual page was written by Marco Amadori <marco.amadori@gmail.com>,
              for the Debian project (but may be used by others).

0.0.1                                                            Thu,  28 Sep 2006                                              CASPER-SNAPSHOT(1)
