reglookup-timeline(1)                                                                                                        reglookup-timeline(1)

NAME
       reglookup-timeline - Windows NT+ registry MTIME timeline generator

SYNOPSIS
       reglookup-timeline [-H] registry-file [registry-file ...]

DESCRIPTION
       This  script  is  a  wrapper for reglookup(1), and reads one or more registry files to produce an MTIME-sorted output. This is helpful when
       building timelines for forensic investigations.

PARAMETERS
       reglookup-timeline accepts one or more registry file names. All of the provided registries will be parsed using reglookup(1). The -H option
       may be used to omit the header line.

OUTPUT
       reglookup-timeline  generates  a  comma-separated  values  (CSV)  compatible  format  to stdout. While the output of reglookup-timeline and
       reglookup(1) differ in the columns returned, the base format is the same.

       Currently, reglookup-timeline returns three columns: MTIME, FILE, and PATH. Only rows representing registry keys are returned, since MTIMEs
       are  not  stored  for  values. The FILE column indicates which registry file (provided as an argument) the key came from. Finally, the PATH
       field contains the full registry path to the key. Records are returned sorted in ascending order based on the MTIME column.

BUGS
       This script is new, and as such it's interface may change significantly over the next few revisions. In particular, additional command line
       options will likely be added, and the output of the script may be altered in minor ways.

       It  is very difficult to find documentation on what precise operations cause the MTIMEs to be updated. Basic experimentation indicates that
       a key's stamp is updated anytime an immediate sub-value or sub-key is created, renamed, deleted, or it's value is modified. If  this  MTIME
       data is critical to an investigation, any conclusions should be validated through experimentation in a controlled lab environment.

       This software should be considered unstable at this time.

CREDITS
       This script was written by Timothy D. Morgan based on suggestions from Uwe Danz.

       Please see source code for a full list of copyrights.

LICENSE
       Please see the file "LICENSE" included with this software distribution.

       This  program  is  distributed  in  the  hope  that  it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MER‐
       CHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License version 3 for more details.

SEE ALSO
       reglookup(1) reglookup-recover(1)

File Conversion Utilities                                         15 August 2016                                             reglookup-timeline(1)
