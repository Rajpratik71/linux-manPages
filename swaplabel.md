SWAPLABEL(8)                System Administration                SWAPLABEL(8)

NAME
       swaplabel - print or change the label or UUID of a swap area

SYNOPSIS
       swaplabel [-L label] [-U UUID] device

DESCRIPTION
       swaplabel will display or change the label or UUID of a swap partition
       located on device (or regular file).

       If the optional arguments -L and -U are not given, swaplabel will sim‐
       ply display the current swap-area label and UUID of device.

       If  an  optional  argument  is present, then swaplabel will change the
       appropriate value on device.  These values can also be set during swap
       creation  using mkswap(8).  The swaplabel utility allows to change the
       label or UUID on an actively used swap device.

OPTIONS
       -h, --help
              Display help text and exit.

       -L, --label label
              Specify a new label for the device.  Swap partition labels  can
              be  at  most  16  characters  long.  If label is longer than 16
              characters, swaplabel will truncate it and print a warning mes‐
              sage.

       -U, --uuid UUID
              Specify  a  new  UUID for the device.  The  UUID must be in the
              standard 8-4-4-4-12 character format,  such  as  is  output  by
              uuidgen(1).

AUTHOR
       swaplabel was written by Jason Borden <jborden@bluehost.com> and Karel
       Zak <kzak@redhat.com>.

ENVIRONMENT
       LIBBLKID_DEBUG=all
              enables libblkid debug output.

AVAILABILITY
       The swaplabel command is part of the util-linux package and is  avail‐
       able from https://www.kernel.org/pub/linux/utils/util-linux/.

SEE ALSO
       uuidgen(1), mkswap(8), swapon(8)

util-linux                        April 2010                     SWAPLABEL(8)
