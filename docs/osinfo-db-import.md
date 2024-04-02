OSINFO-DB-IMPORT.C(1)                                                                       Virtualization Support                                                                      OSINFO-DB-IMPORT.C(1)



NAME
       osinfo-db-import - Import an osinfo database archive

SYNOPSIS
       osinfo-db-import [OPTIONS...] ARCHIVE-FILE

DESCRIPTION
       The osinfo-db-import tool will take an osinfo database archive and extract its contents into one of the standard database locations on the current host:

       system
        This is the primary system-wide database location, intended for use by operating system vendors distributing database files in the native package format.

       local
        This is the secondary system-wide database location, intended for use by system administrators wishing to provide an updated database for all users.

       user
        This is the user private database location, intended for use by unprivileged local users wishing to provide applications they use with an updated database.

       If run by a privileged account (ie root), the local database location will be used by default, otherwise the user location will be used.

OPTIONS
       --user  Override the default behaviour to force installation into the user database location.

       --local Override the default behaviour to force installation into the local database location.

       --system
               Override the default behaviour to force installation into the system database location.

       --dir=PATH
               Override the default behaviour to force installation into the custom directory PATH.

       --root=PATH
               Prefix the installation location with the root directory given by "PATH". This is useful when wishing to install into a chroot environment or equivalent.

       -v, --verbose
               Display verbose progress information when installing files

EXIT STATUS
       The exit status will be 0 if all files were installed successfully, or 1 if at least one file could not be installed.

SEE ALSO
       "osinfo-db-export(1)", "osinfo-db-path(1)"

AUTHORS
       Daniel P. Berrange <berrange@redhat.com>

COPYRIGHT
       Copyright (C) 2016 Red Hat, Inc.

LICENSE
       "osinfo-db-import" is distributed under the terms of the GNU LGPL v2+ license. This is free software; see the source for copying conditions.  There is NO warranty; not even for MERCHANTABILITY or
       FITNESS FOR A PARTICULAR PURPOSE



osinfo-db-tools-1.1.0                                                                             2016-10-26                                                                            OSINFO-DB-IMPORT.C(1)
