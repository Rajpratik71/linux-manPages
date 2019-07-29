reglookup(1)                                                                                                                          reglookup(1)

NAME
       reglookup-recover - Windows NT+ registry deleted data recovery tool

SYNOPSIS
       reglookup-recover [options] registry-file

DESCRIPTION
       reglookup-recover attempts to scour a Windows registry hive for deleted data structures and outputs those found in a CSV-like format.

OPTIONS
       reglookup-recover accepts the following parameters:

       -v     Verbose output.

       -h     Enables the printing of a column header row. (default)

       -H     Disables the printing of a column header row.

       -l     Display cells which could not be interpreted as valid registry structures at the end of the output.

       -L     Do not display cells which could not be interpreted as valid registry structures. This is the default behavior.

       -r     Display raw cell contents for cells which were interpreted as intact data structures. This additional output will appear on the same
              line as the interpreted data.

       -R     Do not display raw cell contents for cells which were interpreted as intact data structures. This is the default behavior.

       registry-file
              Required argument. Specifies the location of the registry file to read. The system registry files should be  found  under:  %System‐
              Root%/system32/config.

OUTPUT
       reglookup-recover  generates  a comma-separated values (CSV) like output and writes it to stdout. For more information on the syntax of the
       general format, see reglookup(1).

       This tool is new and the output format, particularly the included columns, may change in future  revisions.  When  this  format  stablizes,
       additional documentation will be included here.

EXAMPLES
       To dump the recoverable contents of a system registry hive:

            reglookup-recover /mnt/win/c/WINDOWS/system32/config/system

       Extract all available unallocated data, including unparsable unallocated space and the raw data associated with parsed cells in a user-spe‐
       cific registry:

            reglookup-recover -r -l '/mnt/win/c/Documents and Settings/user/NTUSER.DAT'

BUGS
       This program has been smoke-tested against most current Windows target platforms, but a comprehensive test suite has not  yet  been  devel‐
       oped.   (Please  report results to the development mailing list if you encounter any bugs. Sample registry files and/or patches are greatly
       appreciated.)

       This program is new as of RegLookup release 0.9.0 and should be considered unstable.

       For more information on registry format details and the recovery algorithm, see:

       http://sentinelchicken.com/research/registry_format/ http://sentinelchicken.com/research/registry_recovery/

CREDITS
       This program was written by Timothy D. Morgan.

LICENSE
       Please see the file "LICENSE" included with this software distribution.

       This program is distributed in the hope that it will be useful, but WITHOUT ANY  WARRANTY;  without  even  the  implied  warranty  of  MER‐
       CHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License version 3 for more details.

SEE ALSO
       reglookup-timeline(1) reglookup-recover(1)

File Conversion Utilities                                         15 August 2016                                                      reglookup(1)
