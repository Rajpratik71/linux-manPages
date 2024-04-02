
hashid(7)                                                         hashid man page                                                        hashid(7)

NAME
       hashid - Identify the different types of hashes used to encrypt data

SYNOPSIS
       hashid [-h] [-e] [-m] [-j] [-o FILE] [--version] INPUT

DESCRIPTION
       hashID is a tool written in Python 3.x which supports the identification of over 210 unique hash types using regular expressions.

       It  is able to identify a single hash, parse a file or read files in a directory and identify the hashes within them.  hashID is also capa‐
       ble of including the corresponding hashcat mode and/or JohnTheRipper format in its output.  Altough hashID is  written  in  Python  3.x  it
       should also work with Python 2.7.

OPTIONS
       -e, --extended
              list all possible hash algorithms including salted passwords

       -m, --mode
              include corresponding hashcat mode in output

       -j, --john
              include corresponding JohnTheRipper format in output

       -o FILE, --outfile FILE
              write output to file (default: STDOUT)

       -h, --help
              show help message and exit

       --version
              show program's version number and exit

BUGS
       If you find a bug, please report it at https://github.com/psypanda/hashID/issues

AUTHOR
       c0re (c0re@psypanda.org)

v1.4                                                              28 January 2014                                                        hashid(7)
