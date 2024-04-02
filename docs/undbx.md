undbx(1)                                                               undbx                                                              undbx(1)

NAME
       undbx - a tool to extract e-mails from Outlook Express .dbx files.

SYNOPSIS
       undbx [options]<DBX-DIRECTORY|DBX-FILE>[<OUTPUT-DIRECTORY>]

DESCRIPTION
       undbx is a tool to extract, recover and undelete e-mails messages from Outlook Express .dbx files.

       Email are extracted in individual .eml files.

       When  a  target  directory  is specified, undbx will extract e-mails from dbx files found in this directory.  Instead of providing a target
       directory, the usr can provide a target dbx file.

       When no output directory is specified, undbx will extract emails in a subdirectory of the current directory.

       In normal mode (not recovery), a message is extracted only if there is no corresponding .eml file in the destination directory.

       On the other hand, if a .eml file exists in the destination directory and no corresponding mail is found in the .dbx file, the mail is con‐
       sidered deleted and undbx will delete this .eml file.  This way, undbx can be used as an synchronization backup tool for .dbx files.

       The  file  names of .eml files are composed by the From, To and Subject: header fields.  The modification time of each file is set to match
       the date specified in the Date field of the mail header.

OPTIONS
       --help Provides a short help message.

       --recover
              undbx attempt to recover e-mail messages from a corrupted .dbx file.

       In this mode fragments of messages are collected into .eml files. This may take a long time and some messages maybe corrupted.

       Also, all messages are extracted, not only the new ones.

       --version
              Shows the version string

SEE ALSO
       pffinfo(1) pffexport(1) munpack(1)

AUTHOR
       This manual page was written by Christophe Monniez <christophe.monniez@fccu.be> for the Debian system (but may be used by others).

       Permission is granted to copy, distribute and/or modify this document under the terms of the GNU General Public License, Version 3  or  any
       later version published by the Free Software Foundation

       On Debian systems, the complete text of the GNU General Public License can be found in /usr/share/common-licenses/GPL.

                                                                 February 23, 2011                                                        undbx(1)
