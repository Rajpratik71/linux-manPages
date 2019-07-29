arm2hpdl(1)                                                                             General Commands Manual                                                                            arm2hpdl(1)

NAME
       arm2hpdl - Add HP download header/trailer to an ARM ELF binary.

SYNOPSIS
       arm2hpdl [options] arm-binary.img > hpdl.dl

DESCRIPTION
       arm2hpdl adds an HP download header/trailer to an ARM ELF binary.  If the file already has an HP header, just copy it to stdout.

COMMAND LINE OPTIONS
       These are the options that can appear on the command line.

       -D level
              Set Debug level [0].

EXAMPLES
       Add an HPDL header to a HP LaserJet 1005.

       $ arm2hpdl sihp1005.img > sihp1005.dl

FILES
       /usr/bin/arm2hpdl, /lib/firmware/hp/*

SEE ALSO
       foo2zjs(1)

AUTHOR
       Rick Richardson <rick.richardson@comcast.net>
       http://foo2zjs.rkkda.com/

