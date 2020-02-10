WHO-PERMITS-UPLOAD(1)                                                                                                                                                               WHO-PERMITS-UPLOAD(1)

NAME
       who-permits-upload - look-up Debian Maintainer access control lists

SYNOPSIS
       who-permits-upload [-h] [-s keyring] [-d dm_url] [-s search_type] query [query ...]

DESCRIPTION
       who-permits-upload looks up the given Debian Maintainer (DM) upload permissions from ftp-master.debian.org and parses them in a human readable way. The tool can search by DM name, sponsor (the
       person who granted the permission) and by package.

OPTIONS
       --dmfile=dm_url, -d dm_url
           Retrieve the DM permission file from the supplied URL. When this option is not present, the default value https://ftp-master.debian.org/dm.txt is used.

       --help, -h
           Display an usage summary and exit.

       --keyring=keyring, -s keyring
           Use the supplied GnuPG keyrings to look-up GPG fingerprints from the DM permission file. When not present, the default Debian Developer and Maintainer keyrings are used
           (/usr/share/keyrings/debian-keyring.gpg and /usr/share/keyrings/debian-maintainers.gpg, installed by the debian-keyring package).

           Separate keyrings with a colon ":".

       --search=search_type, -s search_type
           Modify the look-up behavior. This influences the interpretation of the query argument. Supported search types are:

           package
               Search for a source package name. This is also the default when --search is omitted.  Since package names are unique, this will return given ACLs - if any - for a single package.

           uid Search for a Debian Maintainer. This should be (a fraction of) a name. It will return all ACLs assigned to matching maintainers.

           sponsor
               Search for a sponsor (i.e. a Debian Developer) who granted DM permissions. This will return all ACLs given by the supplied developer.

               Note that this is an expensive operation which may take some time.

       query
           A case sensitive argument to be looked up in the ACL permission file. The exact interpretation of this argument is dependent by the --search argument.

           This argument can be repeated.

EXIT VALUE
       0   Success

       1   An error occurred

       2   The command line was not understood

EXAMPLES
       who-permits-upload --search=sponsor arno@debian.org
           Search for all DM upload permissions given by the UID "arno@debian.org". Note, that only primary UIDs will match.

       who-permits-upload -s=sponsor "Arno Töll"
           Same as above, but use a full name instead.

       who-permits-upload apache2
           Look up who gave upload permissions for the apache2 source package.

       who-permits-upload --search=uid "Paul Tagliamonte"
           Look up all DM upload permissions given to "Paul Tagliamonte".

AUTHOR
       who-permits-upload was written by Arno Töll <arno@debian.org> and is licensed under the terms of the General Public License (GPL) version 2 or later.

SEE ALSO
       gpg(1), gpg2(1), who-uploads(1)

       https://lists.debian.org/debian-devel-announce/2012/09/msg00008.html

Debian Utilities                                                                                2016-03-23                                                                          WHO-PERMITS-UPLOAD(1)
