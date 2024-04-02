READPST(1)                                                libpst Utilities - Version 0.6                                                READPST(1)

NAME
       readpst - convert PST (MS Outlook Personal Folders) files to mbox and other formats

SYNOPSIS
       readpst [-C default-charset] [-D] [-M] [-S] [-V] [-b] [-c format] [-d debug-file] [-e] [-h] [-j jobs] [-k] [-m] [-o output-directory] [-q]
               [-r] [-t output-type-codes] [-u] [-w] pstfile

DESCRIPTION
       readpst is a program that can read an Outlook PST (Personal Folders) file and convert it into an mbox file, a format suitable for KMail, a
       recursive mbox structure, or separate emails.

OPTIONS
       -C default-charset
           Set the character set to be used for items with an unspecified character set.

       -D
           Include deleted items in the output.

       -M
           Output messages in MH (rfc822) format as separate files. This will create folders as named in the PST file, and will put each email
           together with any attachments into its own file. These files will be numbered from 1 to n with no leading zeros. This format has no
           from quoting.

       -S
           Output messages into separate files. This will create folders as named in the PST file, and will put each email in its own file. These
           files will be numbered from 1 to n with no leading zeros. Attachments will also be saved in the same folder as the email message. The
           attachments for message $m are saved as $m-$name where $name is (the original name of the attachment, or ´attach$n´ if the attachment
           had no name), where $n is another sequential index with no leading zeros. This format has no from quoting.

       -V
           Show program version and exit.

       -b
           Do not save the attachments for the RTF format of the email body.

       -c format
           Set the Contact output mode. Use -cv for vcard format or -cl for an email list.

       -d debug-file
           Specify name of debug log file. The log file is now an ascii file, instead of the binary file used in previous versions.

       -e
           Same as the M option, but each output file will include an extension from (.eml, .ics, .vcf). This format has no from quoting.

       -h
           Show summary of options and exit.

       -j jobs
           Specifies the maximum number of parallel jobs. Specify 0 to suppress running parallel jobs. Folders may be processed in parallel.
           Output formats that place each mail message in a separate file (-M, -S, -e) may process the contents of individual folders in parallel.

       -k
           Changes the output format to KMail. This format uses mboxrd from quoting.

       -m
           Same as the e option, but write .msg files also

       -o output-directory
           Specifies the output directory. The directory must already exist, and is entered after the PST file is opened, but before any
           processing of files commences.

       -q
           Changes to silent mode. No feedback is printed to the screen, except for error messages.

       -r
           Changes the output format to Recursive. This will create folders as named in the PST file, and will put all emails in a file called
           "mbox" inside each folder. These files are then compatible with all mbox-compatible email clients. This format uses mboxrd from
           quoting.

       -t output-type-codes
           Specifies the item types that are processed. The argument is a sequence of single letters from (e,a,j,c) for (email, appointment,
           journal, contact) types. The default is to process all item types.

       -u
           Sets Thunderbird mode, a submode of recursive mode. This causes two extra .type and .size meta files to be created. This format uses
           mboxrd from quoting.

       -w
           Overwrite any previous output files. Beware: When used with the -S switch, this will remove all files from the target folder before
           writing. This is to keep the count of emails and attachments correct.

FROM QUOTING
       Output formats that place each mail message in a separate file (-M, -S, -e, -m) don´t do any from quoting. Output formats that place
       multiple email messages in a single file (-k, -r, -u) now use mboxrd from quoting rules. If none of those switches are specified, the
       default output format uses mboxrd from quoting rules, since it produces multiple email messages in a single file. Earlier versions used
       mboxo from quoting rules for all output formats.

AUTHOR
       This manual page was originally written by Dave Smith <dave.s@earthcorp.com>, and updated by Joe Nahmias <joe@nahmias.net> for the Debian
       GNU/Linux system (but may be used by others). It was subsequently updated by Brad Hards <bradh@frogmouth.net>, and converted to xml format
       by Carl Byington <carl@five-ten-sg.com>.

COPYRIGHT
       Copyright (C) 2002 by David Smith <dave.s@earthcorp.com>. XML version Copyright (C) 2008 by 510 Software Group <carl@five-ten-sg.com>.

       This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by
       the Free Software Foundation; either version 2, or (at your option) any later version.

       You should have received a copy of the GNU General Public License along with this program; see the file COPYING. If not, please write to
       the Free Software Foundation, 675 Mass Ave, Cambridge, MA 02139, USA.

VERSION
       0.6.59

readpst 0.6.59                                                      2011-05-27                                                          READPST(1)
