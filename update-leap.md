update-leap(1update-leapman)                                       User Commands                                      update-leap(1update-leapman)

NAME
       update-leap - leap-seconds file manager/updater

SYNOPSIS
       update-leap [-flags] [-flag [value]] [--option-name[[=| ]value]]

       All arguments must be options.

DESCRIPTION
       update-leap will validate the file currently on the local system and if necessary, updates leap-second definition file.

       Ordinarily,  the  file is found using the "leapfile" directive in ntp.conf(5).  However, an alternate location can be specified on the com‐
       mand line.

       If the file does not exist, is not valid, has expired, or is expiring soon, a new copy will be downloaded.  If the new copy  validates,  it
       is installed and NTP is (optionally) restarted.

       If the current file is acceptable, no download or restart occurs.

       -c can also be used to invoke another script to perform administrative functions, e.g. to copy the file to other local systems.

       This  can  be  run  as  a  cron  job.  As the file is rarely updated, and leap seconds are announced at least one month in advance (usually
       longer), it need not be run more frequently than about once every three weeks.

       For cron-friendly behavior, define CRONJOB=1 in the crontab.

       This script depends on$REQUIREDCMDS

OPTIONS
       -s string, --source-url=string
              The URL of the master copy of the leapseconds file.

              Specify the URL of the master copy to download $LEAPSRC

       -4, --ipv4
              Use only IPv4 addresses for DNS name resolution.  This option must not appear in combination with  any  of  the  following  options:
              ipv6.

                      Force DNS resolution of following host names on the command line
                      to the IPv4 namespace.
                      _EndOfDoc_; };

              flag = {
                  name      = ipv6;
                  flags-cant = ipv4, prefer;
                  value     = 6;
                  descrip   = "Use only IPv6 addresses for DNS name resolution";
                  doc = <<-  _EndOfDoc_
                      Force DNS resolution of following host names on the command line
                      to the IPv6 namespace.
                      _EndOfDoc_; };

              flag = {
                  name        = prefer;
                  flags-cant = ipv4, ipv6;
                  value = p;
                  arg-type    = keyword;
                  keyword    = 4, 6;
                  descrip     = 'Prefer IPv4 or IPv6 (as specified) addresses, but use either';
                  doc         = <<-  _EndOfDoc_ Prefer IPv4 or IPv6 (as specified) addresses, but use either.

       -d float, --destination=float
              Filename on the local system.

              The name to use to store the leapfile on the local system.  $LEAPFILE

       -e string, --expiration=string
              Refresh the leapfile this long before it expires.

              Specify  how long before expiration the file is to be refreshed Units are required, e.g. "-e 60 days"  Note that larger values imply
              more frequent refreshes.  "$PREFETCH"

       -f string, --ntp-conf-file=string
              Location of the ntp.conf file.

              Specify location of ntp.conf (used to make sure leapfile directive is present and to default  leapfile) /etc/ntp.conf

       -F, --force-update
              Force update of the leapfile.

              Force update even if current file is OK and not close to expiring.

       --dont-wait
              Don't wait for keystroke between plots.

       -?, --help
              Display usage information and exit.

       -!, --more-help
              Pass the extended usage information through a pager.

       -v [{v|c|n --version [{v|c|n}]}]
              Output version of program and exit.  The default mode is `v', a simple version.  The `c' mode will print copyright  information  and
              `n' will print the full copyright notice.

USAGE
       Usage stuff

EXIT STATUS
       One of the following exit values will be returned:

       0  (EXIT_SUCCESS)
              Successful program execution.

       1  (EXIT_FAILURE)
              The operation failed or the command syntax was not valid.

       70  (EX_SOFTWARE)
              libopts had an internal operational error.  Please report it to autogen-users@lists.sourceforge.net.  Thank you.

AUTHORS
       Timothe Litt

NOTES
       This manual page was AutoGen-erated from the update-leap option definitions.

ntp (4.2.8p9)                                                       21 Nov 2016                                       update-leap(1update-leapman)
