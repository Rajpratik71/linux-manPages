GNUNET-SCRYPT(1)                       General Commands Manual                       GNUNET-SCRYPT(1)

NAME
       gnunet-scrypt - Manipulate GNUnet proof of work files.

SYNOPSIS
       gnunet-scrypt [options]

DESCRIPTION
       gnunet-scrypt is a command line tool to manipulate GNUnet proof of work files.

OPTIONS
       -b BITS,  --bits=BITS
              Number of bits to require for the proof of work.

       -c FILENAME,  --config=FILENAME
              Use the configuration file FILENAME.

       -h, --help
              Print short help on options.

       -k FILE, --keyfile=FILE
              File with private key, otherwise default is used.

       -L LOGLEVEL, --loglevel=LOGLEVEL
              Use LOGLEVEL for logging.  Valid values are DEBUG, INFO, WARNING and ERROR.

       -l LOGFILE, --logfile=LOGFILE
              Configure logging to write logs to LOGFILE.

       -o FILE, --outfile=FILE
              File with proof of work, otherwise default is used.

       -t TIME, --timeout=TIME
              Time to wait between calculations.

       -v, --version
              Print GNUnet version number.

BUGS
       Report  bugs  by  using  Mantis  <https://gnunet.org/bugs/>  or  by sending electronic mail to
       <gnunet-developers@gnu.org>

GNUnet                                       Sep 13, 2014                            GNUNET-SCRYPT(1)
