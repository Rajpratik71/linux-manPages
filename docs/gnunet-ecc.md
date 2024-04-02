GNUNET-ECC(1)                          General Commands Manual                          GNUNET-ECC(1)

NAME
       gnunet-ecc - manipulate GNUnet ECC key files

SYNOPSIS
       gnunet-ecc [options]FILENAME

DESCRIPTION
       gnunet-ecc can be used to create an ECC private key and to print the corresponding public key.
       You must specify a filename containing an ECC private key in GNUnet format as an argument.  If
       the  file  does  not exist, gnunet-ecc will create a key.  This may then take a while.  If the
       option -p is given, the corresponding public key will be printed to the console.

OPTIONS
       -g COUNT, --generate-keys=COUNT
              Create COUNT public-private key pairs and write them to FILENAME.  Used for creating  a
              file for testing.

       -p, --print-public-key
              Print  the corresponding public key to stdout.  This is the value used for PKEY records
              in GNS.

       -P, --print-peer-identity
              Print the corresponding peer identity (hash of the public key) to stdout.  This hash is
              used for the name of peers.

       -c FILENAME,  --config=FILENAME
              Use the configuration file FILENAME.

       -h, --help
              Print short help on options.

       -L LOGLEVEL, --loglevel=LOGLEVEL
              Use LOGLEVEL for logging.  Valid values are DEBUG, INFO, WARNING and ERROR.

       -v, --version
              Print GNUnet version number.

BUGS
       Report  bugs  by  using  Mantis  <https://gnunet.org/bugs/>  or  by sending electronic mail to
       <gnunet-developers@gnu.org>

GNUnet                                       Mar 15, 2012                               GNUNET-ECC(1)
