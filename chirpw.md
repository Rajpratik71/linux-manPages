CHIRP(1)                                                      General Commands Manual                                                     CHIRP(1)

NAME
       chirpw - A tool for programming two-way radio equipment

SYNOPSIS
       chirpw [options][file]

DESCRIPTION
       This manual page documents briefly the chirpw command.

       chirpw  is a tool for programming two-way radio equipment It provides a generic user interface to the programming data and process that can
       drive many radio models under the hood.

OPTIONS
       This program follows the usual GNU command line syntax, with long options starting with  two  dashes  (`--').   A  summary  of  options  is
       included below.

       --help Show summary of options.

       -h, --help
              Show summary of options.

       --version
              Print version and exit

       --profile
              Enable Profiling.

       --quiet
              Decrease verbosity

       -v, --verbose
              Increase verbosity

       --log LOG_FILE
              Log messages to a file

       --log-level LOG_LEVEL
              Log file verbosity (critical, error, warn, info, debug). Defaults to 'debug'.

       FILE   Loads the specified configuration file. Accepted formats: .csv, .eve, .hmk, .itm, .icf, .tpe, .vx5 and .vx7.

AUTHOR
       chirpw was written by Dan Smith.

       This  manual page was written by Dan Smith (with help from Steve Conklin) and updated by Iain R. Learmonth, for the Debian project (and may
       be used by others).

                                                                  April 28, 2016                                                          CHIRP(1)
