OSINFO-DB-PATH.C(1)                                                                         Virtualization Support                                                                        OSINFO-DB-PATH.C(1)



NAME
       osinfo-db-path - Report database locations

SYNOPSIS
       osinfo-db-path [OPTIONS...]

DESCRIPTION
       The osinfo-db-path tool will report the paths associated with the standard osinfo database locations:

       system
        This is the primary system-wide database location, intended for use by operating system vendors distributing database files in the native package format.

       local
        This is the secondary system-wide database location, intended for use by system administrators wishing to provide an updated database for all users.

       user
        This is the user private database location, intended for use by unprivileged local users wishing to provide applications they use with an updated database.

       If run by a privileged account (ie root), the local database location will be reported by default, otherwise the user location will be reported.

OPTIONS
       --user  Override the default behaviour to force reporting of the user database location.

       --local Override the default behaviour to force reporting of the local database location.

       --system
               Override the default behaviour to force reporting of the system database location.

       --dir=PATH
               Override the default behaviour to force reporting of the custom directory PATH.

       --root=PATH
               Prefix the database location with the root directory given by "PATH". This is useful when wishing to report paths relative to a chroot environment or equivalent.

EXIT STATUS
       The exit status will be 0 if the requested path was reported, or 1 if the arguments were invalid.

SEE ALSO
       "osinfo-db-export(1)", "osinfo-db-import(1)"

AUTHORS
       Daniel P. Berrange <berrange@redhat.com>

COPYRIGHT
       Copyright (C) 2016 Red Hat, Inc.

LICENSE
       "osinfo-db-import" is distributed under the terms of the GNU LGPL v2+ license. This is free software; see the source for copying conditions.  There is NO warranty; not even for MERCHANTABILITY or
       FITNESS FOR A PARTICULAR PURPOSE



osinfo-db-tools-1.1.0                                                                             2016-10-26                                                                              OSINFO-DB-PATH.C(1)
