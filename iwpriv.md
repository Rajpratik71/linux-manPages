IWPRIV(8)                                                    Linux Programmer's Manual                                                   IWPRIV(8)

NAME
       iwpriv - configure optionals (private) parameters of a wireless network interface

SYNOPSIS
       iwpriv [interface]
       iwpriv interface private-command [private-parameters]
       iwpriv interface private-command [I] [private-parameters]
       iwpriv interface --all

DESCRIPTION
       Iwpriv  is  the  companion  tool  to iwconfig(8).  Iwpriv deals with parameters and setting specific to each driver (as opposed to iwconfig
       which deals with generic ones).

       Without any argument, iwpriv list the available private commands available on each interface, and the parameters that they  require.  Using
       this information, the user may apply those interface specific commands on the specified interface.

       In theory, the documentation of each device driver should indicate how to use those interface specific commands and their effect.

PARAMETERS
       private-command [private-parameters]
              Execute the specified private-command on the interface.
              The command may optionally take or require arguments, and may display information. Therefore, the command line parameters may or may
              not be needed and should match the command expectations. The list of commands that iwpriv displays (when  called  without  argument)
              should give you some hints about those parameters.
              However you should refer to the device driver documentation for information on how to properly use the command and the effect.

       private-command [I] [private-parameters]
              Idem,  except  that I (an integer) is passed to the command as a Token Index.  Only some command will use the Token Index (most will
              ignore it), and the driver documentation should tell you when it's needed.

       -a/--all
              Execute and display all the private commands that don't take any arguments (i.e.  read only).

DISPLAY
       For each device which support private commands, iwpriv will display the list of private commands available.

       This include the name of the private command, the number or arguments that may be set and their type, and the number or arguments that  may
       be display and their type.

       For example, you may have the following display :
       eth0      Available private ioctl :
                 setqualthr (89F0) : set   1 byte & get   0
                 gethisto (89F7) : set   0      & get  16 int

       This indicate that you may set the quality threshold and display an histogram of up to 16 values with the following commands :
         iwpriv eth0 setqualthr 20
         iwpriv eth0 gethisto

AUTHOR
       Jean Tourrilhes - jt@hpl.hp.com

FILES
       /proc/net/wireless

SEE ALSO
       iwconfig(8), iwlist(8), iwevent(8), iwspy(8), wireless(7).

net-tools                                                         31 October 1996                                                        IWPRIV(8)
