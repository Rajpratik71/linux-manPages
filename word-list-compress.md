WORD-LIST-COMPRESS(1)                                    Aspell Abbreviated User's Manual                                    WORD-LIST-COMPRESS(1)

NAME
       word-list-compress - word list compressor/decompressor for GNU Aspell

SYNOPSIS
       word-list-compress c[ompress] | d[ecompress]

DESCRIPTION
       word-list-compress compresses or decompresses sorted word lists for use with the GNU Aspell spell checker.

COMMANDS
       -c, c, compress
              compress the plain text word list read from standard input.

       -d, d, decompress
              decompress the compressed word list read from standard input.

EXAMPLES
       Here are a few examples of how you can use word-list-compress

       word-list-compress d <wordlist.cwl >wordlist.txt
              Decompress file wordlist.cwl to text file wordlist.txt

       word-list-compress c <wordlist.wl >wordlist.cwl 2>errors.txt
              Compress wordlist.wl to wordlist.cwl and send any error messages to a text file named errors.txt

       LC_COLLATE=C sort -u <wordlist.txt | word-list-compress c >wordlist.cwl
              Sort a word list, then pipe it to word-list-compress to create a compressed binary wordlist.cwl file.

       word-list-compress d <words.cwl | aspell create master ./words.rws
              Decompress a wordlist, then pipe it to aspell(1) to create a spelling list.  Please check the aspell(1) info manual for proper usage
              and options.

TIPS
       Word-list-compress is best used with sorted word list type files.  It is not a general purpose  compression  program  since  the  resulting
       files may actually increase in size.

       Word-list-compress  accepts up to 255 text characters in the range of {0x21...0xFF}.  If your word list requires a larger character set for
       certain languages or longer length for multi-word, scientific, medical, technical or other use, then it is recommended  that  you  compress
       your word list using prezip-bin(1)

DIAGNOSTICS
       Word-list-compress normally exits with a return code of 0.  If it encounters an error, a message is sent to standard error output (stderr),
       and word-list-compress exits with a non-zero return value.  Error messages are listed below:

       (display help/usage message)
              Unknown command given on the command line so word-list-compress displays a usage message to standard error output.

       Corrupt Input
              This is only for the decompression command d.  The input file is of an unknown format or the input file/stream  is  corrupted.   You
              may  have  some valid output, but word-list-compress could not complete the process.  If the input file is a compressed wordlist but
              you have no output file, then it may be a newer prezip-bin(1) version of compressed file, if so, try  decompressing  the  file  with
              prezip-bin(1) instead.

       Output Data Error
              The output is full, write protected, or has an error and can no longer be written to.

SEE ALSO
       aspell(1), aspell-import(1), prezip-bin(1), run-with-aspell(1)

       Aspell is fully documented in its Texinfo manual.  See the `aspell' entry in info for more complete documentation.

REPORTING BUGS
       For help, see the Aspell homepage at <http://aspell.net> and send bug reports/comments to the Aspell user list at the above address.

AUTHOR
       This manual page was written by Aaron Lehmann <aaronl@vitelus.com>, Brian Nelson <pyro@debian.org> and Jose Da Silva <digital@joescat.com>.

GNU                                                                 2005-09-05                                               WORD-LIST-COMPRESS(1)
