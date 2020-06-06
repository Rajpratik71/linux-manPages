cracklib-check(8)                                                                        System Manager's Manual                                                                        cracklib-check(8)

NAME
       cracklib-check - Check passwords using libcrack2

SYNOPSIS
       cracklib-check

DESCRIPTION
       cracklib-check takes a list of passwords from stdin and checks them via libcrack2's FascistCheck(3) sub routine.

RESULT
       cracklib-check prints each checked password and the corresponding result of FascistCheck(3) to stdout. The password and the result are separated by a colon.

SEE ALSO
       FascistCheck(3)

AUTHOR
       This man page was written by Jan Dittberner <jandd@debian.org> for the Debian GNU/Linux System (but may be used by others).

Jan Dittberner                                                                        Sat Jun 21 22:44:33 CEST 2008                                                                     cracklib-check(8)
