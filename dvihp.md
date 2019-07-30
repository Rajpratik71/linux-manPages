DVIHP(1)                                                                         General Commands Manual                                                                         DVIHP(1)

NAME
       dvihp - convert a TeX DVI file to Hewlett-Packard PCL

SYNOPSIS
       dvihp [options] dvifile[.dvi]

DESCRIPTION
       dvihp translates the given dvifile to Hewlett-Packard PCL using dvicopy(1) then $DVILJ (dvilj4 by default).

       In the absence of other options, pipe the PCL to $SPOOL (lpr by default).

OPTIONS
       Options are recognized from dvips where possible:

       -A     print odd pages

       -B     print even pages

       -d n   set debug bits to n (see documentation)

       -D n   set resolution to n

       -f     run as filter

       -l n   don't print pages after n

       -m     manual feed

       -n n   print n pages

       -O a,b set/change paper offset to a,b mm.

       -o s   output to s instead of spooling

       -p n   don't print pages before n.

       -Ps    pass directly to lpr.

       -v     verbose operation.

       -x n   set magnification to n.

       --help write usage summary.

       Other options are passed to the dvilj program.

BUGS
       Email bug reports to tex-k@tug.org.

SEE ALSO
       dvicopy(1), dvilj4(1).

                                                                                    December 24, 2009                                                                            DVIHP(1)
