AMCRYPT-OSSL(8)                                                                         System Administration Commands                                                                        AMCRYPT-OSSL(8)



NAME
       amcrypt-ossl - crypt program for Amanda symmetric data encryption using OpenSSL

SYNOPSIS
       amcrypt-ossl [-d]

DESCRIPTION
       amcrypt-ossl uses OpenSSL to encrypt and decrypt data. OpenSSL is available from www.openssl.org. OpenSSL offers a wide variety of cipher choices ( amcrypt-ossl defaults to 256-bit AES) and can use
       hardware cryptographic accelerators on several platforms.

       amcrypt-ossl will search for the OpenSSL program in the following directories: /bin:/usr/bin:/usr/local/bin:/usr/ssl/bin:/usr/local/ssl/bin.

PASSPHRASE MANAGEMENT
       amcrypt-ossl uses the same pass phrase to encrypt and decrypt data. It is very important to store and protect the pass phrase properly. Encrypted backup data can only be recovered with the correct
       passphrase.

       OpenSSL's key derivation routines use a salt to guard against dictionary attacks on the pass phrase; still it is important to pick a pass phrase that is hard to guess. The Diceware method (see
       www.diceware.com) can be used to create passphrases that are difficult to guess and easy to remember.

FILES
       /var/lib/amanda/.am_passphrase
           File containing the pass phrase. It should not be readable by any user other than the Amanda user.

SEE ALSO
       amanda(8), amanda.conf(5), openssl(1), amcrypt-ossl-asym(8)

       The Amanda Wiki: : http://wiki.zmanda.com/

AUTHOR
       Kevin Till <kevin.till@zmanda.com>
           Zmanda, Inc. (http://www.zmanda.com)

NOTES
        1. www.openssl.org
           http://www.openssl.org/

        2. www.diceware.com
           http://www.diceware.com/



Amanda 3.3.3                                                                                      01/10/2013                                                                                  AMCRYPT-OSSL(8)
