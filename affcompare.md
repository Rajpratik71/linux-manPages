affcompare(1)                                   compare the contents of an ISO file to an AFF file                                   affcompare(1)

NAME
       affcompare - compare the contents of an ISO file to an AFF file

SYNOPSIS
       affcompare [options] file1 file2
       affcompare [options] -r dir1 dir2
       affcompare [options] -s file1 file2...

DESCRIPTION
       Compare the contents of an ISO file to an AFF file. Optionally, if they are equal, delete the ISO file.

       This file is part of the AFFLIBv3, that provides AFF.

       AFF  is  an  open  and  extensible file format to store disk images and associated metadata. It is useful in several scenaries, as computer
       forensics investigations.

OPTIONS
       Fast options (compare segments but not their contents):

              -e     Just report about existence (use with -r).

              -p     Report about the results of preening.

              -r     dir1 dir2  Recursively compare what's in dir1 with dir2, and report what's in dir1 that's not in dir2.

              -s     Check to see if named files are on Amazon S3.

       Other options:

              -a     Print what's the same (all).

              -b     Print the numbers of differing sectors.

              -c     Print the contents of differing sectors.

              -h     Show help page.

              -m     Just report about the data (ignore metadata).

              -P <n> Just examine the differences on page 'n'.

              -q     Quiet. No output except for errors.

              -V     Just print the version number and exit.

              -v     Verbose. Show each file as it is compared.

EXAMPLES
       Compare file1 with file2:

           $ affcompare file1.aff file2.aff

       Compare similarly-named files in dir1/ and dir2/:

           $ affcompare -r dir1 dir2

       Reports if files were successfully copied to Amazon S3 checking only for existence, not reading back the bytes (because all  writes  to  S3
       are validated by the MD5 of the object):

           $ affcompare -s file1.aff file2.aff file3.aff

       Compare f1.aff with dir1/f1.aff and f2.aff with dir2/f2.aff:

           $ affcompare f1.aff f2.aff dir1/

       note that dir1/ must end with a slash.

       Compare file.aff and file.img:

           $ affcompare -b img file.aff

       Compare file1.aff, file1.img, etc.:

           $ affcompare -b img file1.aff file2.aff file3.aff

       Report AFF files in dir1 but not in dir2:

           $ affcompare -re dir1 dir2

       Report AFF files in dir1 but not on S3 (low bandwidth):

           $ affcompare -rse dir1 s3:///

       Report AFF files in dir1 but incomplete on on S3 (more bandwidth):

           $ affcompare -rs dir1 s3:///

SEE ALSO
       affcat(1),  affconvert(1), affcopy(1), affcrypto(1), affdiskprint(1), affinfo(1), affix(1), affrecover(1), affsegment(1), affsign(1), affs‐
       tats(1), affuse(1), affverify(1), affxml(1)

AUTHOR
       The AFFLIB was written by Simson L. Garfinkel <simsong@acm.org> and Basis Technology, Inc.

       This manual page was written by Joao Eriberto Mota Filho <eriberto@debian.org> for the Debian project (but may be used by others).

AFFCOMPARE 3.7.4                                                     Oct 2014                                                        affcompare(1)
