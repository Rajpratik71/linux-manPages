xentrace_format(1)                 Xen                xentrace_format(1)

NAME
       xentrace_format - pretty-print Xen trace data

SYNOPSIS
       xentrace_format [ DEFS-FILE ]

DESCRIPTION
       xentrace_format parses trace data in xentrace binary format from
       standard input and reformats it according to the rules in a file
       of definitions (DEFS-FILE), printing to standard output.

       The rules in DEFS-FILE should have the format shown below:

       event_id whitespace format

       Each rule should start on a new line.

       The format string may include format specifiers, such as:
       %(cpu)d, %(tsc)d, %(event)d, %(1)d, %(2)d, %(3)d, %(4)d, %(5)d

       [ the `d' format specifier output in decimal, alternatively `x'
         will output in hexadecimal and `o' will output in octal ]

       These correspond to the CPU number, event ID, timestamp counter
       and the 5 data fields from the trace record.  There should be one
       such rule for each type of event to be pretty-printed (events
       which do not have formatting rules are ignored).

       A sample format file for Xen's predefined trace events is
       available in the file tools/xentrace/formats in the Xen source
       tree.

       Depending on your system and the rate at which trace data is
       produced, this script may not be able to keep up with the output
       of xentrace if it is piped directly.  In these circumstances you
       should have xentrace output to a file for processing off-line.

AUTHOR
       Mark A. Williamson <mark.a.williamson@intel.com>

SEE ALSO
       xentrace(8)

4.6.5                          2017-03-07             xentrace_format(1)
