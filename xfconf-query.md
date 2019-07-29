XFCONF-QUERY(1)                                                    User Commands                                                   XFCONF-QUERY(1)

NAME
       xfconf-query - Command line utility for xfconf system

DESCRIPTION
   Usage:
              xfconf-query [OPTION...] - xfconf commandline utility

   Help Options:
       -h, --help
              Show help options

   Application Options:
       -V, --version
              Version information

       -c, --channel
              The channel to query/modify

       -p, --property
              The property to query/modify

       -s, --set
              The new value to set for the property

       -l, --list
              List properties (or channels if -c is not specified)

       -v, --verbose
              Verbose output

       -n, --create
              Create a new property if it does not already exist

       -t, --type
              Specify the property value type

       -r, --reset
              Reset property

       -R, --recursive
              Recursive (use with -r)

       -a, --force-array
              Force array even if only one element

       -m, --monitor
              Monitor a channel for property changes

xfconf-query 4.6.1                                                 November 2009                                                   XFCONF-QUERY(1)
