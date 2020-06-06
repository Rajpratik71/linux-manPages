create-cracklib-dict(8)                                                                  System Manager's Manual                                                                  create-cracklib-dict(8)

NAME
       create-cracklib-dict - Check passwords using libcrack2

SYNOPSIS
       create-cracklib-dict wordlist ...

DESCRIPTION
       create-cracklib-dict takes one or more word list files as arguments and converts them into cracklib dictionaries for use by password checking programs. The results are placed in the default com‐
       piled-in dictionary location.

       If you wish to store the dictionary in a different location, use the cracklib-format and cracklib-packer commands directly.

SEE ALSO
       cracklib-format(8), cracklib-packer(8), cracklib-check(8),

AUTHOR
       This man page was written by Jan Dittberner <jandd@debian.org> for the Debian GNU/Linux System (but may be used by others).

Jan Dittberner                                                                        Sat Jun 21 22:45:42 CEST 2008                                                               create-cracklib-dict(8)
