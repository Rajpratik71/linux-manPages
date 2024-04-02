grokevt-findlogs(1)                                                                                                            grokevt-findlogs(1)

NAME
       grokevt-findlogs - Attempts to find log file fragments in raw binary files, such as memory dumps and disk images.

SYNOPSIS
       grokevt-findlogs  -?   .PP grokevt-findlogs [-v] [-h] [-H] [-o offset] raw-file .SH DESCRIPTION grokevt-findlogs searches a raw binary file
       for event log records. It produces a simple comma-separated values (CSV) output to stdout which includes metadata and offsets of any  hits.
       Using the metadata and offset/contiguity information, it should be easy to determine if the hits are false positives or not.

ARGUMENTS
       raw-file
              The binary file to be searched.

OPTIONS
       -?     Prints a basic usage statement.

       -v     Verbose mode. Prints status messages to stderr, which can be helpful for debugging. (Currently does nothing.)

       -h     Prints a header row at the top of the CSV output containing labels for each column. (This is the default behavior.)

       -H     Disables the printing of a header row. This is useful when grokevt-findlogs is used in a script.

       -o offset
              Begin search at this byte offset within the binary file.

BUGS
       Probably a few. This script has not been extensively tested with some guest platforms.

       There are likely some speed improvements that could be made.

CREDITS
       Written by Timothy D. Morgan

       Copyright (C) 2006-2007 Timothy D. Morgan

LICENSE
       Please see the file "LICENSE" included with this software distribution.

       This  program  is  distributed  in  the  hope  that  it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MER‐
       CHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License version 2 for more details.

SEE ALSO
       grokevt(7) grokevt-addlog(1) grokevt-builddb(1) grokevt-dumpmsgs(1) grokevt-parselog(1) grokevt-ripdll(1)

File Conversion Utilities                                          20 March 2008                                               grokevt-findlogs(1)
