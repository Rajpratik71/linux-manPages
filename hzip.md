hunzip(1)                                                                                  General Commands Manual                                                                                  hunzip(1)



NAME
       hunzip - compress and encrypt dictionary files

SYNOPSIS
       hzip [-h] [-P password] [file(s)]

DESCRIPTION
       hunzip  is  a  small utility for text file compression and encryption, especially for sorted dictionaries. "hunspell filename" creates the compressed file "filename.hz" without removing the original
       file.

       The compression algorithm uses 16-bit Huffman encoding and line-oriented prefix-suffix compression. It has good compression ratio for huge sorted word lists.

OPTIONS
       -h     Display short help description.

       -P     Encrypted compression by an arbitrary length password.

SEE ALSO
       hzip (1), hunspell(1)

AUTHOR
       László Németh.



                                                                                                  2008-06-12                                                                                        hunzip(1)
