openipmicmd(1)                                                                            An IPMI Command Interface                                                                            openipmicmd(1)



NAME
       openipmicmd - An IPMI Command Interface


SYNOPSIS
       openipmicmd [-k entry-to-execute] <connection parms>


DESCRIPTION
       The openipmicmd program allows a user to execute direct IPMI commands.  It can work with direct interface with the OpenIPMI driver or with IPMI LAN interfaces.


OPTIONS
       -k entry-to-execute
              Execute a single command an exit.


       <connectionparms>
              The parameters for the connection depend on the connection type.  These are all described in openipmi_conparms (7)


COMMANDS
       Once up, you can execute commands in the user interface.  Note that commands and responses are asynchronous, you issue a command and the interface returns immediately.  When the response comes back,
       it will be dumped on your console.  That's a little strange looking, but IPMI is ansychronous underneath.  Note that the -k option is synchronous, it will wait for the response or a  timeout  before
       returning.


       0f lun netfn cmd [data1 [data2 ...]]
              Send a command to the BMC you are connected to.


       channel [ipmb] IPMB-addr lun netfn [seq] cmd [data1 [data2 ...]]
              Send  a  command  to  a device on the IPMB bus.  The "ipmb" string is optional.  The seq must be provided if the netfn is a response (an odd number).  It must be the same sequence number that
              came in on the command in the "Command Sequence = seq" part of the command.


       channel 00 IPMB-addr lun netfn cmd [data1 [data2 ...]]
              Send a broadcast command to a device on the IPMB bus.


       channel lan handle remote-swid local-swid lun netfn cmd [data1 [data ...]]
              Send a command to a device over a LAN channel.  Note that this not the same as a LAN connection.  This sends a message through a local BMC to a remote system that is hooked up with a LAN con-
              nection.


       test_lat count command
              Executes the given commands (one of the previous commands) count times and gives the average time per command to execute.  Note that "count" is hexadecimal.


       help   Display some help.


       regcmd netfn cmd
              Register  to  receive the given command.  If the driver receives an external command, it will print it out.  This only works with system interface connections, it will not work on LAN connec-
              tions.


       unregcmd netfn cmd
              Remove a command registration.


SEE ALSO
       ipmi_ui(1), ipmilan(8), openipmi_conparms(7)


KNOWN PROBLEMS
       The asychronous nature of the program can be annoying.


AUTHOR
       Corey Minyard <cminyard@mvista.com>



OpenIPMI                                                                                           05/13/03                                                                                    openipmicmd(1)
