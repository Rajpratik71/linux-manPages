grokevt-dumpmsgs(1)                                                                                                            grokevt-dumpmsgs(1)

NAME
       grokevt-dumpmsgs - A tool for dumping the contents of message databases built previously by grokevt-ripdll(1).

SYNOPSIS
       grokevt-dumpmsgs  message-db1 [message-db2 ...]  .SH DESCRIPTION grokevt-dumpmsgs takes one or more message databases previously built with
       grokevt-ripdll(1) and prints out all entries to stdout. This is mainly a debugging tool, but may be useful for analyzing the  message  con‐
       tents of PE files while developing other applications.

ARGUMENTS
       grokevt-dumpmsgs uses the following arguments:

       message-dbN
              If multiple message databases are supplied, entries of all databases are printed to stdout in the order they are provided.

OUTOUT
       grokevt-dumpmsgs prints each database entry out on a single line, in two comma-separated columns. The first column is the message ID, which
       is in the format:

                 XXXX-YYYYYYYY

       Here, XXXX represents the message's language code, and the YYYYYYYY represents the message's relative virtual address (RVA) within the mes‐
       sage block of the PE file.  The second column contains the message itself. Messages containing special characters (such as newlines or com‐
       mas) are encoded in the same manner that grokevt-parselog(1) encodes them ("\xQQ" where QQ is the hexadecimal value of the character).

BUGS
       Probably several. This particular script has not been extensively tested.

CREDITS
       Written by Timothy D. Morgan.

       Copyright (C) 2006-2007 Timothy D. Morgan

LICENSE
       Please see the file "LICENSE" included with this software distribution.

       This program is distributed in the hope that it will be useful, but WITHOUT ANY  WARRANTY;  without  even  the  implied  warranty  of  MER‐
       CHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License version 3 for more details.

SEE ALSO
       grokevt(7) grokevt-addlog(1) grokevt-builddb(1) grokevt-findlogs(1) grokevt-parselog(1) grokevt-ripdll(1)

File Conversion Utilities                                          20 March 2008                                               grokevt-dumpmsgs(1)
