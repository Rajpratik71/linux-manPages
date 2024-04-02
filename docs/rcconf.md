RCCONF(8)                                                        Debian GNU/Linux                                                        RCCONF(8)

NAME
       rcconf - Debian Runlevel configuration tool

SYNOPSIS
       rcconf [options]

DESCRIPTION
       Rcconf allows you to control which services are started when the system boots up or reboots.  It displays a menu of all the services which
       could be started at boot.  The ones that are configured to do so are marked and you can toggle individual services on and off.

       Rcconf gets a list of services from /etc/init.d and looks in the /etc/rc?.d directories to determine whether each service is on or off.
       Rcconf detects ON state by existence of /etc/rc?.d/"S"NNname.

       If the number(NN of /etc/rc?.d/[SK]NNname) is not 20(default), rcconf saves the service name and the number in /var/lib/rcconf/services so
       as to be able to restore the service to its original configuration.

       If you purge rcconf package by 'dpkg --purge' or 'aptitude purge' or others, you may lose off state package due to deletion of
       /var/lib/rcconf/services.

OPTIONS
       --help
            Print out a usage message.

       --dialog
            Use dialog command to display menu

       --whiptail
            Use whiptail command to display menu

       --notermcheck
            Do not set window size by terminal property.

       --on service[,service,...]
            Set services to be on.  This option enables rcconf in command line mode and no select menu will be displayed.

       --off service[,service,...]
            Set services to be off.  This option enables rcconf in command line mode and no select menu will be displayed.

       --list
            List services which includes current status(on/off).  This option enables rcconf in command line mode and no select menu will be
            displayed. Use --expert option together if you want to list all services.  This result can be used as config_file of --config.

       --config config_file
            Set services on/off according to config_file.  This option enables rcconf in command line mode and no select menu will be displayed.
            The format of this config file is "service_name on" or "service_name off" in each line. Refer to the result of --list.

       --expert
            Show and select all services for experts. In default, rcconf doesn't display system default services as a candidate such as
            mountall.sh to hide unnecessary services for users(but very important for system).

            The list of which services are considered expert can be found at the line @expertonly in /usr/sbin/rcconf.

       --now
            For each service that had the links changed, call the corresponding /etc/init.d/service-name script using invoke-rc.d, so the package
            starts or stops immediately. If you do not use this option, the changes will only take effect the next time you reboot (or change
            runlevel).

       --verbose
            Output verbose messages.

Guide File
       Rcconf can display some description(Guide) for each services with Guide File.  Guide File is placed on /var/lib/rcconf/guide, and this
       Guide File does not exist by default.  If you want to use Guide, you need to define guides for each services in this file.

       If you run update-rcconf-guide before rcconf, rcconf can use default guides derived from package description.  Update-rcconf-guide
       generates the file '/var/lib/rcconf/guide.default' from package description(only uses first line of it) using apt-cache.  Rcconf refers
       Guides in /var/lib/rcconf/guide before /var/lib/rcconf/guide.default.

       If you install some packages after executed update-rcconf-guide, you need to re-create this file using update-rcconf-guide so as to refresh
       guide.default that includes new guides for installed new services.

Updating /etc/rd?.c/ by the package(KNOWN PROBLEM)
       Rcconf saves /etc/rc?.d/[SK]NNname conditions into /var/lib/rcconf/services.  This file is updated only when there exists
       /etc/rc?.d/SNNname. It means that the condition is not saved if /etc/rc?.d/SNNname doesn't exist for the package.

       If the old version of the package creates both /etc/rc?.d/SNNname and /etc/rc?.d/KNNname but the newer(updated) version of the package
       creates only /etc/rc?.d/KNNname, some stupid condition occurs. That is, rcconf displays this package as OFF state even as the updated
       package doesn't have /etc/rc?.d/SNNname. That is because rcconf can't detect disappearance of /etc/rc?.d/SNNname and previous
       /etc/rc?.d/SNNname condition remains in /var/lib/rcconf/services for restore.

       In that situation, remove the entry(corresponding package line) from /var/lib/rcconf/services.

FILE
       /var/lib/rcconf/services
               The service number data file.

       /var/lib/rcconf/lock
               Lock file.

       /var/lib/rcconf/guide.default
               Guide File update-rcconf-guide generates.

       /var/lib/rcconf/guide
               Guide File user(Administrator) can define.

SEE ALSO
       update-rc.d(8)

       update-rcconf-guide(8)

AUTHOR
       Atsushi KAMOSHIDA <kamop@debian.org>

perl v5.18.1                                                        2013-11-11                                                           RCCONF(8)
