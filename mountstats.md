mountstats(8)                                                                              System Manager's Manual                                                                              mountstats(8)



NAME
       mountstats - Displays various NFS client per-mount statistics

SYNOPSIS
       mountstats [-h|--help] [-v|--version] [-f|--file infile] [-S|--since sincefile] [ [-n|--nfs] | [-r|--rpc] | [-R|--raw] | [-x|--xprt] ] [mountpoint]...

       mountstats iostat [-h|--help] [-v|--version] [-f|--file infile] [-S|--since sincefile] [interval] [count] [mountpoint]...

       mounstats nfsstat [-h|--help] [-v|--version] [-f|--file infile] [-S|--since sincefile] [-3] [-4] [mountpoint]...

DESCRIPTION
       The mountstats command displays various NFS client statisitics for each given mountpoint.

       If no mountpoint is given, statistics will be displayed for all NFS mountpoints on the client.

   Sub-commands
       Valid mountstats(8) subcommands are:

       mountstats
              Display a combination of per-op RPC statistics, NFS event counts, and NFS byte counts.  This is the default sub-command that will be executed if no sub-command is given.

       iostat Display iostat-like statistics.

       nfsstat
              Display nfsstat-like statistics.

OPTIONS
   Options valid for all sub-commands
       -h, --help
              show the help message and exit

       -v, --version
              show program's version number and exit

       -f infile, --file infile
              Read  stats  from  infile  instead  of  /proc/self/mountstats.   infile must be in the same format as /proc/self/mountstats.  This may be used with the -S|--since options to display the delta
              between two different points in time.  This may not be used with the interval or count options of the iostat sub-command.

       -S sincefile, --since sincefile
              Show difference between current stats and those in sincefile.  sincefile must be in the same format as /proc/self/mountstats.  This may be used with the -f|--file options to display the delta
              between two different points in time.  This may not be used with the interval or count options of the iostat sub-command.

   Options specific to the mountstats sub-command
       -n, --nfs Display only the NFS statistics

       -r, --rpc
              Display only the RPC statistics

       -R, --raw
              Display only the raw statistics.  This is intended for use with the -f|--file and -S|--since options.

       -x, --xprt
              Display only the transport statistics

   Options specific to the iostat sub-command
       interval
              Specifies the amount of time in seconds between each report.  The first report contains statistics for the time since each file system was mounted.  Each subsequent report contains statistics
              collected during the interval since the previous report.  This may not be used with the -f|--file or -S|--since options.

       count  Determines the number of reports generated at interval seconds apart.  If the interval parameter is specified without the count parameter, the command generates  reports  continuously.   This
              may not be used with the -f|--file or -S|--since options.

   Options specific to the nfsstat sub-command
       -3     Show only NFS version 3 statistics.  The default is to show both version 3 and version 4 statistics.

       -4     Show only NFS version 4 statistics.  The default is to show both version 3 and version 4 statistics.

FILES
       /proc/self/mountstats

SEE ALSO
       iostat(8), nfsiostat(8), nfsstat(8)

AUTHOR
       Chuck Lever <chuck.lever@oracle.com>



                                                                                                 12 Dec 2014                                                                                    mountstats(8)
