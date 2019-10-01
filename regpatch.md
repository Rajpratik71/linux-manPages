REGPATCH(1)                                                                              System Administration tools                                                                              REGPATCH(1)



NAME
       regpatch - Applies registry patches to registry files

SYNOPSIS
       regpatch [--help] [--backend=BACKEND] [--credentials=CREDENTIALS] [location] [patch-file]

DESCRIPTION
       The regpatch utility applies registry patches to Windows registry files. The patch files should have the same format as is being used by the regdiff utility and regedit32.exe from Windows.

       If no patch file is specified on the command line, regpatch attempts to read it from standard input.

OPTIONS
       --help
           Show list of available options.

       --backend BACKEND
           Name of backend to load. Possible values are: creg, regf, dir and rpc. The default is dir.

       --credentials=CREDENTIALS
           Credentials to use, if any. Password should be separated from user name by a percent sign.

VERSION
       This man page is correct for version 4.0 of the Samba suite.

SEE ALSO
       regdiff, regtree, regshell, gregedit, samba, diff, patch

AUTHOR
       This utility is part of the Samba[1] suite, which is developed by the global Samba Team[2].

       This manpage and regpatch were written by Jelmer Vernooij.

NOTES
        1. Samba
           http://www.samba.org/

        2. Samba Team
           http://www.samba.org/samba/team/



Samba 4.0                                                                                         08/09/2019                                                                                      REGPATCH(1)
