SMBSPOOL_KRB5_WRAPPE(8)                                     System Administration tools                                    SMBSPOOL_KRB5_WRAPPE(8)

NAME
       smbspool_krb5_wrapper - This is a CUPS printing backend which calls smbspool

SYNOPSIS
       smbspool_krb5_wrapper {job} {user} {title} {copies} {options} [filename]

DESCRIPTION
       This tool is part of the samba(7) suite.

       smbspool_krb5_wrapper is a tool that can be used to print using Kerberos credentials. To get this working smbspool_krb5_wrapper needs to be
       the smb backend of CUPS. It needs to be owned by root and the permissions for the binary need to be 0700. Once smbspool_krb5_wrapper
       switched to the user trying to print it executes smbspool. It should not be called by a user.

SEE ALSO
       smbspool(8).

AUTHOR
       The original Samba software and related utilities were created by Andrew Tridgell. Samba is now developed by the Samba Team as an Open
       Source project similar to the way the Linux kernel is developed.

       The smbspool_krb5_wrapper manpage was written by Andreas Schneider.

Samba 4.4                                                           05/23/2019                                             SMBSPOOL_KRB5_WRAPPE(8)
