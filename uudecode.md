uuencode(1)                                                                                General Commands Manual                                                                                uuencode(1)



NAME
       uuencode, uudecode - encode a binary file, or decode its representation

SYNOPSIS
       uuencode [-m] [ file ] name

       uudecode [-o outfile] [ file ]...

DESCRIPTION
       Uuencode and uudecode are used to transmit binary files over channels that support only simple ASCII data.

       Uuencode  reads file (or by default the standard input) and writes an encoded version to the standard output, using only printable ASCII characters.  The encoded output begins with a header, for use
       by uudecode, which records the mode of the input file and suggests name for the decoded file that will be created.  (If name is /dev/stdout then uudecode will decode to standard output.)  The encod-
       ing has the format documented at uuencode(5), unless the option -m is given, when base64 encoding is used instead.

       Note: uuencode uses buffered input and assumes that it is not hand typed from a tty.  The consequence is that at a tty, you may need to hit Ctl-D several times to terminate input.

       Uudecode  transforms  uuencoded files (or standard input) into the original form.  The resulting file is named name (or outfile if the -o option is given) and will have the mode of the original file
       except that setuid and execute bits are not retained.  If outfile or name is /dev/stdout the result will be written to standard output.  Uudecode ignores any leading and trailing lines.  The program
       determines from the header which of the two supported encoding schemes was used.

EXAMPLES
       The following example packages up a source tree, compresses it, uuencodes it and mails it to a user on another system.  When uudecode is run on the target system, the file ``src_tree.tar.Z'' will be
       created which may then be uncompressed and extracted into the original tree.

              tar cf - src_tree | compress |
              uuencode src_tree.tar.Z | mail sys1!sys2!user

SEE ALSO
       compress(1), mail(1), uucp(1), uuencode(5)

STANDARDS
       This implementation is compliant with P1003.2b/D11.

BUGS
       If more than one file is given to uudecode and the -o option is given or more than one name in the encoded files are the same the result is probably not what is expected.

       The encoded form of the file is expanded by 37% for UU encoding and by 35% for base64 encoding (3 bytes become 4 plus control information).

REPORTING BUGS
       Report bugs to <bug-gnu-utils@gnu.org>.  Please put sharutils or uuencode in the subject line.  It helps to spot the message.

HISTORY
       The uuencode command appeared in BSD 4.0.



                                                                                                                                                                                                  uuencode(1)
