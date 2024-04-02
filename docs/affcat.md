AFFCAT(1)                                                     General Commands Manual                                                    AFFCAT(1)

NAME
       affcat - Output contents of an image file to stdout.

SYNOPSIS
       affcat [options] image [images]

DESCRIPTION
       affcat  outputs the contents of an image file to stdout.  Image files that are not raw but are recognized by AFF will be output in raw for‐
       mat. Missing pages will not be padded, but the fact that they are missing will be noted on STDERR.

       The options are as follows:

       -s name
              Output the named segment, instead of the image data. This is a way to output metadata.

       -p nnn Just output page number nnn

       -S nnn Just output data sector number nnn.  Sector #0 is the first sector.

       -q     Quiet mode. Don't print to STDERR if a page is skipped because it is not present.

       -n     Noisy mode. Tell when pages are skipped.

       -l     List all the segment names, rather than outputting data.

       -L     List Long. Prints segment names, lengths, and args.

       -d     Debug mode. Print the page numbers to stderr as data goes to stdout.

       -b     Output BADFALG for bad blocks (default is to output NULLs).

       -v     Just print the version number and exit.

       -r offset:count
              Seek to the given byte offset and output count characters in each file; may be repeated.

HISTORY
       affcat first appeared in AFFLIB v1.00.

AUTHOR
       Simson Garfinkel <simsong@acm.org>

COPYRIGHT
       This file is a work of a US government employee and as such is in the Public domain.

User Manuals                                                         OCT 2008                                                            AFFCAT(1)
