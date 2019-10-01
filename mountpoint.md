MOUNTPOINT(1)                                                                                   User Commands                                                                                   MOUNTPOINT(1)



NAME
       mountpoint - see if a directory is a mountpoint

SYNOPSIS
       mountpoint [-q] [-d] directory

       mountpoint -x device


DESCRIPTION
       mountpoint checks if the directory is mentioned in the /proc/self/mountinfo file.

OPTIONS
       -h, --help
              Print help and exit.

       -q, --quiet
              Be quiet - don't print anything.

       -d, --fs-devno
              Print major/minor device number of the filesystem on stdout.

       -x, --devno
              Print major/minor device number of the blockdevice on stdout.

EXIT STATUS
       Zero if the directory is a mountpoint, non-zero if not.

AUTHOR
       Karel Zak <kzak@redhat.com>

ENVIRONMENT
       LIBMOUNT_DEBUG=0xffff
              enables debug output.

NOTES
       The util-linux mountpoint implementation was written from scratch for libmount. The original version for sysvinit suite was written by Miquel van Smoorenburg.


SEE ALSO
       mount(8)

AVAILABILITY
       The mountpoint command is part of the util-linux package and is available from ftp://ftp.kernel.org/pub/linux/utils/util-linux/.




util-linux                                                                                        June 2011                                                                                     MOUNTPOINT(1)
