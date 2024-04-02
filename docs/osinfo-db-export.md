OSINFO-DB-EXPORT.C(1)                                                                       Virtualization Support                                                                      OSINFO-DB-EXPORT.C(1)



NAME
       osinfo-db-export - Export to a osinfo database archive

SYNOPSIS
       osinfo-db-export [OPTIONS...] [ARCHIVE-FILE]

DESCRIPTION
       The osinfo-db-export tool will create an osinfo database archive file containing the content from one of the standard local database locations:

       system
        This is the primary system-wide database location, intended for use by operating system vendors distributing database files in the native package format.

       local
        This is the secondary system-wide database location, intended for use by system administrators wishing to provide an updated database for all users.

       user
        This is the user private database location, intended for use by unprivileged local users wishing to provide applications they use with an updated database.

       If run by a privileged account (ie root), the local database location will be used by default, otherwise the user location will be used.

       If no ARCHIVE-FILE path is given, an automatically generated filename will be used, taking the format osinfo-db-$VERSION.tar.xz.

OPTIONS
       --user  Override the default behaviour to force archiving files from the user database location.

       --local Override the default behaviour to force archiving files from the local database location.

       --system
               Override the default behaviour to force archiving files from the system database location.

       --dir=PATH
               Override the default behaviour to force archiving files from the custom directory PATH.

       --root=PATH
               Prefix the database location with the root directory given by "PATH". This is useful when wishing to archive files that are in a chroot environment or equivalent.

       --version=VERSION
               Set the version string for the files in the archive to VERSION. If this argument is not given, the version will be set to the current date in the format YYYYMMDD.

       --license=LICENSE-FILE
               Add "LICENSE-FILE" to the generated archive as an entry named "LICENSE".

       -v, --verbose
               Display verbose progress information when archiving files

EXIT STATUS
       The exit status will be 0 if all files were packed successfully, or 1 if at least one file could not be packed into the archive.

SEE ALSO
       "osinfo-db-import(1)", "osinfo-db-path(1)"

AUTHORS
       Daniel P. Berrange <berrange@redhat.com>

COPYRIGHT
       Copyright (C) 2016 Red Hat, Inc.

LICENSE
       "osinfo-db-export" is distributed under the terms of the GNU LGPL v2+ license. This is free software; see the source for copying conditions.  There is NO warranty; not even for MERCHANTABILITY or
       FITNESS FOR A PARTICULAR PURPOSE



osinfo-db-tools-1.1.0                                                                             2016-10-26                                                                            OSINFO-DB-EXPORT.C(1)
