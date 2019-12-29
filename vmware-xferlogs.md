VMWARE-XFERLOGS(1)                                                                           Open VM Tools                                                                          VMWARE-XFERLOGS(1)

NAME
       vmware-xferlogs - dump vm-support output to vmx logfile

SYNOPSIS
       vmware-xferlogs OPTIONS FILE

DESCRIPTION
       vmware-xferlogs  is a simple console application and can be run as any user. It is based on rpctool to dump the vm-support output to the vmx log file base64 encoded. It can dump any file sup‐
       plied on the commandline to the vmx log. It also does the decoding part of it. It can read the vmware.log file decode and write the encoded files in the directory it was invoked.

       Example of a transfer found in the vmx log file:

            Aug  24  18:48:09:  vcpu-0|  Guest:  >Logfile  Begins  :  /root/install.log:  ver  -   1        Aug   24   18:48:09:   vcpu-0|   Guest:   >SW5zdGFsbGluZyA0NDEgcGFja2FnZXMKCkluc3RhbGxpbm‐
       cgZ2xpYmMtY29tbW9uLTIuMi41LTM0       Aug  24  18:48:09:  vcpu-0|  Guest:  >LgpJbnN0YWxsaW5nIGh3ZGF0YS0wLjE0LTEuCkluc3RhbGxpbmcgaW5kZXhodG1sLTcuMy0zLgpJ       Aug  24  18:48:09: vcpu-0| Guest:
       >bnN0YWxsaW5nIG1haWxjYXAtMi4xLjktMi4KSW5zdGFsbGluZyBtYW4tcGFnZXMtMS40OC0yLgpJ      ....       ....       Aug 24 18:48:10: vcpu-0| Guest: >Mi4K      Aug 24 18:48:10:  vcpu-0|  Guest:  >Logfile
       Ends

OPTIONS
       enc

       dec

SEE ALSO
       vmware-checkvm(1)
       vmware-toolbox-cmd(1)
       libguestlib(3)
       libvmtools(3)
       vmware-user-suid-wrapper(1)

HOMEPAGE
       More information about vmware-xferlogs and the Open VM Tools can be found at <http://open-vm-tools.sourceforge.net/>.

AUTHOR
       Open VM Tools were written by VMware, Inc. <http://www.vmware.com/>.

       This manual page was put together from homepage materials by Daniel Baumann <mail@daniel-baumann.ch>, for the Debian project (but may be used by others).

2010.03.20-243334                                                                             2010-04-08                                                                            VMWARE-XFERLOGS(1)
