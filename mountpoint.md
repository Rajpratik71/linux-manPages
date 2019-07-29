MOUNTPOINT(1)                   User Commands                   MOUNTPOINT(1)

NAME
       mountpoint - see if a directory or file is a mountpoint

SYNOPSIS
       mountpoint [-d|-q] directory | file

       mountpoint -x device

DESCRIPTION
       mountpoint  checks whether the given directory or file is mentioned in
       the /proc/self/mountinfo file.

OPTIONS
       -d, --fs-devno
              Show the major/minor numbers of the device that is  mounted  on
              the given directory.

       -q, --quiet
              Be quiet - don't print anything.

       -x, --devno
              Show  the major/minor numbers of the given blockdevice on stan‐
              dard output.

       -V, --version
              Display version information and exit.

       -h, --help
              Display help text and exit.

EXIT STATUS
       Zero if the directory or file is a mountpoint, non-zero if not.

AUTHOR
       Karel Zak <kzak@redhat.com>

ENVIRONMENT
       LIBMOUNT_DEBUG=all
              enables libmount debug output.

NOTES
       The util-linux mountpoint implementation was written from scratch  for
       libmount.   The  original  version  for  sysvinit suite was written by
       Miquel van Smoorenburg.

SEE ALSO
       mount(8)

AVAILABILITY
       The mountpoint command is part of the util-linux package and is avail‐
       able from https://www.kernel.org/pub/linux/utils/util-linux/.

util-linux                        July 2014                     MOUNTPOINT(1)
