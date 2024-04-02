NF2CSV(1)                                                     General Commands Manual                                                    NF2CSV(1)

NAME
       nf2csv - iptables to CSV data

SYNOPSIS
       nf2csv [options]

DESCRIPTION
       nf2csv  Parses  iptables  log messages and generates comma-separate value formatted data.  This is useful to provide input to the AfterGlow
       project (see http://afterglow.sourceforge.net) so iptables logs can be visualized graphically.  An interesting application  of  nf2csv  and
       AfterGlow  is  to  parse  and visualize the iptables logfiles made available by the Honeynet project in their Scan of the Month challenges.
       The Scan30 and Scan34 challenges (see http://www.honeynet.org/scans/scan30/ and  http://www.honeynet.org/scans/scan34/)  contain  extensive
       iptables logfiles, and some graphical representations of these can be viewed here: http://www.cipherdyne.org/psad/honeynet/.  The psad pro‐
       gram also has the ability to generate CSV data from iptables logs with its --CSV mode.

OPTIONS
       -f, --fields <tokens>
              Specify the set of fields that should be printed from iptables log messages. The most common usage of this argument is SRC  DST  DPT
              to  print the source and destination IP addresses, followed by the destination port number.  Available fields to print include: SRC,
              SPT, DST, DPT, PROTO, LEN, IN, TOS, TTL, SEQ, ID, TYPE, CODE (and these can also be referred to as src, dst, sp, dp, proto,  ip_len,
              intf,  tos,  and ttl).  There are several additional fields that are not given specific tags within iptables log messages, and these
              can be included by specifying one of the following: flags, top_opts, ip_opts, chain, log_prefix,  frag_bit,  src_mac,  dst_mac,  and
              udp_len.   Each  of  these fields accepts a search criteria in the form of a numeric comparison, string match, or IP match.  See the
              EXAMPLES section below for more information.

       -u, --unique-lines
              Only print unique output lines.  This can drastically reduce the output of nf2csv depending on the characteristics of  the  iptables
              logfile that is being parsed.

       -m, --max-lines <num>
              Specify the maximum number of output lines nf2csv will generate.  This is useful for providing a limited set of data to AfterGlow in
              order to make visualizations more clear and less cluttered.

       -r, --regex <regex>
              Specify a regular expression that must match against the entire iptables log message in order for it to be included within  the  CSV
              output.   This allows log messages to be included from the output with all of the flexibility of regular expressions.  See the EXAM‐
              PLES section below for more information.

       -n, --neg-regex <regex>
              Specify a regular expression that must not match against the iptables log message in order for it to be included within the CSV out‐
              put.   This allows log messages to be excluded from the output with all of the flexibility of regular expressions.  See the EXAMPLES
              section below for more information.

       -s, --start-line <line>
              Specify the starting line where nf2csv begins to process iptables log data.  If you are processing a huge  file  with  thousands  of
              iptables log messages this option can be useful to parse a specific chunk of this data.  Also see the --end-line option below.

       -e, --end-line <line>
              Specify the last line of iptables log data that nf2csv will parse.

EXAMPLES
       The following examples illustrate the command line arguments that could be supplied to nf2csv in a few situations:

       Print source and destination IP addresses and the destination port number:

       $ nfcsv -f src dst dp

       Same as above, but now require that the source IP come from the 11.11.11.0/24 subnet:

       $ nfcsv -f src:11.11.11.0/24 dst dp

       Display instances of the MyDoom worm:

       $ nfcsv -f src dst dp:3127

       Display packets that have low TTL values:

       $ nfcsv -f src dst ttl:<10

       Display all traffic to or from the host 11.11.11.67 (this sets up an OR condition between the src and dst fields):

       $ nfcsv -f src dst dp -r 11.11.11.67

       Display  likely  instances  of Window Messanger popup spam attempts (note the use of the --regex argument to require minimal lengths on the
       UDP length field and source port, but the output contains the destination port of 1026):

       $ nfcsv -f src dst dp -r SPT={4}.*LEN=[4-9]{2}

SEE ALSO
       psad(8)

AUTHOR
       Michael Rash <mbr@cipherdyne.org>

BUGS
       Send bug reports to mbr@cipherdyne.org.  Suggestions and/or comments are always welcome as well.

DISTRIBUTION
       nf2csv is distributed with the psad project (http://www.cipherdyne.org/psad/) under the GNU General Public License (GPL),  and  the  latest
       version may be downloaded from http://www.cipherdyne.org/

Linux                                                                Jun, 2006                                                           NF2CSV(1)
