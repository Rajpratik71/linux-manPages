ZIPCMP(1)                                                                                  General Commands Manual                                                                                  ZIPCMP(1)



NAME
       zipcmp - compare contents of zip archives

SYNOPSIS
       zipcmp [-hiqVv] zip1 zip2

DESCRIPTION
       zipcmp  compares  the  zip  archives  zip1  and  zip2  and checks if they contain the same files, comparing their names, uncompressed sizes, and CRCs.  File order and compressed size differences are
       ignored.

       Supported options:

              -h   Display a short help message and exit.

              -i   Compare names ignoring case distinctions.

              -q   Quiet mode.  Compare -v.

              -v   Verbose mode.  Print details about differences to stdout.  (This is the default.)

              -V   Display version information and exit.

EXIT STATUS
       zipcmp exits 0 if the two zip archives contain the same files, 1 if they differ, and 1 if an error occurred.

SEE ALSO
       zipmerge(1), ziptorrent(1), libzip(3)

AUTHORS
       Dieter Baron <dillo@giga.or.at> and Thomas Klausner <tk@giga.or.at>



NiH                                                                                              June 4, 2008                                                                                       ZIPCMP(1)
