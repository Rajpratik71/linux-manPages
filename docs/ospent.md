OSPENT(1)                                                            Reference                                                           OSPENT(1)

NAME
       ospent - Concatenates entities in an SGML/XML document

SYNOPSIS
       ospent [-ChnrRv] [-bbctf] [-csysid] [-ffile] [-Ddirectory] [sysid...]

DESCRIPTION
       ospent (OpenSP print entity) prints the concatenation of the entities with system identifiers

       on the standard output.

       The following options are available:

       -bbctf, --bctf=bctf
           Use the BCTF with name bctf for output.

       -csysid, --catalog=sysid
           Map public identifiers and entity names to system identifiers using the catalog entry file whose system identifier is sysid.

       -C, --catalogs
           This has the same effect as in onsgmls(1).

       -Ddirectory, --directory=directory
           Search directory for files specified in system identifiers. This has the same effect as in onsgmls(1).

       -ffile, --error-file=file
           Redirect error messages to file.

       -h, --help
           Display a help text and exit.

       -n, --non-sgml
           The entity is a non-SGML data entity. This option forces the octets in the storage objects comprising the entity to be copied exactly
           without any of the conversions that are done for text entities. Implies -r.

       -r, --raw
           Raw output. Don't perform any conversion on RSs and REs when printing the entity. The entity would typically have the storage manager
           attribute records=asis.

       -R, --restricted
           This has the same effect as in onsgmls(1).

       -v, --version
           Print the version number.

SEE ALSO
       onsgmls(1), ospam(1), osgmlnorm(1), osx(1)

AUTHORS
       James Clark
           Author.

       Ian Castle <ian.castle@openjade.org>
           Author.

COPYRIGHT
OpenJade                                                           November 2002                                                         OSPENT(1)
