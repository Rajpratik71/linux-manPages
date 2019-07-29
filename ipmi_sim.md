ipmi_sim(1)                                                                                 IPMI LAN BMC Simulator                                                                                ipmi_sim(1)



NAME
       ipmi_sim - IPMI LAN BMC Simulator


SYNOPSIS
       ipmi_sim [-c configfile] [-f commandfile] [-d] [-n] [-x command]


DESCRIPTION
       The  ipmi_sim daemon emulates an IPMI BMC simulator that may be accessed using the IPMI 1.5 or 2.0 LAN protocol, or via various serial protocols.  It is useful stand-along for prototyping, it may be
       used with a virtual machine such as QEMU to provide an IPMI BMC emulator, and it may be used to implement an actual BMC (where it's not such a simulator any more)

       ipmi_sim supports the full authentication capabilities of the IPMI LAN protocol.

       ipmi_sim supports multiple IP addresses for fault-tolerance.  Note that messages coming in on an address are always sent back out on the same address they came in.


OPTIONS
       -c config-file
              Set the configuration file to one other than the default of /etc/ipmi/lan.conf . See ipmi_lan(5) for details.

       -f command-file
              Specify a command file to execute when ipmi_sim is starting.  This is generally used to set up the IPMI environment.  See ipmi_sim_cmd(5) for details.

       -x  command
              Execute a single command.

       -d     Turns on debugging to standard output (if -n is not specified) and the debug output of syslog.

       -n     Disables console and I/O on standard input and output.



CONFIGURATION
       Configuration is accomplished through the file /etc/ipmi/lan.conf.  A file with another name or path may be specified using the -c option.  See the ipmi_lan(5) config file man page for more details.


COMMANDS
       When ipmi_sim starts up, it has an empty environment with no BMC or management controllers.  You have to execute commands to set things up.  The commands can also  be  used  to  set  sensor  states,
       inject events, and other things you might want to do when simulating a BMC.  See the ipmi_sim_cmd(5) man page for details.


SECURITY
       ipmi_sim  implements normal IPMI security.  The default is no access for anyone, so the default is pretty safe, but be careful what you add, because this is access to control your box.  straight and
       none authorizations are not recommended, you should probably stick with md2 or md5 if you are not using RMCP+.


PERSISTENCE
       Things that are supposed to be persistent in a BMC are kept in files, generall in /var/ipmi_sim/<name>, where <name> is the name of the BMC specified in the configuration file.  The following things
       are persistent:


       SDRs   - This is named sdr.<mcnum>.main and is the main SDR repository.

       SEL    - This is named sel.<mcnum>.

       Users  - This is named users.mc<mcnum>.

       LAN parameters
              - This is named lanparm.mc<mcnum>.<channel>.

       SOL parameters
              - This is named sol.mc<mcnum>.


       The <mcnum> is the hexadecimal number of the MC.


Serial Over LAN (SOL)
       ipmi_sim implements Serial Over LAN for hooking an RMCP+ connection to a standard Unix serial port.  This is configured in the ipmi_lan(5) configuration file.

       A  SOL interface is done on a per-MC basis.  So if the MC is set to a non-BMC, you can define a SOL interface on it and it will work if you reroute the commands to that MC.  It's a little weird, but
       it works.  Only interface 1 is supported at the moment.

       A SOL interface can also hold history that is kept even if nothing is connected to the SOL interface from the LAN.  So if you want to see what has happened on the serial port,  you  can  connect  to
       interface 2 and it will dump the history.  The history is optionally persistent, if the program terminates normally and is restarted, the history is restored if it is configured to do so.

       A SOL interface can create a FRU on the MC to let you fetch the history via the FRU interface.


SIGNALS
       SIGHUP
            ipmi_sim should handle SIGHUP and reread it's configuration files.  However, it doesn't right now.  It might in the future, for now you will have to kill it and restart it.  Clients should han-
            dle reconnecting in this case.  If they don't, they are broken.


ERROR OUTPUT
       At startup, all error output goes to stderr.  After that, all error output goes to syslog.


FILES
       /etc/ipmi_lan.conf


SEE ALSO
       ipmi_lan(5),ipmi_sim_cmd(5),ipmi_ui(1),openipmish(1)


AUTHOR
       Corey Minyard <cminyard@mvista.com>



OpenIPMI                                                                                           06/26/12                                                                                       ipmi_sim(1)
