AMCRYPTSIMPLE(8)                                                                        System Administration Commands                                                                       AMCRYPTSIMPLE(8)



NAME
       amcryptsimple - reference simple crypt program for Amanda symmetric data encryption

SYNOPSIS
       amcryptsimple  to be called by Amanda only

DESCRIPTION
       amcryptsimple calls gpg to perform symmetric data encryption on Amanda backup.  amcryptsimple will search for the gpg program in the following directories:
       /usr/local/bin:/usr/bin:/usr/sbin:/bin:/sbin

       amcryptsimple uses one passphrase to encrypt the Amanda data and uses the same passphrase to decrypt the Amanda backup data.  amcryptsimple uses AES256 as the symmetric cipher.

HOW TO CREATE PASSPHRASE
       Store the passphrase inside the home-directory of the Amanda user ($amanda_user) and protect it with proper permissions:

       echo my_secret_passphrase > ~$amanda_user/.am_passphrase
       chown $amanda_user:disk ~$amanda_user/.am_passphrase
       chmod 700 ~$amanda_user/.am_passphrase

NOTES
       Choose a good passphrase and protect it properly. Backup data can only be restored with the passphrase. There is no backdoor.

       If storing and securing passphrase in your environment presents challenges, Amanda provide public-key data encryption through amgpgcrypt. Public-key encryption uses the public key to encrypt and
       uses the private key to decrypt.

SEE ALSO
       amanda(8), amanda.conf(5), amcrypt(8), amgpgcrypt(8), amrestore(8), gpg(1)

       The Amanda Wiki: : http://wiki.zmanda.com/

AUTHOR
       Kevin Till <kevin.till@zmanda.com>
           Zmanda, Inc. (http://www.zmanda.com)



Amanda 3.3.3                                                                                      01/10/2013                                                                                 AMCRYPTSIMPLE(8)
