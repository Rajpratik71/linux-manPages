pgpring(1)                                                                                       User Manuals                                                                                      pgpring(1)



NAME
       pgpring - Mutt key ring dumper


SYNTAX
       pgpring [ -k keyring ] [ -2 | -5 ] [ -s ] [ -S ] [ -f ]


DESCRIPTION
       pgpring  is a key ring dumper.  It extracts information from PGP's binary key ring and emits it in an (almost) readable output format understood by mutt's key selection routines.  This output format
       mimics the one used by the GNU Privacy Guard (GPG).


OPTIONS
       -k keyring
              Dump the contents of the specified keyring.

       -2     Use the default keyring for PGP 2.x.

       -5     Use the default keyring for PGP 5.

       -s     Dump the secret keyring.

       -S     Dump signatures.

       -f     Dump fingerprints.


ENVIRONMENT
       HOME   Full path of the user's home directory.

       PGPPATH
              Directory in which the user's PGP public keyring can be found.


AUTHORS
       Thomas Roessler <roessler@does-not-exist.org>




Unix                                                                                               May 2013                                                                                        pgpring(1)
