hzip(1)                                                                                    General Commands Manual                                                                                    hzip(1)



NAME
       hunzip - decompress and decrypt hzip files to the standard output

SYNOPSIS
       hunzip [-h] file.hz [password]

DESCRIPTION
       Hunzip is the decompression and decryption program of hzip format.

OPTIONS
       -h     Display short help description.

EXAMPLE
       hunzip file.hz >file

NOTES
       Redirection  of  the standard output results platform-specific line terminating, so a compressed hzip file with new line terminators would be bigger with the extra CR characters of the decompression
       on Windows platforms.

SEE ALSO
       hunzip (1), hunspell(1)

AUTHOR
       László Németh.



                                                                                                  2008-06-12                                                                                          hzip(1)
