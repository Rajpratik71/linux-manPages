ZGZ(1)                                                                  zgz                                                                 ZGZ(1)

NAME
       zgz - Frankenstein's compressor

SYNOPSIS
       zgz [options] < file > file.gz

DESCRIPTION
       This program is an unholy combination of the BSD gzip program, a modified GNU gzip that supports setting an arbitrary file name and
       timestamp, and an old, rotting version of bzip2 that we dug up somewhere at midnight.  Only the bits to do with file compression were kept.

       There are many arcane options which aid pristine-gz(1) in re-animating files. Use --help to see all the gory details.

AUTHOR
       Matthew R. Green, Jean-loup Gailly, Julian R Seward, Faidon Liambotis, Josh Triplett, Joey Hess

       Note that several of the above donors would be very suprised at finding parts of themselves ... er, their work ... shambling around here.
       Please direct correspondence and/or flaming pitchforks to the pristine-tar maintainers.

perl v5.22.1                                                        2017-09-17                                                              ZGZ(1)
