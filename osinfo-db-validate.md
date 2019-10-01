OSINFO-DB-VALIDATE.C(1)                                                                     Virtualization Support                                                                    OSINFO-DB-VALIDATE.C(1)



NAME
       osinfo-db-validate - Validate libosinfo XML data files

SYNOPSIS
       osinfo-db-validate [OPTIONS...]

       osinfo-db-validate [OPTIONS...] LOCAL-PATH1 [LOCAL-PATH2...]

       osinfo-db-validate [OPTIONS...] URI1 [URI2...]

DESCRIPTION
       The osinfo-db-validate tool is able to validate XML files in one of the osinfo database locations for compliance with the RNG schema.

       system
        This is the primary system-wide database location, intended for use by operating system vendors distributing database files in the native package format. The RNG schema is expected to be present in
        this location.

       local
        This is the secondary system-wide database location, intended for use by system administrators wishing to provide an updated database for all users. This location may provide an RNG schema
        override, otherwise the RNG schema from the system location will be used.

       user
        This is the user private database location, intended for use by unprivileged local users wishing to provide applications they use with an updated database. This location may provide an RNG schema
        override, otherwise the RNG schema from the local location will be used, or failing that the system location.

       If run by a privileged account (ie root), the local database location will be validate by default, otherwise the user location will be validated.

       Alternatively it is possible to directly provide a list of files to be validated using the ("LOCAL-PATH1" or "URI1") arguments.

       Any validation errors will be displayed on the console when detected.

OPTIONS
       --user  Override the default behaviour to force validating files from the user database location.

       --local Override the default behaviour to force validating files from the local database location.

       --system
               Override the default behaviour to force validating files from the system database location.

       --dir=PATH
               Override the default behaviour to force validating files from the custom directory PATH.

       --root=PATH
               Prefix the database location with the root directory given by "PATH". This is useful when wishing to validate files that are in a chroot environment or equivalent.

       -v, --verbose
               Display verbose progress information when validating files

EXIT STATUS
       The exit status will be 0 if all files passed validation, or 1 if a validation error was hit.

SEE ALSO
       "osinfo-db-path(1)"

AUTHORS
       Daniel P. Berrange <berrange@redhat.com>

COPYRIGHT
       Copyright (C) 2012-2016 Red Hat, Inc.

LICENSE
       "osinfo-db-validate" is distributed under the terms of the GNU LGPL v2+ license. This is free software; see the source for copying conditions.  There is NO warranty; not even for MERCHANTABILITY or
       FITNESS FOR A PARTICULAR PURPOSE



osinfo-db-tools-1.1.0                                                                             2016-10-26                                                                          OSINFO-DB-VALIDATE.C(1)
