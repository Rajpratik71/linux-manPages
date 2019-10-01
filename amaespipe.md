AMAESPIPE(8)                                                                            System Administration Commands                                                                           AMAESPIPE(8)



NAME
       amaespipe - wrapper program for aespipe

SYNOPSIS
       amaespipe

DESCRIPTION
       amaespipe requires aespipe, uuencode and gpg to work. Aespipe is available from : http://loop-aes.sourceforge.net

       amaespipe will search for the aespipe program in the following directories: /usr/bin:/usr/local/bin:/sbin:/usr/sbin.

       amaespipe is called by amcrypt for Amanda data encryption.

       amaespipe is based on aespipe's bzaespipe program. It calls aespipe to encrypt data using AES256 as the encryption and SHA256 as the hash function. GPG key should be stored in
       $AMANDA_HOME/.gnupg/am_key.gpg.  amaespipe reads passphrase from file descriptor 3. During decryption, amaespipe autodects encryption type and hash function from the encrypted image.

SEE ALSO
       amanda(8), amanda.conf(5), aespipe(1), amcrypt(8), gpg(1)

       The Amanda Wiki: : http://wiki.zmanda.com/

AUTHOR
       Kevin Till <kevin.till@zmanda.com>
           Zmanda, Inc. (http://www.zmanda.com)



Amanda 3.3.3                                                                                      01/10/2013                                                                                     AMAESPIPE(8)
