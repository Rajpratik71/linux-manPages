ipmilan(8)                                                                          IPMI LAN to System Interface Converter                                                                         ipmilan(8)



NAME
       ipmilan - IPMI LAN to System Interface Converter


SYNOPSIS
       ipmilan [-c configfile] [-i ipmidevice] [-d] [-n]


DESCRIPTION
       The ipmilan daemon allows an IPMI system interface using the OpenIPMI device driver to be accessed using the IPMI 1.5 or 2.0 LAN protocol.

       ipmilan supports the full authentication capabilities of the IPMI LAN protocol.

       ipmilan supports multiple IP addresses for fault-tolerance.  Note that messages coming in on an address are always sent back out on the same address they came in.


OPTIONS
       -c config-file
              Set the configuration file to one other than the default of /etc/ipmi_lan.conf

       -n     Stops  the  daemon  from  forking  and  detaching  from the controlling terminal. This is useful for running from init.

       -d     Turns on debugging to standard output.  You generally have to use -n with this.



CONFIGURATION
       Configuration is accomplished through the file /etc/ipmi_lan.conf.  A file with another name or path may be specified using the -c option.  See the ipmi_lan config file man page for more details.


SECURITY
       ipmilan  implements  normal IPMI security.  The default is no access for anyone, so the default is pretty safe, but be careful what you add, because this is access to control your box.  straight and
       none authorizations are not recommended, you should probably stick with md2 or md5.


SIGNALS
       SIGHUP
            ipmilan should handle SIGHUP and reread it's configuration files.  However, it doesn't right now.  It might in the future, for now you will have to kill it and restart it.  Clients should  han-
            dle reconnecting in this case.  If they don't, they are broken.


ERROR OUTPUT
       At startup, all error output goes to stderr.  After that, all error output goes to syslog.


FILES
       /etc/ipmi_lan.conf


SEE ALSO
       ipmi_lan(5),ipmi_ui(1),openipmish(1)


KNOWN PROBLEMS
       Currently, ipmilan does not implement writing the config file.  IPMI commands to change configuration options are accepted, but the permanent writing of the changes does not currently work.


AUTHOR
       Corey Minyard <cminyard@mvista.com>



OpenIPMI                                                                                           06/26/12                                                                                        ipmilan(8)
