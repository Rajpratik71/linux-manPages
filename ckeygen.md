CKEYGEN(1)                                                                                                                                                                                     CKEYGEN(1)

NAME
       ckeygen - manipulate public/private keys

SYNOPSIS
       ckeygen [-b bits] [-f filename] [-t type] [-C comment] [-N new passphrase] [-P old passphrase] [-l] [-p] [-q] [-y]

DESCRIPTION
       The --help prints out a usage message to standard output.

       -b, --bits <bits>
              Number of bits in the key to create (default: 1024)

       -f, --filename <file name>
              Filename of the key file.

       -t, --type <type>
              Type of key (rsa or dsa).

       -C, --comment <comment>
              Provide a new comment.

       -N, --newpass <pass phrase>
              Provide new passphrase.

       -P, --pass <pass phrase>
              Provide old passphrase.

       -l, --fingerprint
              Show fingerprint of key file.

       -p, --changepass
              Change passphrase of private key file.

       -q, --quiet
              Be quiet.

       --no-passphrase
              Create the key with no passphrase.

       -y, --showpub
              Read private key file and print public key.

       --version
              Display version number only.

DESCRIPTION
       Manipulate public/private keys in various ways.  If no filename is given, a file name will be requested interactively.

AUTHOR
       Written by Moshe Zadka, based on ckeygen's help messages

REPORTING BUGS
       To report a bug, visit http://twistedmatrix.com/bugs/

COPYRIGHT
       Copyright © 2002-2011 Twisted Matrix Laboratories.
       This is free software; see the source for copying conditions.  There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

SEE ALSO
       ssh(1), conch(1)

                                                                                               October 2002                                                                                    CKEYGEN(1)
