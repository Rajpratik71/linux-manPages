cramfsswap(1)                                                      User Manuals                                                      cramfsswap(1)

NAME
       cramfsswap - swap endianess of a cram filesystem (cramfs)

SYNOPSIS
       cramfsswap <infile> <outfile>

DESCRIPTION
       cramfs  is  a highly compressed and size optimized linux filesystem which is mainly used for embedded applications. the problem with cramfs
       is that it is endianess sensitive, meaning you can't mount a cramfs for a big endian target on a little endian machine and vice versa. this
       is often especially a problem in the development phase.

       cramfsswap solves that problem by allowing you to swap to endianess of a cramfs filesystem.

AUTHOR
       Michael Holzt <kju@debian.org>

VERSION
       20050104

Linux                                                               4 Jan 2005                                                       cramfsswap(1)
