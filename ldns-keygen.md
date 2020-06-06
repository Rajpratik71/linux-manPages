ldns-keygen(1)                                                                             General Commands Manual                                                                             ldns-keygen(1)



NAME
       ldns-keygen - generate a DNSSEC key pair

SYNOPSIS
       ldns-keygen [ OPTION ] DOMAIN


DESCRIPTION
       ldns-keygen  is used to generate a private/public keypair. When run, it will create 3 files; a .key file with the public DNSKEY, a .private file with the private keydata and a .ds with the DS record
       of the DNSKEY record.

       ldns-keygen can also be used to create symmetric keys (for TSIG) by selecting the appropriate algorithm: hmac-md5.sig-alg.reg.int, hmac-sha1 or hmac-sha256.  In that case no DS record will  be  cre‐
       ated and no .ds file.

       ldns-keygen prints the basename for the key files: K<name>+<alg>+<id>


OPTIONS
       -a <algorithm>
              Create  a key with this algorithm. Specifying 'list' here gives a list of supported algorithms.  Several alias names are also accepted (from older versions and other software), the list gives
              names from the RFC.  Also the plain algo number is accepted.


       -b <bits>
              Use this many bits for the key length.


       -k     When given, generate a key signing key. This just sets the flag field to 257 instead of 256 in the DNSKEY RR in the .key file.


       -r device
              Make ldns-keygen use this file to seed the random generator with. This will default to /dev/random.


       -v     Show the version and exit


AUTHOR
       Written by the ldns team as an example for ldns usage.


REPORTING BUGS
       Report bugs to <ldns-team@nlnetlabs.nl>.


COPYRIGHT
       Copyright (C) 2005-2008 NLnet Labs. This is free software. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.



                                                                                                 27 May 2008                                                                                   ldns-keygen(1)
