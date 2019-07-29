OSINFO-DB-VALIDATE.C(1)                                       Virtualization Support                                       OSINFO-DB-VALIDATE.C(1)

NAME
       osinfo-db-validate - Validate libosinfo XML data files

SYNOPSIS
       osinfo-db-validate [OPTIONS...] LOCAL-PATH1 [LOCAL-PATH2...]

       osinfo-db-validate [OPTIONS...] URI1 [URI2...]

DESCRIPTION
       Check that all files ("LOCAL-PATH1" or "URI1") comply with the libosinfo XML schema. The local path may point to a directory containing XML
       files, or directly to an XML file. The uris must point directly to remote XML files

       Any validation errors will be displayed on the console when detected.

OPTIONS
       -v, --verbose
               Display verbose progress information when validating files

EXIT STATUS
       The exit status will be 0 if all files passed validation, or 1 if a validation error was hit.

SEE ALSO
       xmllint(1)

AUTHORS
       Daniel P. Berrange <berrange@redhat.com>

COPYRIGHT
       Copyright (C) 2012, 2014 Red Hat, Inc.

LICENSE
       "osinfo-db-validate" is distributed under the termsof the GNU LGPL v2+ license. This is free software; see the source for copying
       conditions.  There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE

libosinfo-0.3.1                                                     2016-07-15                                             OSINFO-DB-VALIDATE.C(1)
