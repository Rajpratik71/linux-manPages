grl-launch(1)                                                                              General Commands Manual                                                                              grl-launch(1)



NAME
       grl-launch - run Grilo operations from the command line

SYNOPSIS
       grl-launch [OPTIONS] OPERATION PARAMETERS

DESCRIPTION
       This manual page documents briefly the grl-launch command.

       grl-launch is a tool that allows the user to run Grilo operations from the command line.

OPERATIONS
       browse <source>|<media box>

       may_resolve <key> <source>|<media box> [<source>]

       query <expression> <source>

       resolve <source>|<media> [<source>]

       search <term> <source>

       monitor <source>

       test_media_from_uri <uri> [<source>]

       media_from_uri <uri> <source>

OPTIONS
       -h, --help
              Show summary of grl-launch options.

       --help-grl
              Show summary of Grilo options.

       --help-all
              Show summary of all options.

       -C, --config
              Configuration file to send to sources

       -c, --count
              Number of elements to return

       -d, --delay
              Wait some seconds before performing the operation (default 1 second)

       -f, --flags=full|fast_only|idle_relay
              List of comma-separated flags to use

       -F, --full
              Full serialize

       -k, --keys
              List of comma-separated keys to retrieve

       -S, --serialize
              Serialize

       -s, --skip
              Number of elements to skip

       -T, --titles
              Print column titles (useful for CSV spreadsheets)

       -V, --version
              Print version

EXAMPLES
       Print the ID for all the items searched in the Tracker source:

              grl-launch-0.3 search "" -S grl-tracker-source

       Print the ID and title for the items in the Apple Trailers source:

              grl-launch-0.3 -k id,title browse grl-appletrailers-lua

       Print the title for the videos indexed by Tracker:

              grl-launch-0.3 -S browse -k title grlcontainer://grl-tracker-source/videos

AUTHOR
       This manual page was written by Alberto Garcia <berto@igalia.com>.



                                                                                               August 25, 2014                                                                                  grl-launch(1)
