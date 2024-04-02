grokevt-parselog(1)                                                                                                            grokevt-parselog(1)

NAME
       grokevt-parselog - Parse a windows event log and generate human-readable output based on message resources stored in a database.

SYNOPSIS
       grokevt-parselog  -?|--help  .PP  grokevt-parselog  -l database-dir .PP grokevt-parselog -m database-dir log-type .PP grokevt-parselog [-v]
       [-H] [-h] [-U] [-u] database-dir log-type .SH DESCRIPTION grokevt-parselog reads a windows event log (.evt file) and combines that informa‐
       tion  with  messages  templates and other resources stored in a pre-generated database. This is then printed to stdout in a comma-separated
       values (CSV) format.  The database must be created by grokevt-builddb(1).

ARGUMENTS
       database-dir
              This is the directory where the database is stored. Currently, the actual log files from the original system are also stored in this
              directory tree.

       log-type
              This is the windows name for the log. By default windows has the following logs:

                           Application
                           Security
                           System

              But  others  may  have  been created by third party software. Use the -l option to print a list of all available log types. (The log
              names are case-sensitive.)

OPTIONS
       -?     Prints a basic usage statement.

       --help Same as -?.

       -l     Log list mode. Lists the logs available in the specified database.

       -m     Meta information mode. Lists meta information stored in the header of the specified log file. Does not print any actual log records.
              (Format of output in this mode is still subject to change.)

       -v     Verbose mode. Prints status messages to stderr, which can be helpful for debugging.

       -h     Prints a header row at the top of the CSV output containing labels for each column. (This is the default behavior.)

       -H     Disables the printing of a header row. This is useful when grokevt-parselog is used in a script.

       -u     Enables the UTF-8 output of some strings. This can be dangerous on terminals that are not configured to support UTF-8.

       -U     Disables  the use of UTF-8 for output.  Unicode strings are instead converted to UTF-8 first, and then any remaining non-ASCII char‐
              acters are quoted. (This is the default behavior.)

EXAMPLES
       To list all available logs types stored in '~/example.grokevt':

              grokevt-parselog -l ~/example.grokevt

       To read the 'Application' log from the database stored in '~/example.grokevt' and print it to stdout:

              grokevt-parselog ~/example.grokevt Application

       To read the 'System' log from the database stored in '~/example.grokevt' and print it to stdout without a header, and with verbosity turned
       on:

              grokevt-parselog -v -H ~/example.grokevt System

BUGS
       Probably a few. This script has not been extensively tested with some guest platforms.

       The  file  event log file format is pretty well understood and implemented, but some diabolical wrapped, dirty, or fragmentary logs may not
       be correctly parsed.

       Unicode support is currently limited. Any suggestions on how to better handle unicode output would be appreciated.

CREDITS
       Originally written by Jamie French.  Converted to Python and extended by Timothy D. Morgan.  Andreas Schuster has  contributed  greatly  to
       the understanding of the event log format.

       Copyright (C) 2005-2007 Timothy D. Morgan

       Copyright (C) 2004 Jamie French

LICENSE
       Please see the file "LICENSE" included with this software distribution.

       This  program  is  distributed  in  the  hope  that  it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MER‐
       CHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License version 2 for more details.

SEE ALSO
       grokevt(7) grokevt-addlog(1) grokevt-builddb(1) grokevt-dumpmsgs(1) grokevt-findlogs(1) grokevt-ripdll(1)

File Conversion Utilities                                          20 March 2008                                               grokevt-parselog(1)
