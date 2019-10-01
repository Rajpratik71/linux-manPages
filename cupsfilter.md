cupsfilter(8)                                                                                     Apple Inc.                                                                                    cupsfilter(8)



NAME
       cupsfilter - convert a file to another format using cups filters

SYNOPSIS
       cupsfilter  [  -D  ]  [ -U user ] [ -c config-file ] [ -d printer ] [ -e ] [ -i mime/type ] [ -j job-id[,N] ] [ -m mime/type ] [ -n copies ] [ -o name=value ] [ -p filename.ppd ] [ -t title ] [ -u ]
       filename

DESCRIPTION
       cupsfilter is a front-end to the CUPS filter subsystem which allows you to convert a file to a specific format, just as if you had printed the file through CUPS. By default, cupsfilter  generates  a
       PDF file.

OPTIONS
       -D
            Delete the input file after conversion.

       -U user
            Specifies the username passed to the filters. The default is the name of the current user.

       -c config-file
            Uses the named cupsd.conf configuration file.

       -d printer
            Uses information from the named printer.

       -e
            Use every filter from the PPD file.

       -i mime/type
            Specifies the source file type. The default file type is guessed using the filename and contents of the file.

       -j job-id[,N]
            Converts document N from the specified job. If N is omitted, document 1 is converted.

       -m mime/type
            Specifies the destination file type. The default file type is application/pdf.  Use printer/foo to convert to the printer format defined by the filters in the PPD file.

       -n copies
            Specifies the number of copies to generate.

       -o name=value
            Specifies options to pass to the CUPS filters.

       -p filename.ppd
            Specifies the PPD file to use.

       -t title
            Specifies the document title.

       -u
            Delete the PPD file after conversion.

SEE ALSO
       cupsd.conf(5)
       http://localhost:631/help

COPYRIGHT
       Copyright 2007-2013 by Apple Inc.



20 June 2012                                                                                         CUPS                                                                                       cupsfilter(8)
