EXFATLABEL(8)                                                                    System Manager's Manual                                                                    EXFATLABEL(8)

NAME
       exfatlabel - get or set an exFAT file system label

SYNOPSIS
       exfatlabel [ -V ] device [ label ]

DESCRIPTION
       exfatlabel reads or changes an exFAT file system label (volume name).

       If  label  argument  is  present, exfatlabel sets the new volume name. Empty label ('') removes volume name. Label can be up to 15 characters. This limit is shorter if characters
       beyond Unicode BMP are used because internally label is stored in UTF-16.

       If label argument is omitted, exfatlabel just prints current volume name.

COMMAND LINE OPTIONS
       Command line options available:

       -V     Print version and copyright.

EXIT CODES
       Zero is returned on success. Any other code means an error.

AUTHOR
       Andrew Nayenko

SEE ALSO
       mkexfatfs(8)

                                                                                      September 2017                                                                        EXFATLABEL(8)
