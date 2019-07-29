pgpewrap(1)                                                                                      User Manuals                                                                                     pgpewrap(1)



NAME
       pgpewrap - Mutt command line munging tool


SYNTAX
       pgpewrap [ flags ] -- prefix [ recipients ]


DESCRIPTION
       This  is  a  little  C program which does some command line munging: The first argument is a command to be executed.  When pgpewrap encounters a "--" (dash-dash) argument, it will interpret the next
       argument as a prefix which is put in front of all following arguments.


EXAMPLE
               pgpewrap pgpe file -- -r a b c

       will execute:

               pgpe file -r a -r b -r c

       This script is needed with PGP 5 and with GPG, since their command line interfaces can't be properly served by mutt's format mechanism.




Unix                                                                                               May 2013                                                                                       pgpewrap(1)
