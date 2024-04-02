ppt2text(1)                                                   General Commands Manual                                                  ppt2text(1)

NAME
       catppt - reads MS-PowerPoint file and puts its content on standard output

SYNOPSIS
       catppt [-lV] [-b  string ] [-s  charset ] [-d  charset ] files

DESCRIPTION
       catppt reads MS-PowerPoint presentations and dumps its content to stdout.

OPTIONS
       -l      list known charsets and exit successfully

       -bstring
               slides break string. This string (by default - formfeed) would be output at the end of each slide page.

       -dcharset`
               -  specifies  destination  charset  name.  Charset file has format described in CHARACTER SETS section of catdoc(1) manual page. By
               default, current locale charset would be used if langinfo support was enabled at the compile time.

       -scharset
               - specifies source charset. Typically, PowerPoint files use UNICODE strings with known charsets, but for some reason you  may  wish
               to override it.

       -V      outputs version number

SEE ALSO
       cat(1), catdoc(1), xls2csv(1), strings(1), utf(4), unicode(4)

AUTHOR
       Alex Ott <alexott@gmail.com>

MS-PowerPoint reader                                              Version 0.94.3                                                       ppt2text(1)
