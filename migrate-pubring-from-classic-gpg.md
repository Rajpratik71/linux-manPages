MIGRATE-PUBRING-FROM-CLASSIGeneral)CommandMIGRATE-PUBRING-FROM-CLASSIC-GPG(1)

NAME
       migrate-pubring-from-classic-gpg  -  Migrate  a  public  keyring  from
       "classic" to "modern" GnuPG

SYNOPSIS
       migrate-pubring-from-classic-gpg [ GPGHOMEDIR | --default ]

DESCRIPTION
       migrate-pubring-from-classic-gpg migrates the public keyring in  GnuPG
       home  directory  GPGHOMEDIR  from  the "classic" keyring format to the
       "modern" keybox format using GnuPG versions 2.1 or 2.2.

       Specifying --default selects the standard GnuPG home directory  (look‐
       ing at $GNUPGHOME first, and falling back to ~/.gnupg if unset.

OPTIONS
       -h, --help, --usage Output a short usage information.

DIAGNOSTICS
       The program sends quite a bit of text (perhaps too much) to stderr.

       During  a  migration,  the  tool  backs up several pieces of data in a
       timestamped subdirectory of the GPGHOMEDIR.

ENVIRONMENT VARIABLES
       GNUPGHOME Selects the GnuPG home directory when set and  --default  is
       given.

       GPG The name of the gpg executable (defaults to gpg ).

SEE ALSO
       gpg(1)

AUTHOR
       Copyright  (C) 2016 Daniel Kahn Gillmor for the Debian project. Please
       report bugs via the Debian BTS.

                                  April 20MIGRATE-PUBRING-FROM-CLASSIC-GPG(1)
