KSVERDIFF(1)                                                                               General Commands Manual                                                                               KSVERDIFF(1)



NAME
       ksverdiff — display the differences in kickstart syntax

SYNOPSIS
       ksverdiff [-f | --from FROMVER]  [-t | --to TOVER]

DESCRIPTION
       ksverdiff  is  a  program that takes two versions of kickstart syntax and lists the differences between them.  It will generate a list of options added to every command since FROMVER, a list of com‐
       mands added since FROMVER, a list of commands deprecated since FROMVER, and a list of commands removed since FROMVER.

EXIT STATUS
       ksverdiff returns 0 on success, and 1 if either FROMVER or TOVER are invalid.

OPTIONS
       -f | --from FROMVER
                 The version of kickstart syntax to start with.  In other words, this is the lower bound version.

       -t | --TO TOVER
                 The version of kickstart syntax to end with.  In other words, this is the upper bound version.

SEE ALSO
       ksflatten (1), ksvalidator (1)



                                                                                                                                                                                                 KSVERDIFF(1)
