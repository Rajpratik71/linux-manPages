CHECKSECURITY(8)                                              System Manager's Manual                                             CHECKSECURITY(8)

NAME
       checksecurity - Run a collection of simple system checks

SYNOPSIS
       checksecurity

DESCRIPTION
       The checksecurity command runs a small collection of simple system checks which are designed to catch a few common security issues.  check‐
       security is run by cron in a daily basis.

CONFIGURATION
       The checksecurity.conf file defines several configuration variables: MAILTO, CHECK_DISKFREE, CHECK_PASSWD and CHECK_SETUID LOGDIR.  Each is
       described below.

       The  checksecurity program works with a collection of plugins which are located in /usr/share/checksecurity and are configured individually
       by their own configuration file.

       CHECK_PASSWD If this is set to TRUE then the check-passwd script will be invoked.  This script is designed to report upon  system  accounts
       which  have  no passwords.  CHECK_DISKFREE If this is set to TRUE then the check-diskfree script will be invoked and will allow an alert to
       be sent if there is any mounted partition is running short on disk space.  CHECK_SETUID If this is set to TRUE then the check-setuid script
       will be invoked, this will compare the setuid binaries upon the system to those that existed previously and show the differences.

FILES
       /etc/checksecurity.conf
              checksecurity configuration file

SEE-ALSO
       See also check-diskfree(8), check-setuid(8), check-passwd(8) and check-iptables-logs(8)

Debian Linux                                                      2 February 1997                                                 CHECKSECURITY(8)
