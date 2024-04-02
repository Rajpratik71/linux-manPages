openipmish(1)                                                                         Shell interface to an IPMI system                                                                         openipmish(1)



NAME
       openipmish - Shell interface to an IPMI system


SYNOPSIS
       openipmish [option]


DESCRIPTION
       The  openipmish is a command interpreter that gives the full power of the OpenIPMI library to a user-level command language.  It is designed so it can easily be driven with a scripting language like
       TCL, it has well-formed output.

       openipmish starts up with no connections or anything of that nature.  You must enter commands to make connections to domains.


OPTIONS
       --dmsg Turn on message debugging, this will dump all messages to debug log output.

       --drawmsg
              Turn on raw message debugging, this will dump all low-level messages to debug log output.  This differes from normal message debugging in that all protocol messages are also dumped, not  just
              IPMI messages.

       --dmem Turn on memory debugging, this will cause memory allocation and deallocations to be checked.  When the program terminates, it will dump all memory that was not properly freed (leaked).

       --dlock
              Turn on lock debugging, this will check lock operations to make sure that locks are help in all the proper places and make sure that locks are properly nested.

       --snmp Enable the SNMP trap handler.  openipmish must be compiled with SNMP code enabled for this option to be available.

       --help Help output


COMMANDS
       openipmish follows the standard command syntax defined in ipmi_cmdlang(7).  See that for the details on most commands.  The IPMI manual that comes with OpenIPMI will also be quite handy.

       openipmish defines some commands that are not in the standard command language.  These are:


       read   Read and execute commands from the given file.


       exit   Quit


       redisp_cmd on|off
              Normally, openipmish redisplays the command line when an event comes in.  This is nice for interactive use, but bad for scripting.  This lets you turn that function on and off.


SEE ALSO
       ipmi_cmdlang(7), ipmi_ui(1)


KNOWN PROBLEMS
       None


AUTHOR
       Corey Minyard <cminyard@mvista.com>



OpenIPMI                                                                                           05/13/03                                                                                     openipmish(1)
