REGSHELL(1)                                                                              System Administration tools                                                                              REGSHELL(1)



NAME
       regshell - Windows registry file browser using readline

SYNOPSIS
       regshell [--help] [--backend=BACKEND] [--credentials=CREDENTIALS] [location]

DESCRIPTION
       regshell is a utility that lets you browse thru a Windows registry file as if you were using a regular unix shell to browse thru a file system.

OPTIONS
       --help
           Show list of available options.

       --backend BACKEND
           Name of backend to load. Possible values are: creg, regf, dir and rpc. The default is dir.

       --credentials=CREDENTIALS
           Credentials to use, if any. Password should be separated from user name by a percent sign.

COMMANDS
       ck|cd <keyname>
           Go to the specified subkey.

       ch|predef [predefined-key-name]
           Go to the specified predefined key.

       list|ls
           List subkeys and values of the current key.

       mkkey|mkdir <keyname>
           Create a key with the specified keyname as a subkey of the current key.

       rmval|rm <valname>
           Delete the specified value.

       rmkey|rmdir <keyname>
           Delete the specified subkey recursively.

       pwd|pwk
           Print the full name of the current key.

       set|update
           Update the value of a key value. Not implemented at the moment.

       help|?
           Print a list of available commands.

       exit|quit
           Leave regshell.

EXAMPLES
       Browsing thru a nt4 registry file

           regshell -b nt4 NTUSER.DAT
           $$$PROTO.HIV> ls
           K AppEvents
           K Console
           K Control Panel
           K Environment
           K Identities
           K Keyboard Layout
           K Network
           K Printers
           K Software
           K UNICODE Program Groups
           K Windows 3.1 Migration Status
           $$$PROTO.HIV> exit

       Listing the subkeys of HKEY_CURRENT_USER\AppEvents on a remote computer:

           regshell --remote=ncacn_np:aurelia -c "jelmer%secret"
           HKEY_CURRENT_MACHINE> predef HKEY_CURRENT_USER
           HKEY_CURRENT_USER> cd AppEvents
           Current path is: HKEY_CURRENT_USER\AppEvents
           HKEY_CURRENT_USER\AppEvents> ls
           K EventLabels
           K Schemes
           HKEY_CURRENT_USER\AppEvents> exit

VERSION
       This man page is correct for version 4.0 of the Samba suite.

SEE ALSO
       regtree, regdiff, regpatch, gregedit, samba

AUTHOR
       This utility is part of the Samba[1] suite, which is developed by the global Samba Team[2].

       This manpage and regshell were written by Jelmer Vernooij.

NOTES
        1. Samba
           http://www.samba.org/

        2. Samba Team
           http://www.samba.org/samba/team/



Samba 4.0                                                                                         07/12/2017                                                                                      REGSHELL(1)
