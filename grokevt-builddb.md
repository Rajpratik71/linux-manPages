grokevt-builddb(1)                                                                                                              grokevt-builddb(1)

NAME
       grokevt-builddb - Builds a database tree based on a single windows system for the purpose of event log conversion.

SYNOPSIS
       grokevt-builddb  [  -c  CSID ] config-profile output-dir .SH DESCRIPTION grokevt-builddb uses grokevt-ripdll(1) and reglookup(1) along with
       information found in configuration files to extract all necessary information from a windows installation for the conversion of  event  log
       files. The registry is read to determine the locations of critical DLLs and the event log files themselves. This, and other information out
       of the registry is stored in a directory structure which acts as a kind of flat-file database. This database can then be used  by  grokevt-
       parselog(1) to generate human-readable output.

       The key to successfully running this utility is proper configuration. Please see grokevt(7) for information on what needs to be configured.

ARGUMENTS
       config-profile
              This  is  the  name  of  the  configuration profiles stored in the global configuration directory under the directory 'systems'. See
              grokevt(7) for more details on how to properly configure a system profile.

       output-dir
              The path to the location of the output database.  If anything already exists in this directory, it may be overwritten or deleted.

OPTIONS
       -c CSID
              This option allows one to explicitly set which ControlSet in the registry is used to extract event log message mappings.  If  speci‐
              fied,  this  item must be a positive decimal integer.  If unspecified, grokevt-builddb will attempt to determine the best ControlSet
              by looking at the most recent CurrentControlSet, stored in the system registry under the path '/Select/Current'.  Most users  should
              ignore this option unless there is a specific reason why the last CurrentControlSet should not be used.

EXAMPLES
       To generate a database at '~/win2k.grokevt' based on the system configuration profile 'win2k':

             grokevt-builddb win2k ~/win2k.grokevt

       To repeat the last command, instead using registry information explicitly from /ControlSet002:

             grokevt-builddb -c 2 win2k ~/win2k.grokevt

BUGS
       Probably a few. This script has not been extensively tested with some guest platforms.

       The databases built with this script may not be portable to other systems, depending on the database drivers installed and used in Python.

CREDITS
       Written by Timothy D. Morgan.

       Copyright (C) 2005-2007 Timothy D. Morgan

LICENSE
       Please see the file "LICENSE" included with this software distribution.

       This  program  is  distributed  in  the  hope  that  it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MER‐
       CHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License version 2 for more details.

SEE ALSO
       grokevt(7) grokevt-addlog(1) grokevt-dumpmsgs(1) grokevt-findlogs(1) grokevt-parselog(1) grokevt-ripdll(1) reglookup(1)

File Conversion Utilities                                          20 March 2008                                                grokevt-builddb(1)
