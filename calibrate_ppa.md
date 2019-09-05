calibrate_ppa(8)                                                                        System Manager's Manual                                                                       calibrate_ppa(8)

NAME
       calibrate_ppa - pnm2ppa calibration tool

SYNOPSIS
       calibrate_ppa [options]

DESCRIPTION
       Produces various PixMap (PPM) files used for calibrating pnm2ppa.

       This manual page was written for the Debian GNU/Linux distribution because the original program does not have a manual page.

NOTE
       The  size  of  a   full-page PixMap is 100MB!!.  These PixMaps should be piped directly to pnm2ppa, except in the case of the  -g option, where the PixMap should be viewed or printed by other
       means.

OPTIONS
       -g, --gamma
              produce  gamma.ppm (10MB, used in color calibration).

       -h, --help
              displays this help text.

       -o <outfile>
              output to file <outfile>, "-o -" means stdout (default)

       -p <n> create test pattern number <n>

       --align
              pattern 0:  align print heads. (default)

       --test pattern 1:  test alignment.

       --clean
              pattern 2:  clean print head.

       --center
              pattern 3:  center paper.

       -s <paper>
              default papersize (a4, legal, letter = us (default))

AUTHOR
       This manual page was written by Chad C. Walstrom <chewie@debian.org>, for the Debian GNU/Linux system (but may be used by others).

SEE ALSO
       pnm2ppa(1), magicfilter(8), apsfilter(8)

                                                                                           November 05, 2000                                                                          calibrate_ppa(8)
