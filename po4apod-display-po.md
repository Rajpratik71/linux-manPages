PO4APOD-DISPLAY-PO(1)                                               Po4a Tools                                               PO4APOD-DISPLAY-PO(1)

NAME
       po4apod-display-po - man display of a translated POD file according to a PO

SYNOPSIS
       po4apod-display-po -p  PO_FILE -m  POD_FILE [-o  PO4A_OPT]

DESCRIPTION
       po4apod-display-po can be used by a translator who wants to check how the man page, generated from a POD file, being translated in a PO
       will be displayed. Generally, POD file is only available in source package or embedded in Perl script.

OPTIONS
       -p PO_FILE
           The PO file containing the translations.

       -m POD_FILE
           The original POD file used by po4a to generate PO file.

       -o PO4A_OPT
           Some options to pass to po4a-translate(1).

SEE ALSO
       po4aman-display-po(1)

AUTHOR
       Florentin Duneau

Po4a Tools                                                          2009-03-16                                               PO4APOD-DISPLAY-PO(1)
