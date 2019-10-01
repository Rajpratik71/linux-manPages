REGTREE(1)                                                                               System Administration tools                                                                               REGTREE(1)



NAME
       regtree - Text-mode registry viewer

SYNOPSIS
       regtree [--help] [--backend=BACKEND] [--fullpath] [--no-values] [--credentials=CREDENTIALS] [location]

DESCRIPTION
       The regtree utility prints out all the contents of a Windows registry file. Subkeys are printed with one level more indentation than their parents.

OPTIONS
       --help
           Show list of available options.

       --backend BACKEND
           Name of backend to load. Possible values are: creg, regf, dir and rpc. The default is dir.

       --credentials=CREDENTIALS
           Credentials to use, if any. Password should be separated from user name by a percent sign.

       --fullpath
           Print the full path to each key instead of only its name.

       --no-values
           Don't print values, just keys.

VERSION
       This man page is correct for version 4.0 of the Samba suite.

SEE ALSO
       gregedit, regshell, regdiff, regpatch, samba

AUTHOR
       This utility is part of the Samba[1] suite, which is developed by the global Samba Team[2].

       This manpage and regtree were written by Jelmer Vernooij.

NOTES
        1. Samba
           http://www.samba.org/

        2. Samba Team
           http://www.samba.org/samba/team/



Samba 4.0                                                                                         08/09/2019                                                                                       REGTREE(1)
