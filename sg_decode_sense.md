SG_DECODE_SENSE(8)                                                                                SG3_UTILS                                                                                SG_DECODE_SENSE(8)



NAME
       sg_decode_sense - decode SCSI sense data

SYNOPSIS
       sg_decode_sense [--binary=FN] [--file=FN] [--help] [--hex] [--nospace] [--status=SS] [--verbose] [--version] [--write=WFN] [H1 H2 H3 ...]

DESCRIPTION
       This  utility  takes  SCSI  sense  data in binary or as a sequence of ASCII hexadecimal bytes and decodes it. The primary reference for the decoding is SPC-3 ANSI INCITS 408-2005 and the most recent
       draft SPC-4 revision 29 which can be found at http://www.t10.org and other locations on the internet.

       SCSI sense data is often found in kernel log files as a result of something going wrong but may just be informative. It is often shown as a sequence of hexadecimal bytes, starting with 70,  71,  72,
       73, f0 or f1.  Sense data could be up to 252 bytes long but typically is much shorter than that, 18 bytes long is often seen and is usually associated with the older "fixed" format sense data.

       The sense data can be provided on the command line or in a file. If given on the command line the sense data should be a sequence of hexadecimal bytes separated by space. Alternatively a file can be
       given with the contents in binary or ASCII hexadecimal bytes. The latter form can contain several lines each with none, one or more ASCII hexadecimal bytes separated by space  (comma  or  tab).  The
       hash symbol may appear and it and the rest of the line is ignored making it useful for comments.

OPTIONS
       Arguments to long options are mandatory for short options as well.

       -b, --binary=FN
              the sense data is read in binary from a file called FN.

       -h, --help
              output the usage message then exit.

       -H, --hex
              this  option  is  used in conjunction with --write=WFN in order to change the output written to WFN to lines of ASCII hex bytes suitable for a C language compiler. Each line contains up to 16
              bytes (e.g. a line starting with "0x3b,0x07,0x00,0xff").

       -f, --file=FN
              the sense data is read in ASCII hexadecimal from a file called FN.  The sense data should appear as a sequence of bytes separated by space, comma, tab or newline. Everything from and  includ‐
              ing a hash symbol to the end of that line is ignored. If --nospace is set then no separator is required between the ASCII hexadecimal digits in FN with bytes decoded from pairs of ASCII hexa‐
              decimal digits.

       -n, --nospace
              expect ASCII hexadecimal to be a string of hexadecimal digits with no spaces between them. Bytes are decoded by taking two hexadecimal digits at a  time,  so  an  even  number  of  digits  is
              expected. The string of hexadecimal digits may be on the command line (replacing "H1 H2 H3") or spread across multiple lines the FN given to --file=.

       -s, --status=SS
              where SS is a SCSI status byte value, given in hexadecimal. The SCSI status byte is related to but distinct from sense data.

       -v, --verbose
              increase the degree of verbosity (debug messages).

       -V, --version
              output version string then exit.

       -w, --write=WFN
              writes  the  sense data out to a file called WFN. If necessary WFN is created. If WFN exists then it is truncated prior to writing the sense data to it. If the --hex option is also given then
              ASCII hex is written to WFN (see the --hex option description); otherwise binary is written to WFN. This option is a convenience and may be helpful in converting the ASCII hexadecimal  repre‐
              sentation of sense data (or anything else) into the equivalent binary or a compilable ASCII hex form.

NOTES
       Unlike  most  utilities  in  this  package,  this utility does not access a SCSI device (logical unit). This utility accesses a library associated with this package. Amongst other things the library
       decodes SCSI sense data.

EXAMPLES
       Sense data is often printed out in kernel logs and sometimes on the command line when verbose or debug flags are given. It will be at least 8 bytes long, often 18 bytes long but  may  be  longer.  A
       sense data string might look like this:

       f0 00 03 00 00 12 34 0a  00 00 00 00 11 00 00 00
       00 00

       Cut and paste it after the sg_decode_sense command:

         sg_decode_sense f0 00 03 00 00 12 34 0a 00 00 00 00 11 00 00 00 00 00

       and for this sense data the output should look like this:

        Fixed format, current;  Sense key: Medium Error
        Additional sense: Unrecovered read error
         Info fld=0x1234 [4660]

       For a medium error the Info field is the logical block address (LBA) of the lowest numbered block that the associated SCSI command was not able to read (verify or write).

EXIT STATUS
       The exit status of sg_decode_sense is 0 when it is successful. Otherwise see the sg3_utils(8) man page.

AUTHORS
       Written by Douglas Gilbert.

REPORTING BUGS
       Report bugs to <dgilbert at interlog dot com>.

COPYRIGHT
       Copyright © 2010-2011 Douglas Gilbert
       This software is distributed under a FreeBSD license. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

SEE ALSO
       sg_requests(sg3_utils)



sg3_utils-1.32                                                                                    March 2011                                                                               SG_DECODE_SENSE(8)
