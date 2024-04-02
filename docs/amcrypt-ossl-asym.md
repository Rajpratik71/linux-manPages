AMCRYPT-OSSL-ASYM(8)                                                                    System Administration Commands                                                                   AMCRYPT-OSSL-ASYM(8)



NAME
       amcrypt-ossl-asym - crypt program for Amanda asymmetric data encryption using OpenSSL

SYNOPSIS
       amcrypt-ossl-asym [-d]

DESCRIPTION
       amcrypt-ossl-asym uses OpenSSL to encrypt and decrypt data. OpenSSL is available from www.openssl.org. OpenSSL offers a wide variety of cipher choices ( amcrypt-ossl-asym defaults to 256-bit AES)
       and can use hardware cryptographic accelerators on several platforms.

       amcrypt-ossl-asym will search for the OpenSSL program in the following directories: /bin:/usr/bin:/usr/local/bin:/usr/ssl/bin:/usr/local/ssl/bin.

GENERATING PUBLIC AND PRIVATE KEYS
       RSA keys can be generated with the standard OpenSSL commands, e.g.:
       $ cd /var/lib/amanda
       $ openssl genrsa -aes128 -out backup-privkey.pem 1024
       Generating RSA private key, 1024 bit long modulus
       [...]
       Enter pass phrase for backup-privkey.pem: ENTER YOUR PASS PHRASE
       Verifying - Enter pass phrase for backup-key.pem: ENTER YOUR PASS PHRASE

       $ openssl rsa -in backup-privkey.pem -pubout -out backup-pubkey.pem
       Enter pass phrase for backup-privkey.pem: ENTER YOUR PASS PHRASE
       Writing RSA key

       To generate a private key without a passphrase, omit the -aes128 option. See openssl_genrsa(1) for more key generation options.

       Note that it is always possible to generate the public key from the private key.

KEY AND PASSPHRASE MANAGEMENT
       amcrypt-ossl-asym uses the public key to encrypt data. The security of the data does not depend on the confidentiality of the public key. The private key is used to decrypt data, and must be
       protected. Encrypted backup data cannot be recovered without the private key. The private key may optionally be encrypted with a passphrase.

       While the public key must be online at all times to perorm backups, the private key and optional passphrase are only needed to restore data. It is recommended that the latter be stored offline all
       other times. For example, you could keep the private key on removable media, and copy it into place for a restore; or you could keep the private key online, encrypted with a passphrase that is
       present only for a restore.

       OpenSSL's key derivation routines use a salt to guard against dictionary attacks on the pass phrase; still it is important to pick a pass phrase that is hard to guess. The Diceware method (see
       www.diceware.com) can be used to create passphrases that are difficult to guess and easy to remember.

FILES
       /var/lib/amanda/backup-privkey.pem
           File containing the RSA private key. It should not be readable by any user other than the Amanda user.

       /var/lib/amanda/backup-pubkey.pem
           File containing the RSA public key.

       /var/lib/amanda/.am_passphrase
           File containing the passphrase. It should not be readable by any user other than the Amanda user.

SEE ALSO
       amanda(8), amanda.conf(5), openssl(1), amcrypt-ossl(8)

       The Amanda Wiki: : http://wiki.zmanda.com/

AUTHOR
       Kevin Till <kevin.till@zmanda.com>
           Zmanda, Inc. (http://www.zmanda.com)

NOTES
        1. www.openssl.org
           http://www.openssl.org/

        2. www.diceware.com
           http://www.diceware.com/



Amanda 3.3.3                                                                                      01/10/2013                                                                             AMCRYPT-OSSL-ASYM(8)
