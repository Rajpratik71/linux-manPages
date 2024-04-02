AMCRYPT(8)                                                                              System Administration Commands                                                                             AMCRYPT(8)



NAME
       amcrypt - reference crypt program for Amanda symmetric data encryption

SYNOPSIS
       amcrypt

DESCRIPTION
       amcrypt requires aespipe, uuencode and gpg to work. Aespipe is available from : http://loop-aes.sourceforge.net

       amcrypt will search for the aespipe program in the following directories: /usr/bin:/usr/local/bin:/sbin:/usr/sbin.

       amcrypt calls amaespipe and pass the passphrase through file descriptor 3. The passphrase should be stored in ~amanda/.am_passphrase.

HOW TO CREATE ENCRYPTION KEYS FOR AMCRYPT
       1. Create 65 random encryption keys and encrypt those keys using gpg. Reading from /dev/random may take indefinitely long if kernel's random entropy pool is empty. If that happens, do some other
       work on some other console (use keyboard, mouse and disks).

       head -c 2925 /dev/random | uuencode -m - | head -n 66 | tail -n 65 \ | gpg --symmetric -a > ~amanda/.gnupg/am_key.gpg

       This will ask for a passphrase. Remember this passphrase as you will need it in the next step.

       2. Store the passphrase inside the home-directory of the AMANDA-user and protect it with proper permissions:
       echo my_secret_passphrase > ~amanda/.am_passphrase
       chown amanda:disk ~amanda/.am_passphrase
       chmod 700 ~amanda/.am_passphrase

KEY AND PASSPHRASE
       amcrypt uses the same key to encrypt and decrypt data.

       It is very important to store and protect the key and the passphrase properly. Encrypted backup data can only be recovered with the correct key and passphrase.

SEE ALSO
       amanda(8), amanda.conf(5), aespipe(1), amaespipe(8), gpg(1)

       The Amanda Wiki: : http://wiki.zmanda.com/

AUTHOR
       Kevin Till <kevin.till@zmanda.com>
           Zmanda, Inc. (http://www.zmanda.com)



Amanda 3.3.3                                                                                      01/10/2013                                                                                       AMCRYPT(8)
