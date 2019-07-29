bedup(8)                                                               bedup                                                              bedup(8)

NAME
       bedup - program for deduplication program with additional knowledge of burp

SYNOPSIS
       bedup [options]

       A  file  deduplication  program  with additional knowledge of burp storage directories. This program comes with the burp backup and restore
       package.

OPTIONS
       -c path
              Path to config file (default: /etc/burp/burp.conf).

       -g <list of group names>
              Only run on the directories of clients that are in one of the groups specified. The list is comma-separated. To put a  client  in  a
              group, use the 'dedup_group' option in the client configuration file on the server.

       -h|-?  Print help text and exit.

       -d     Delete any duplicate files found. (non-burp mode only, use with caution!)

       -l     Hard link any duplicate files found.

       -m  <number>
              Maximum number of hard links to a single file. (non-burp mode only - in burp mode, use the max_hardlinks option in the configuration
              file) The default is 10000. On ext3, the maximum number of links possible is 32000, but space is needed for the normal operation  of
              burp.

       -n <list of directories>
              Non-burp mode. Deduplicate any (set of) directories.

       -v     Print  duplicate paths. Useful if you want to double check the files that would be hard linked or deleted before running with one of
              those options turned on.

       -V     Print version and exit.

       By default, bedup will read /etc/burp/burp.conf and deduplicate client storage directories using special knowledge of the structure.

       With '-n', this knowledge is turned off and you have to specify the directories to deduplicate on the command line. Running  with  '-n'  is
       therefore dangerous if you are deduplicating burp storage directories.

BUGS
       If you find bugs, please report them to the email list. See the website <http://burp.grke.net/> for details.

AUTHOR
       The main author of Burp is Graham Keeling.

COPYRIGHT
       See the LICENCE file included with the source distribution.

                                                                 February 10, 2012                                                        bedup(8)
