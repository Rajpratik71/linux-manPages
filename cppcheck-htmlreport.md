CPPCHECK-HTMLREPORT(1)                                             User Commands                                            CPPCHECK-HTMLREPORT(1)

NAME
       cppcheck-htmlreport - HTML report generator for cppcheck

SYNOPSIS
       cppcheck-htmlreport [options]

OPTIONS
       -h, --help
              Show this help message and exit.

       --title=TITLE
              The title of the project.

       --file=FILE
              The cppcheck xml output file to read defects from.  Default is reading from stdin.

       --report-dir=REPORT_DIR
              The directory where the HTML report content is written.

       --source-dir=SOURCE_DIR
              Base directory where source code files can be found.

       --source-encoding=SOURCE_ENCODING
              Encoding of source code.

SEE ALSO
       cppcheck(1)

cppcheck-htmlreport 1.72                                          September 2015                                            CPPCHECK-HTMLREPORT(1)
