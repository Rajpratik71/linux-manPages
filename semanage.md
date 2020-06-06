semanage(8)                                                                                                                                                                                       semanage(8)



NAME
       semanage - SELinux Policy Management tool


SYNOPSIS
       semanage {import,export,login,user,port,interface,module,node,fcontext,boolean,permissive,dontaudit,ibpkey,ibendport}
                       ...  positional arguments:

       import Import local customizations

       export Output local customizations

       login Manage login mappings between linux users and SELinux confined users

       user Manage SELinux confined users (Roles and levels for an SELinux user)

       port Manage network port type definitions

       interface Manage network interface type definitions

       module Manage SELinux policy modules

       node Manage network node type definitions

       fcontext Manage file context mapping definitions

       boolean Manage booleans to selectively enable functionality

       permissive Manage process type enforcement mode

       dontaudit Disable/Enable dontaudit rules in policy

       ibpkey Manage infiniband pkey type definitions

       ibendport Manage infiniband end port type definitions


DESCRIPTION
       semanage  is  used  to configure certain elements of SELinux policy without requiring modification to or recompilation from policy sources.  This includes the mapping from Linux usernames to SELinux
       user identities (which controls the initial security context assigned to Linux users when they login and bounds their authorized role set) as well as security context mappings for various  kinds  of
       objects,  such  as  network ports, interfaces, infiniband pkeys and endports, and nodes (hosts) as well as the file context mapping. See the EXAMPLES section below for some examples of common usage.
       Note that the semanage login command deals with the mapping from Linux usernames (logins) to SELinux user identities, while the semanage user command deals with the mapping from SELinux user identi‐
       ties  to  authorized  role  sets.  In most cases, only the former mapping needs to be adjusted by the administrator; the latter is principally defined by the base policy and usually does not require
       modification.


OPTIONS
       -h, --help
              List help information


SEE ALSO
       selinux (8), semanage-boolean (8), semanage-dontaudit (8), semanage-export (8), semanage-fcontext (8), semanage-import (8), semanage-interface (8), semanage-login (8), semanage-module (8), semanage-
       node (8), semanage-permissive (8), semanage-port (8), semanage-user (8) semanage-ibkey (8), semanage-ibendport (8),


AUTHOR
       This man page was written by Daniel Walsh <dwalsh@redhat.com>
       and Russell Coker <rcoker@redhat.com>.
       Examples by Thomas Bleher <ThomasBleher@gmx.de>.  usage: semanage [-h]



                                                                                                   20100223                                                                                       semanage(8)
