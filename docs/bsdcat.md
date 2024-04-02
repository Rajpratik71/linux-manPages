BSDCAT(1)                            BSD General Commands Manual                            BSDCAT(1)

NAME
     bsdcat — expand files to standard output

SYNOPSIS
     bsdcat [options] [files]

DESCRIPTION
     bsdcat expands files to standard output.

OPTIONS
     bsdcat typically takes a filename as an argument or reads standard input when used in a pipe. In
     both cases decompressed data it written to standard output.

EXAMPLES
     To decompress a file:

           bsdcat example.txt.gz > example.txt

     To decompress standard input in a pipe:

           cat example.txt.gz | bsdcat > example.txt

     Both examples achieve the same results - a decompressed file by redirecting output.

SEE ALSO
     uncompress(1), zcat(1), bzcat(1), xzcat(1), libarchive-formats(5),

BSD                                         March 1, 2014                                         BSD
