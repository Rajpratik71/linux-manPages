OSPCAT(1)                                                            Reference                                                           OSPCAT(1)

NAME
       ospcat - SGML print catalog

SYNOPSIS
       ospcat [-b name] [--bctf=name] [-C] [--catalogs] [-c sysid] [--catalog=sysid] [-f] [--error-file=file] [-D directory]
              [--directory=directory] [-R] [--restricted] [-v] [-h] [--help] [-P literal] [--public-id=literal] [-S literal] [--system_id=literal]
              [-p name] [--parameter-entity=name] [-d name] [--doctype=name] [-l name] [--linktype=name] [-e name] [--entity=name] [-n name]
              [--notation=name] [-s name] [--declaration=name]

DESCRIPTION
       ospcat prints effective system identifiers found in the catalogs on the standard output. It doesn't check that the system identifiers
       correspond to actual files. The return value is 0 if the last system identifier was successfully created and 1 otherwise.

OPTIONS
       The following options are available:

       -b name, --bctf=name
           Use bctf name for output.

       -f file, --error-file=file
           Append error messages to file file.

       -v, --version
           Display the program version.

       -h, --help
           Show this help text.

       -c sysid, --catalog=sysid
           Use catalog sysid.

       -C, --catalogs
           Arguments are catalogs, use DOCUMENT entry.

       -D directory, --directory=directory
           Search files in directory directory.

       -R, --restricted
           Restrict file reading (for use in Web apps).

       -P literal, --public-id=literal
           Print the effective system id for the public id literal.

       -S literal, --system-id=literal
           Print the effective system id for system id literal.

       -p name, --parameter-entity=name
           Print the effective system id for parameter entity name.

       -d name, --doctype=name
           Print the effective system id for the doctype name.

       -l name, --linktype=name
           Print the effective system id for the linktype name.

       -e name, --entity=name
           Print the effective system id for entity name.

       -n name, --notation=name
           Print the effective system id for notation name.

       -s name, --declaration=name
           Print the effective system id for the SGML declaration for doctype name.

SEE ALSO
       onsgmls(1), ospam(1), osgmlnorm(1), ospent(1)

AUTHOR
       Ian Castle <ian.castle@openjade.org>
           Author.

COPYRIGHT
OpenSP                                                            September 2003                                                         OSPCAT(1)
