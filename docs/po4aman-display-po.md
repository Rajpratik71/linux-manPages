PO4AMAN-DISPLAY-PO(1)                                               Po4a Tools                                               PO4AMAN-DISPLAY-PO(1)

NAME
       po4aman-display-po - display a translated man page according to a PO

SYNOPSIS
       po4aman-display-po -p PO_FILE [-m MASTER_FILE] [-o PO4A_OPT]

DESCRIPTION
       po4aman-display-po can be used by a translator who wants to check how the man page being translated in a PO will be displayed.

       The manual page must be in one of the formats supported by the po4a's man module. The manual page can be provided on the command line, or
       installed on the system.

       Manual pages generated from other formats, like DocBook or POD, are not supported. See po4apod-display-po(1) for an equivalent supporting
       POD documents.

OPTIONS
       -p PO_FILE
           The PO file containing the translations.

       -m MASTER_FILE
           The original man page. It can be the absolute or relative path to the original man page (gzipped or not), the name the man page or the
           name and section of the man page (using the man.section format).  When the master document is not provided with the -m option,
           po4aman-display-po tries to find the original man page based on the line reference of the first string in the PO.

       -o PO4A_OPT
           Some options to pass to po4a-translate(1).

SEE ALSO
       po4apod-display-po(1)

AUTHOR
       Thomas Huriaux

Po4a Tools                                                          2006-04-08                                               PO4AMAN-DISPLAY-PO(1)
