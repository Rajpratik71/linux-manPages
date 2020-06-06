ZIPMERGE(1)                                                                                General Commands Manual                                                                                ZIPMERGE(1)



NAME
       zipmerge - merge zip archives

SYNOPSIS
       zipmerge [-DhIiSsV] target-zip source-zip Op source-zip ...

DESCRIPTION
       zipmerge  merges  the source zip archives source-zip into the target zip archive target-zip.  By default, files in the source zip archives overwrite existing files of the same name in the target zip
       archive.

       Supported options:

              -D   Ignore directory components in file name comparisons.

              -h   Display a short help message and exit.

              -I   Ignore case in file name comparisons

              -i   Ask before overwriting files.  See also -s.

              -S   Do not overwrite files that have the same size and CRC32 in both the source and target archives.

              -s   When -i is given, do not before overwriting files that have the same size and CRC32.

              -V   Display version information and exit.

EXIT STATUS
       zipmerge exits 0 on success and 1 if an error occurred.

SEE ALSO
       zipcmp(1), ziptorrent(1), libzip(3)

AUTHORS
       Dieter Baron <dillo@giga.or.at> and Thomas Klausner <tk@giga.or.at>



NiH                                                                                              June 4, 2008                                                                                     ZIPMERGE(1)
