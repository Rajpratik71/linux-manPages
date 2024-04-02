SPLIT-LOGFILE(8)                                                   split-logfile                                                  SPLIT-LOGFILE(8)

NAME
       split-logfile - Split combined virtual hosts access log into one file per virtual host

SYNOPSIS
       split-logfile < logfile

SUMMARY
       This script will take a combined Web server access log file and break its contents into separate files.  It assumes that the first field of
       each line is the virtual host identity (put there by "%v"), and that the logfiles should be named that+".log" in the current directory.

       The combined log file is read from stdin.  Records read will be appended to any existing log files.

EXAMPLES
       split-logfile < /var/log/apache2/other_vhosts_access.log

Apache HTTP Server                                                  2009-12-06                                                    SPLIT-LOGFILE(8)
