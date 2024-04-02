IDN(1)                                                                                          User Commands                                                                                          IDN(1)



NAME
       idn - Internationalized Domain Names command line tool

SYNOPSIS
       idn [OPTION]... [STRINGS]...

DESCRIPTION
       Internationalized Domain Name (IDN) convert STRINGS, or standard input.

       Command line interface to the internationalized domain name library.

       All  strings are expected to be encoded in the preferred charset used by your locale.  Use `--debug' to find out what this charset is.  You can override the charset used by setting environment vari-
       able CHARSET.

       To process a string that starts with `-', for example `-foo', use `--' to signal the end of parameters, as in `idn --quiet -a -- -foo'.

       Mandatory arguments to long options are mandatory for short options too.

       -h, --help
              Print help and exit

       -V, --version
              Print version and exit

       -s, --stringprep
              Prepare string according to nameprep profile

       -d, --punycode-decode
              Decode Punycode

       -e, --punycode-encode
              Encode Punycode

       -a, --idna-to-ascii
              Convert to ACE according to IDNA (default mode)

       -u, --idna-to-unicode
              Convert from ACE according to IDNA

       --allow-unassigned
              Toggle IDNA AllowUnassigned flag (default off)

       --usestd3asciirules
              Toggle IDNA UseSTD3ASCIIRules flag (default off)

       --no-tld
              Don't check string for TLD specific rules Only for --idna-to-ascii and --idna-to-unicode

       -n, --nfkc
              Normalize string according to Unicode v3.2 NFKC

       -p, --profile=STRING
              Use specified stringprep profile instead Valid stringprep profiles: `Nameprep', `iSCSI', `Nodeprep', `Resourceprep', `trace', `SASLprep'

       --debug
              Print debugging information

       --quiet
              Silent operation

AUTHOR
       Written by Simon Josefsson.

REPORTING BUGS
       Report bugs to: bug-libidn@gnu.org
       GNU Libidn home page: <http://www.gnu.org/software/libidn/>
       General help using GNU software: <http://www.gnu.org/gethelp/>

COPYRIGHT
       Copyright © 2013 Simon Josefsson.  License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>.
       This is free software: you are free to change and redistribute it.  There is NO WARRANTY, to the extent permitted by law.

SEE ALSO
       The full documentation for idn is maintained as a Texinfo manual.  If the info and idn programs are properly installed at your site, the command

              info idn

       should give you access to the complete manual.



idn 1.28                                                                                          July 2016                                                                                            IDN(1)
