solterm(1)                                                                               IPMI Serial over LAN program                                                                              solterm(1)



NAME
       solterm - An IPMI Serial over LAN program


SYNOPSIS
       solterm

       <connection  parms> [-e escape_char] [-notencrypted] [-notauthenticated] [-bitrate (9600|19200|38400|57600|115200)] [-alerts (succeed|defer|fail)] [-holdoff] [-ack-retries n] [-ack-timeout microsec-
       onds] [-v] [-q]

DESCRIPTION
       The solterm program allows a user to make a remote serial connection over IPMI.  The requires that the remote system support IPMI 2.0 Serial Over LAN.


OPTIONS
       <connection parms>
              The parameters for the connection depend on the connection type.  These are all described in openipmi_conparms (7)


       -e escape_char
              The character to use to escape, or exit, the program.  Entering this chatacter right after a newline is entered causes the program to go into command mode.  A single character after this per-
              forms a command.  The default escape character is "~" as shown below.  Suppported commands are:

              ~.     Terminate the program

              ~B     Send a serial BREAK over the connection

              ~F     Flush all buffers

              ~R     Assert the Ring Indicator (RI) line

              ~r     Deassert the Ring Indicator (RI) line

              ~D     Assert DCD and DSR lines

              ~d     Deassert DCD and DSR lines

              ~C     Pause the output using CTS

              ~c     Put CTS under BMC control

              ~?     Help on escape commands

              ~~     Enter the escape character twice to send it.


       -notencrypted
              Do not encrypt the SOL data going over the connection.


       -notauthenticated
              Do not do integrity checks on the SOL data going over the connection.


       -bitrate
              Set the bitrate to the given value.  The default is whatever the BMC has set it to.


       -alerts
              This specifies what to do if a alert that requires a callout occurs on the line.

              succeed
                     specifies that serial/modem alerts are to succeed while SoL is active.

              deferred
                     specifies that serial/modem alerts are to be deferred for the duration of the SoL session.

              fail   specifies that serial/modem alerts automatically fail during the SoL session. This is the default.


       -holdoff
              Specifies that CTS, DTR, and DSR are to be deasserted at the start of the SoL session so that the configuration may be modifeid before the handshake is released.


       -v     Be more verbose.  Maybe specified multiple time for more output.


       -q     Be less verbose.  Maybe specified multiple time for less output.


SEE ALSO
       openipmi_conparms(7)


KNOWN PROBLEMS
       None


AUTHOR
       Darius Davis <dariusd@users.sourceforge.net>



OpenIPMI                                                                                           05/13/03                                                                                        solterm(1)
