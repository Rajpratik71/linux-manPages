VMWARE-USER-SUID-WRAPPER(1)                                                                  Open VM Tools                                                                 VMWARE-USER-SUID-WRAPPER(1)

NAME
       vmware-user-suid-wrapper - wrapper programm for vmware-user(1)

SYNOPSIS
       vmware-user-suid-wrapper

DESCRIPTION
       Operations  on  the  vmblock(9) filesystem are considered privileged, and as such may only be issued on a file descriptor acquired by root. This is accomplished by vmware-user-suid-wrapper, a
       small setuid wrapper whose only purpose is to acquire a filesystem file descriptor, drop superuser privileges, and then execute vmware-user(1).  In particular, prepare the system for  vmware-
       user  means  that it unmounts the vmblock file system, unloads the vmblock module, then reloads the module, mounts the file system, and opens a file descriptor that vmware-user can use to add
       and remove blocks.

OPTIONS
       vmware-user-suid-wrapper has no options.

SEE ALSO
       vmware-checkvm(1)
       vmware-hgfsclient(1)
       vmware-toolbox(1)
       vmware-toolbox-cmd(1)
       vmware-user(1)
       vmware-xferlogs(1)
       libguestlib(3)
       libvmtools(3)
       vmware-guestd(8)
       vmware-hgfsmounter(8)
       vmblock(9)
       vmci(9)
       vmhgfs(9)
       vmmemctl(9)
       vmsock(9)
       vmsync(9)
       vmxnet(9)
       vmxnet3(9)

HOMEPAGE
       More information about vmware-user-suid-wrapper and the Open VM Tools can be found at <http://open-vm-tools.sourceforge.net/>.

AUTHOR
       Open VM Tools were written by VMware, Inc. <http://www.vmware.com/>.

       This manual page was put together from homepage materials by Daniel Baumann <mail@daniel-baumann.ch>, for the Debian project (but may be used by others).

2010.03.20-243334                                                                             2010-04-08                                                                   VMWARE-USER-SUID-WRAPPER(1)
