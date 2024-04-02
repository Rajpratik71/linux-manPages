vss_strip(8)                                                         vss_strip                                                        vss_strip(8)

NAME
       vss_strip - program for extracting file data from a file containing VSS headers

SYNOPSIS
       vss_strip [options]

       A program for extracting file data from a file containing VSS headers. This program comes with the burp backup and restore package.

OPTIONS
       -i path
              Input file. If -i is not given, input will be read on stdin.

       -o path
              Output file. If -o is not given, output will be read on stdout.

       -p     Print VSS header info.

       -h|-?  Print help text and exit.

EXAMPLES
       vss_strip -i infile -o outfile
              Takes uncompressed infile, and extracts the file data to outfile.

       zcat infile.gz | vss_strip
              Takes the output of zcat as input, and outputs to stdout.

BUGS
       If you find bugs, please report them to the email list. See the website <http://burp.grke.net/> for details.

AUTHOR
       The main author of Burp is Graham Keeling.

COPYRIGHT
       See the LICENCE file included with the source distribution.

                                                                 November 2, 2012                                                     vss_strip(8)
