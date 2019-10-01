MIGRATECRED(1)                                                                             General Commands Manual                                                                             MIGRATECRED(1)



NAME
       migratecred - Migrate credentials from one instance of Directory Server to another

SYNOPSIS
       migratecred -o OldInstancePath -n NewInstancePath -c OldCredential [-p NewPluginPath]

DESCRIPTION
       migratecred migrates credentials from one Directory Server instance to the other.

       New plugin path defaults to [libdir/dirsrv/plugins] if not given

       migratecred  is  a  program  that migrates credentials used for replication and chaining. That is the password used by the server to perform the simple BIND operation for server to server communica‐
       tions.

OPTIONS
       A summary of options is included below:

       -o OldInstancePath
              Path to the source instance

       -n NewInstancePath
              Path to the destination instance

       -c OldCredential
              Old credential

       -p NewPluginPath
              New plugin path (of the new instance)

AUTHOR
       migratecred was written by the 389 Project.

REPORTING BUGS
       Report bugs to https://pagure.io/389-ds-base/new_issue

COPYRIGHT
       Copyright © 2001 Sun Microsystems, Inc. Used by permission.
       Copyright © 2017 Red Hat, Inc.
       This manual page was written by Michele Baldessari <michele@pupazzo.org>, for the Debian project (but may be used by others).
       This is free software.  You may redistribute copies of it under the terms of the Directory Server license found in the LICENSE file of this software distribution.  This license  is  essentially  the
       GNU General Public License version 2 with an exception for plug‐in distribution.



                                                                                                March 31, 2017                                                                                 MIGRATECRED(1)
