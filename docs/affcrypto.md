affcrypto(1)                                                 handle encryption issues                                                 affcrypto(1)

NAME
       affcrypto - handle encryption issues

SYNOPSIS
       affcrypto [options] filename.aff [filename2.aff ... ]

DESCRIPTION
       Command for dealing with encryption issues.

       This file is part of the AFFLIBv3, that provides AFF.

       AFF  is  an  open  and  extensible file format to store disk images and associated metadata. It is useful in several scenaries, as computer
       forensics investigations.

OPTIONS
       General options:

              -j     Just print the number of encrypted segments.

              -J     Just print the number of unencrypted segments.

              -x     Output in XML.

       Data conversion options:

              -e     Encrypt the unencrypted non-signature segments.

              -d     Decrypt the encrypted non-signature segments.

              -r     Change passphrase (take old and new from stdin).

              -O <old>
                     Specify an old passphrase.

              -N <new>
                     Specify new passphrase.

              -K <mykey.key>
                     Specifies a private keyfile for unsealing (may not be repeated).

              -C <mycert.crt>
                     Specifies a certificate file for sealing (may be repeated).

              -S     Add symmetric encryptiong (passphrase) to AFFILE  encrypted  with  public  key  (requires  a  private  key  and  a  specified
                     passphrase).

              -A     Add asymmetric encryption to a AFFILE encrypted with a passphrase (requires a certificate file spcified with the -C option).

       Password Cracking Options:

              -f <file>
                     Crack passwords but read them from file.

              -k     Attempt to crack passwords by reading a list of passwords from ~/.affpassphrase.

              -p <passphrase>
                     Checks to see if passphrase is the passphrase of the file. Exit code is 0 if yes and -1 if not.

       Debugging:

              -D     debug; print out each key as it is tried.

              -l     List the installed hash and encryption algorithms.

              -V     Just print the version number and exit.

NOTES
       This program ignores these environment variables:

              ·  AFFLIB_PASSPHRASE

              ·  AFFLIB_PASSPHRASE_FILE

              ·  AFFLIB_PASSPHRASE_FD

              ·  AFFLIB_DECRYPTING_PRIVATE_KEYFILE

EXAMPLE
       Print if each file is encrypted or not:

           $ affcrypto filename.aff filename2.aff

SEE ALSO
       affcat(1), affcompare(1), affconvert(1), affcopy(1), affdiskprint(1), affinfo(1), affix(1), affrecover(1), affsegment(1), affsign(1), affs‐
       tats(1), affuse(1), affverify(1), affxml(1)

AUTHOR
       The AFFLIB was written by Simson L. Garfinkel <simsong@acm.org> and Basis Technology, Inc.

       This manual page was written by Joao Eriberto Mota Filho <eriberto@debian.org> for the Debian project (but may be used by others).

AFFCRYPTO 3.7.4                                                      Oct 2014                                                         affcrypto(1)
