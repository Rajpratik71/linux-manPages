xls2csv(1)                                                    General Commands Manual                                                   xls2csv(1)

NAME
       xls2csv - reads MS-Excel file and puts its content as comma-separated data on standard output

SYNOPSIS
       xls2csv [-xlV] [-f  format ] [-b  string ] [-s  charset ] [-d  charset ] [-q  number ] [-c  char] files

DESCRIPTION
       xls2csv  reads  MS-Excel  spreadsheet  and  dumps  its content as comma-separated values to stdout. Numbers are printed without delimiters,
       strings are enclosed in the double quotes. Double-quotes inside string are doubled.

OPTIONS
       -x      print unknown Unicode chars as \xNNNN, rather than as question marks

       -l      list known charsets and exit successfully

       -cchar  cell separator char. By default - comma.

       -bstring
               sheet break string. This string (by default - formfeed) would be output at the end of each workbook page. This  string  is  printed
               after page starting at start of line, but no linefeed would be automatically added at the end of string. Include newline at the ent
               of sheet separator if you want it to appear on separate line by itself

       -gnumber number of decimal digits in the numbers. By default maximal double precision (system-dependent macro DBL_DIG) is used.

       -qnumber
               set quote mode. In quote mode 0 cell contents is never quoted.  In quote mode 1 only strings which contain spaces, double quotes or
               commas are quoted.  In quote mode 2 (default) all cells with type string are quoted.  In quote mode 3 all cells are quoted.

       -dcharset`
               -  specifies  destination  charset  name.  Charset file has format described in CHARACTER SETS section of catdoc(1) manual page. By
               default, current locale charset would be used if langinfo support was enabled at the compile time.

       -scharset
               - specifies source charset. Typically, Excel files have CODE PAGE record, which denotes input charset, but for some reason you  may
               wish to override it.

       -fformat
               - specifies date/time format to use for output of all Excel date and time  values.  If this option is not specified, format, speci‐
               fied in the spreadsheet is used. On POSIX system any format, allowed by strftime(3) can be used as value of this option. Under  MS-
               DOS xls2csv implements limited set of strftime formats, namely m, d, y, Y, b, l, p, H, M, S.

       -V      outputs version number

FILES
       ${HOME}/.catdocrc, catdoc charset files and substitution map files (see catdoc(1) manual page for details,

SEE ALSO
       cat(1), catdoc(1), catppt(1), strings(1), utf(4), unicode(4)

AUTHOR
       V.B.Wagner <vitus@45.free.net>, based on biffview by David Rysdam

MS-Word reader                                                    Version 0.94.3                                                        xls2csv(1)
