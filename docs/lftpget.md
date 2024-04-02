lftpget(1)                             General Commands Manual                             lftpget(1)

NAME
       lftpget - get a file with lftp(1)

SYNOPSIS
       lftpget [-c] [-d] [-v] URL [URL...]

DESCRIPTION
       This manual page documents briefly the lftpget command.

       lftpget  is  a  shell script for downloading by URL, it calls `lftp -c'.  It supports the same
       set of protocols as lftp does, including ftp, http, fish, sftp.

OPTIONS
       -c     Continue a previous download.

       -d     Debug output.

       -v     Verbose messages.

SEE ALSO
       lftp(1), wget(1).

AUTHOR
       lftpget is Copyright (c) 1999-2000 Alexander V. Lukyanov <lav@yars.free.net>.

       This manual page was initially written by Francois  Wendling  <frwendling@free.fr>  and  later
       updated by Alexander V. Lukyanov.

                                           31 December 2005                                lftpget(1)
