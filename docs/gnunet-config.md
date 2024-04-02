GNUNET-CONFIG(1)                       General Commands Manual                       GNUNET-CONFIG(1)

NAME
       gnunet-config - manipulate GNUnet configuration files

SYNOPSIS
       gnunet-config [options]

DESCRIPTION
       gnunet-config can be used to read or modify GNUnet configuration files.

OPTIONS
       -f, --filename
              When  accessing  a  specific option using -s and -o, perform expansions as if the value
              represents a filename.

       -s SECTION, --section=SECTION
              Which configuration section should be accessed or edited. Required option.

       -o OPTION, --option=OPTION
              Which configuration option should be accessed or edited.  Required to set a value.   If
              not  given,  all  values  of  a  given  section will be printed in the format "OPTION =
              VALUE".

       -V VALUE, --value VALUE
              Configuration value to store in the given section under the given option.  Must only be
              given together with -s and -o options.

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

GNUnet                                       Jul 15, 2012                            GNUNET-CONFIG(1)
