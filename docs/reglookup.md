reglookup(1)                                                                                                                          reglookup(1)

NAME
       reglookup - Windows NT+ registry reader/lookup tool

SYNOPSIS
       reglookup [options] registry-file

DESCRIPTION
       reglookup is designed to read windows registry elements and print them out to stdout in a CSV-like format. It has filtering options to nar‐
       row the focus of the output. This tool is designed to work with on Windows NT-based registries.

OPTIONS
       reglookup accepts the following parameters:

       -p prefix-filter
              Specify a path prefix filter. Only keys/values under this registry path will be output.

       -t type-filter
              Specify a type filter. Only elements which match this registry  data  type  will  be  printed.  Acceptable  values  are:  NONE,  SZ,
              EXPAND_SZ, BINARY, DWORD, DWORD_BE, LINK, MULTI_SZ, RSRC_LIST, RSRC_DESC, RSRC_REQ_LIST, QWORD and KEY .

       -h     Enables the printing of a column header row. (default)

       -i     Printed  values  inherit the timestamp of their parent key, which is printed along with them. Note that this timestamp is not neces‐
              sarily meaningful for any given value values because timestamps are saved on keys only and you cannot tell which value has been mod‐
              ified since a change to any value of a given key would update the time stamp.

       -H     Disables the printing of a column header row.

       -s     Adds five additional columns to output containing information from key security descriptors and rarely used fields. The columns are:
              owner, group, sacl, dacl, class.  (This feature's output has not been extensively tested.)

       -S     Disables the printing of security descriptor information. (default)

       -v     Verbose output.

       registry-file
              Required argument. Specifies the location of the registry file to read. The system registry files should be  found  under:  %System‐
              Root%/system32/config.

OUTPUT
       reglookup  generates comma-separated values (CSV) and writes them to stdout. The format is designed to simplify parsing algorithms of other
       tools by quoting CSV special characters using a common hexadecimal format. Specifically, special characters or  non-ascii  bytes  are  con‐
       verted to "%XX" where XX is the hexadecimal value for the byte.

       The  number  of columns or fields in each line is fixed for a given run of the program, but may vary based on the command line options pro‐
       vided.  See the header line for information on which fields are available and what they contain.

       Some fields in some lines may contain sub-fields which require additional delimiters. If these sub-delimiters occur  in  these  sub-fields,
       they are also encoded in the same way as commas or other special characters are.  Currently, the second, third, and fourth level delimiters
       are "|", ":", and " ", respectively. These are particularly important to take note of when security attributes  are  printed.  Please  note
       that these delimiters may occur in fields that are not sub-delimited, and should not be interpreted as special.

       Security  attributes  of  registry  keys  have  a  complex structure which is outlined here. Each key will generally have an associated ACL
       (Access Control List), which is made up of ACEs (Access Control Entries). Each ACE is delimited by the secondary delimiter mentioned above,
       "|".  The  fields  within  an ACE are delimited by the third-level delimiter, ":", and consist of a SID, the ACE type (ALLOW, DENY, etc), a
       list of access rights, and a list of flags. The last two fields are delimited by the fourth-level delimiter " ". These final lists are sim‐
       ply human-readable interpretations of bits. The access rights abbreviations are listed below along with their Microsoft-assigned names:

             QRY_VAL       KEY_QUERY_VALUE
             SET_VAL       KEY_SET_VALUE
             CREATE_KEY    KEY_CREATE_SUB_KEY
             ENUM_KEYS          KEY_ENUMERATE_SUB_KEYS
             NOTIFY        KEY_NOTIFY
             CREATE_LNK    KEY_CREATE_LINK
             WOW64_64      KEY_WOW64_64KEY
             WOW64_32      KEY_WOW64_32KEY
             DELETE        DELETE
             R_CONT        READ_CONTROL
             W_DAC         WRITE_DAC
             W_OWNER       WRITE_OWNER
             SYNC          SYNCHRONIZE
             SYS_SEC       ACCESS_SYSTEM_SECURITY
             MAX_ALLWD          MAXIMUM_ALLOWED
             GEN_A         GENERIC_ALL
             GEN_X         GENERIC_EXECUTE
             GEN_W         GENERIC_WRITE
             GEN_R         GENERIC_READ

       And the meaning of each flag is:

             OI  Object Inherit
             CI  Container Inherit
             NP  Non-Propagate
             IO  Inherit Only
             IA  Inherited ACE

       Please see the following references for more information:

               http://msdn2.microsoft.com/en-gb/library/ms724878.aspx
               http://msdn2.microsoft.com/en-gb/library/aa374892.aspx
               http://msdn2.microsoft.com/en-us/library/aa772242.aspx
               http://support.microsoft.com/kb/220167

       Note  that  some  of the bits listed above have either not been allocated by Microsoft, or simply aren't documented. If any bits are set in
       the above two fields that aren't recognized, a hexidecimal representation of all of these mystery bits will be included in the output.  For
       instance,  if  the lowest bit and third lowest bit were not recognized while being set, the number "0x5" would be included as an element in
       the list.

       While the ACL/ACE output format is mostly stable at this point, minor changes may be introduced in future versions.

EXAMPLES
       To read and print the contents of an entire system registry file:

            reglookup /mnt/win/c/WINNT/system32/config/system

       To limit the output to just those entries under the Services key:

            reglookup -p /ControlSet002/Services /mnt/win/c/WINNT/system32/config/system

       To limit the output to all registry values of type BINARY:

            reglookup -t BINARY /mnt/win/c/WINNT/system32/config/system

       And to limit the output to BINARY values under the Services key:

            reglookup -t BINARY -p /ControlSet002/Services /mnt/win/c/WINNT/system32/config/system

BUGS
       This program has been smoke-tested against most current Windows target platforms, but a comprehensive test suite has not  yet  been  devel‐
       oped.   (Please  report results to the development mailing list if you encounter any bugs. Sample registry files and/or patches are greatly
       appreciated.)

       The SID conversions haven't been carefully checked for accuracy.

       The MTIME conversions appear correctly produce the stored UTC timestamp.  However, due to the periodicity of registry writes, and the  com‐
       plexity  of  the conversion, a small amount of error (on the order of seconds) may be possible. The documentation available online from Mi‐
       crosoft on this field is very poor.

       For more information on registry format details, see: http://sentinelchicken.com/research/registry_format/

CREDITS
       This program was initially based on editreg.c by Richard Sharpe. It has since been rewritten to use a modified version the  regfio  library
       written by Gerald Carter. Heavy modifications to the library and the original command line interface have been done by Timothy D. Morgan.

       Please see source code for a full list of copyrights.

LICENSE
       Please see the file "LICENSE" included with this software distribution.

       This  program  is  distributed  in  the  hope  that  it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MER‐
       CHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License version 3 for more details.

SEE ALSO
       reglookup-timeline(1) reglookup-recover(1)

File Conversion Utilities                                         15 August 2016                                                      reglookup(1)
