SPENT(1)                                                      General Commands Manual                                                     SPENT(1)

NAME
       spent - print SGML entity on the standard output

SYNOPSIS
       spent [ -rv ] [ -bbctf ] sysid...

DESCRIPTION
       This manual page may be out of date.  Consult the HTML documentation for the most up-to-date information concerning this program.

       Spent (SGML print entity) prints the concatenation of the entities with system identifiers sysid...  on the standard output.  The format of
       the system identifiers is described in nsgmls(1).

       The following options are available:

       -bbctf Use the BCTF with name bctf for output.  Available BCTFs are described in nsgmls(1).

       -r     Don't perform any conversion on RSs and REs when printing the entity.  The entity would typically have the storage manager attribute
              records=asis.

       -v     Print the version number.

AUTHOR
       James Clark (jjc@jclark.com).

SEE ALSO
       nsgmls(1)

                                                                                                                                          SPENT(1)
