AMGPGCRYPT(8)                                                                           System Administration Commands                                                                          AMGPGCRYPT(8)



NAME
       amgpgcrypt - reference crypt program for Amanda public-key data encryption

SYNOPSIS
       amgpgcrypt  to be called by Amanda only

DESCRIPTION
       amgpgcrypt calls gpg to perform public-key data encryption on Amanda backup.  amgpgcrypt will search for the gpg program in the following directories: /usr/local/bin:/usr/bin:/usr/sbin:/bin:/sbin

       amgpgcrypt sets GNUPGHOME to $AMANDA_HOME/.gnupg where gpg will look for the gpg keys.  amgpgcrypt uses the public key to encrypt the Amanda data and uses the private key to decrypt the Amanda
       backup data. Thus, passphrase is only required at the time of data restore.

KEY AND PASSPHRASE
       amgpgcrypt uses the private key to decrypt Amanda backup data.

       It is very important to store, manage and  protect the key and the passphrase properly. Encrypted backup data can only be recovered with the correct key and passphrase.

HOW TO CREATE ENCRYPTION KEYS AND PASSPHRASE FOR AMGPGCRYPT
       Store the passphrase that you used in following "gpg --gen-key" command inside the home-directory of the AMANDA-user($amanda_user) and protect it with proper permissions:

          echo my_secret_passphrase > ~$amanda_user/.am_passphrase
          chown $amanda_user:disk ~$amanda_user/.am_passphrase
          chmod 700 ~$amanda_user/.am_passphrase

       Run "gpg --gen-key". Below is an example:
       $ gpg --gen-key
       gpg (GnuPG) 1.2.6; Copyright (C) 2004 Free Software Foundation, Inc.
       This program comes with ABSOLUTELY NO WARRANTY.
       This is free software, and you are welcome to redistribute it
       under certain conditions. See the file COPYING for details.

       Please select what kind of key you want:
          (1) DSA and ElGamal (default)
          (2) DSA (sign only)
          (4) RSA (sign only)
       Your selection? 1
       DSA keypair will have 1024 bits.
       About to generate a new ELG-E keypair.
                     minimum keysize is  768 bits
                     default keysize is 1024 bits
           highest suggested keysize is 2048 bits
       What keysize do you want? (1024)
       Requested keysize is 1024 bits
       Please specify how long the key should be valid.
                0 = key does not expire
             (n)  = key expires in n days
             (n)w = key expires in n weeks
             (n)m = key expires in n months
             (n)y = key expires in n years
       Key is valid for? (0) 6m
       Key expires at Sun 06 Aug 2006 03:51:25 PM PDT
       Is this correct (y/n)? y

       You need a User-ID to identify your key; the software constructs the user id
       from Real Name, Comment and Email Address in this form:
           "Heinrich Heine (Der Dichter) (heinrichh@duesseldorf.de)"

       Real name: amandabackup
       Email address:
       Comment: gpg keys for amandabackup
       You selected this USER-ID:
           "amandabackup (gpg keys for amandabackup)"

       Change (N)ame, (C)omment, (E)mail or (O)kay/(Q)uit? o
       You need a Passphrase to protect your secret key.

       We need to generate a lot of random bytes. It is a good idea to perform
       some other action (type on the keyboard, move the mouse, utilize the
       disks) during the prime generation; this gives the random number
       generator a better chance to gain enough entropy.

       We need to generate a lot of random bytes. It is a good idea to perform
       some other action (type on the keyboard, move the mouse, utilize the
       disks) during the prime generation; this gives the random number
       generator a better chance to gain enough entropy.

       public and secret key created and signed.
       key marked as ultimately trusted.

       pub  1024D/4417A8CB 2006-02-07 amandabackup (gpg keys for amandabackup)
            Key fingerprint = 139C 6369 44FC 7F1A 655C  E5E9 7EAA 515A 4417 A8CB
       sub  1024g/8C3A6A78 2006-02-07 [expires: 2006-08-06]

FILES
       $AMANDA_HOME/.gnupg/pubring.gpg
           The public key.  amgpgcrypt encrypt data with this public key along with the cipher algorithm.

       $AMANDA_HOME/.gnupg/secring.gpg
           The private/secret key. It's only needed during amrecover/amrestore. Store and protect it properly during other time.

       $AMANDA_HOME/.am_passphrase
           The passphrase. It's only needed during amrecover/amrestore. Store and protect it properly during other time.

BUGS
       Amanda has problem with gpg mdc(modification detection code) in the binary mode.  amgpgcrypt calls gpg with mdc disabled

SEE ALSO
       amanda(8), amanda.conf(5), amcrypt(8), amrestore(8), gpg(1)

       The Amanda Wiki: : http://wiki.zmanda.com/

AUTHOR
       Kevin Till <kevin.till@zmanda.com>
           Zmanda, Inc. (http://www.zmanda.com)



Amanda 3.3.3                                                                                      01/10/2013                                                                                    AMGPGCRYPT(8)
