NSCD(8)                                                     BSD System Manager's Manual                                                    NSCD(8)

NAME
     nscd — name service caching daemon

SYNOPSIS
     nscd [OPTION...]

DESCRIPTION
     Nscd caches libc-issued requests to the Name Service. If retrieving NSS data is fairly expensive, nscd is able to speed up consecutive access
     to the same data dramatically and increase overall system performance.  Nscd should be run at boot time by /etc/init.d/nscd.

OPTIONS
     -d, --debug
             Do not fork and display messages on the current tty.

     -f, --config-file NAME
             Read configuration data from NAME.  For a description of the config file format, see nscd.conf(5).

     -g, --statistic
             Print current configuration statistics.

     -i, --invalidate TABLE
             Invalidate the specified TABLE, i. e. forget all data cached therein. This should be used if the database storing this information
             has been changed.

     -K, --shutdown
             Quit a running nscd process.

     -S, --secure TABLE
             Use a separate cache for each user.

     -t, --nthreads NUMBER
             Start NUMBER threads. This denotes the maximum number of requests that can be handled simultaneously. The default is set in the con‐
             figuration file. (See nscd.conf(5).)

     -?, --help
             Print the list of available options.

     --usage
             Print a short usage message.

     -V, --version
             Print program version.

FILES
     /etc/nscd.conf
             Nscd configuration file. See nscd.conf(5) for more information.

     /etc/nsswitch.conf
             Name Service Switch configuration. See nsswitch.conf(5) for more information.

SEE ALSO
     GNU C Library info file, nscd.conf(5), nsswitch.conf(5)

GNU C Library 2.2                                                January 07, 2001                                                GNU C Library 2.2
