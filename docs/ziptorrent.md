ZIPTORRENT(1)                                                                              General Commands Manual                                                                              ZIPTORRENT(1)



NAME
       ziptorrent - torrentzip zip archives

SYNOPSIS
       ziptorrent [-hnVv] archive Op ...

DESCRIPTION
       ziptorrent  torrentzips  archive.  This is a restricted file format used for using bittorrent on zip files.  Please see zip_set_archive_flag(3) for details on what information gets lost through this
       process.

       Supported options:

              -h   Display a short help message and exit.

              -n   Don't actually change archives, just print what would be done.

              -V   Display version information and exit.

              -v   Be verbose: print which archives are already torrentzipped and which need to be rezipped.

EXIT STATUS
       ziptorrent exits 0 on success and 1 if an error occurred.

SEE ALSO
       zipcmp(1), zipmerge(1), libzip(3)

AUTHORS
       Dieter Baron <dillo@giga.or.at> and Thomas Klausner <tk@giga.or.at>



NiH                                                                                             July 24, 2008                                                                                   ZIPTORRENT(1)
