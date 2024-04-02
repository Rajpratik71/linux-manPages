affcopy(1)                                               reorder and recompress AFF files                                               affcopy(1)

NAME
       affcopy - reorder and recompress AFF files

SYNOPSIS
       affcopy [options] file1 file
       affcopy [options] file1 file2 file3 ... dir
       affcopy [options] file1 file2 file3 ... dir1 dir2...

DESCRIPTION
       Copy one AFF file to another. Resulting file is re-ordered and possibly re-compressed.

       This file is part of the AFFLIBv3, that provides AFF.

       AFF  is  an  open  and  extensible file format to store disk images and associated metadata. It is useful in several scenaries, as computer
       forensics investigations.

OPTIONS
       General options:

              -d     Print debugging information as well.

              -h     Help, print this message.

              -L     Recompress pages (preen) with LZMA (smaller but slower).

              -m     Just copy the missing segments.

              -V     Print the program version and exit.

              -v     Verbose: print each file as it is copied.

              -vv    Very verbose: print each segment as it is copied.

              -x     Don't verify hashes on reads.

              -Xn    Recompress pages (preen) with zlib level n.

              -y     Don't verify writes.

              -z     ZAP (delete). Copy even if the destination exists.

       Signature Options:

              -k <filename.key>
                     Specify private key for signing.

              -c <filename.cer>
                     Specify a X.509 certificate that matches the private key (by default, the file is assumed to be the same  one  provided  with
                     the -k option).

              -n     Read notes to accompany the copy from standard in.

       Encryption Options:

           Is possible specify passphrase encryption for filename.aff with:
           file://:passphrase@/filename.aff

EXAMPLES
       Copy file1 to file2:

           $ affcopy file1 file

       Copy all files to dir:

           $ affcopy file1 file2 file3 dir

       Copy file1 to dir1, file2 to dir2 and file3 to dir3:

           $ affcopy file1 file2 file3 dir1 dir2 dir3

       Encrypt file.aff:

              $ affcopy
                     file.aff   file://:mypassword@/file-encrypted.aff

       Copy all files in current directory to S3 default bucket with X9 compression:

           $ affcopy -vy -X9 *.aff s3:///

SEE ALSO
       affcat(1),  affcompare(1),  affconvert(1),  affcrypto(1),  affdiskprint(1), affinfo(1), affix(1), affrecover(1), affsegment(1), affsign(1),
       affstats(1), affuse(1), affverify(1), affxml(1)

AUTHOR
       The AFFLIB was written by Simson L. Garfinkel <simsong@acm.org> and Basis Technology, Inc.

       This manual page was written by Joao Eriberto Mota Filho <eriberto@debian.org> for the Debian project (but may be used by others).

AFFCOPY 3.7.4                                                        Oct 2014                                                           affcopy(1)
