
CGSNAPSHOT(1)                                                                                  libcgroup Manual                                                                                 CGSNAPSHOT(1)



NAME
       cgsnapshot - generate the configuration file for given controllers


SYNOPSIS
       cgsnapshot [-h] [-s] [-t] [-b file] [-w file] [-f output_file] [controller] [...]


DESCRIPTION
       cgsnapshot  generates the cgconfig compatible configuration file for the given controllers.  If no controller is set, then cgsnapshot shows all mounted hierarchies.  The output is in the same format
       as the cgconfig.conf configuration file.


       -b file
              Display only variables from the blacklist.  The default location of the blacklist is /etc/cgsnapshot_blacklist.conf.  This list contains all variables which should be ignored by  the  cgsnap‐
              shot If the variable is blacklisted, it will not be displayed.  If it is not present on the blacklist, the whitelist is checked.


       -h, --help
              display this help and exit


       -f, --file
              Redirect the output to output_file



       -s, --silent
              Ignore all warnings


       -t, --strict
              Do not display the variables which are not on the whitelist



       -w file
              Set  the blacklist configuration file.  This list contains all variables which should be displayed by cgsnapshot If the variable is not blacklisted, the whitelist is checked.  If the variable
              is on the whitelist, it is displayed by cgsnapshot If the variable is not on the whitelist, the variable is displayed and a warning message is produced.  By default the whitelist is not used.

              The warning message can be omitted using the -s, --silent flag.  If the -t, --strict flag is used, the variable which is not on the whitelist is not displayed.


       controller
              defines the controller whose hierarchies will be output


ENVIRONMENT VARIABLES
       CGROUP_LOGLEVEL
              controls verbosity of the tool. Allowed values are DEBUG, INFO, WARNING or ERROR.


FILES
       /etc/cgsnapshot_blacklist.conf
              default blacklist


       /etc/cgsnapshot_whitelist.conf
              default whitelist


       /etc/cgconfig.conf
              default libcgroup configuration file


EXAMPLES
       cgsnapshot -s -f /etc/cgconfig.conf.cgsnapshot
              create configuration file which contains all mounted controllers and all control groups which are on the actual system


       cgsnapshot -s -f /etc/cgconfig.conf.cgsnapshot cpu
              create configuration file which contains hierarchy containing cpu controller and all its control groups on the actual system




SEE ALSO
       cgconfig.conf (5)



Linux                                                                                             2010-07-28                                                                                    CGSNAPSHOT(1)
