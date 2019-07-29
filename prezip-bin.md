PREZIP-BIN(1)                                            Aspell Abbreviated User's Manual                                            PREZIP-BIN(1)

NAME
       prezip-bin - prefix zip delta word list compressor/decompressor

SYNOPSIS
       prezip-bin [ -V | -d | -z ]

DESCRIPTION
       prezip-bin compresses/decompresses sorted word lists from standard input to standard output.

       Prezip-bin  is  similar  to  word-list-compress(1)  but  it  allows  a  larger  character set of {0x00...0x09, 0x0B, 0x0C, 0x0E...0xFF} and
       multi-words larger than 255 characters in length.  It can also decompress word-list-compress(1) compatible files.

COMMANDS
       Prezip-bin accepts only one of these commands.

       -V     Display prezip-bin version number to standard output.

       -d     Read a compressed word list from standard input and decompress it to standard output.  This can  be  a  word-list-compress(1)  or  a
              prezip-bin compressed file.

       -z     Read a binary word list from standard input and compress it to standard output.

EXAMPLES
       prezip-bin -d <wordlist.cwl >wordlist.txt
              Decompress file wordlist.cwl to text file wordlist.txt

       prezip-bin -z <wordlist.txt >wordlist.pz 2>errors.txt
              Compress wordlist.txt to binary file wordlist.pz and send any error messages to a text file named errors.txt

       LC_COLLATE=C sort -u <wordlist.txt | prezip-bin -z >wordlist.pz
              Sort a word list, then pipe it to prezip-bin to create a compressed binary wordlist.pz file.

       prezip-bin -d <words.pz | aspell create master ./words.rws
              Decompress a wordlist, then pipe it to aspell(1) to create a spelling list.  Please check the aspell(1) info manual for proper usage
              and options.

TIPS
       Prezip-bin is best used with sorted word list type files.  It is not a general purpose compression program since resulting files may  actu‐
       ally increase in size.

       Unlike  word-list-compress(1)  if your word list has leading or trailing blank spaces for formatting purposes, you should remove them first
       before you compress your list using prezip-bin -z , otherwise those spaces will be included in the compressed binary output.

DIAGNOSTICS
       Prezip-bin normally exits with a return code of 0.  If it encounters an error, a message is sent to standard  error  output  (stderr),  and
       prezip-bin exits with a non-zero return value.  Error messages are listed below:

       (display help/usage message)
              Unknown command given on the command line so prezip-bin displays a usage message to standard error output.

       unknown format
              The input file appears not to be an expected format, or may possibly be a more advanced format.  The output file will be empty.

       corrupt input
              This  is only for the decompression command -d.  The input file appeared to be of a correct format, but something appears wrong now.
              There may be some valid data in output, but due to input corruption, the rest of the file can not be completed.

       unexpected EOF
              The input file appeared okay but ended sooner than expected, therefore the output file is not complete.

SEE ALSO
       aspell(1), aspell-import(1), run-with-aspell(1), word-list-compress(1)

       Aspell is fully documented in its Texinfo manual.  See the `aspell' entry in info for more complete documentation.

REPORTING BUGS
       For help, see the Aspell homepage at <http://aspell.net>.  Send bug reports/comments to the Aspell user list at the above address.

AUTHOR
       This info page was written by Jose Da Silva <digital@joescat.com>.

prezip-bin-0.1.2                                                    2005-09-30                                                       PREZIP-BIN(1)
