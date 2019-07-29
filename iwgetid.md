IWGETID(8)                                                   Linux Programmer's Manual                                                  IWGETID(8)

NAME
       iwgetid - Report ESSID, NWID or AP/Cell Address of wireless network

SYNOPSIS
       iwgetid [interface] [--raw] [--scheme] [--ap] [--freq]
                          [--mode] [--protocol] [--channel]

DESCRIPTION
       iwgetid  is used to find out the NWID, ESSID or AP/Cell Address of the wireless network that is currently used. The information reported is
       the same as the one shown by iwconfig, but iwgetid is easier to integrate in various scripts.
       By default, iwgetid will print the ESSID of the device, and if the device doesn't have any ESSID it will print its NWID.
       The default formatting output is pretty-print.

OPTIONS
       --raw  This option disables pretty-printing of the information. This option is orthogonal to the other options (except --scheme),  so  with
              the appropriate combination of options you can print the raw ESSID, AP Address or Mode.
              This  format is ideal when storing the result of iwgetid as a variable in Shell or Perl scripts or to pass the result as an argument
              on the command line of iwconfig.

       --scheme
              This option is similar to the previous one, it disables pretty-printing of the information and removes all characters that  are  not
              alphanumerics (like space, punctuation and control characters).
              The resulting output is a valid Pcmcia scheme identifier (that may be used as an argument of the command cardctl scheme).  This for‐
              mat is also ideal when using the result of iwgetid as a selector in Shell or Perl scripts, or as a file name.

       --ap   Display the MAC address of the Wireless Access Point or the Cell.

       --freq Display the current frequency or channel used by the interface.

       --channel
              Display the current channel used by the interface. The channel is determined using the current frequency and the frequency list pro‐
              vided by the interface.

       --mode Display the current mode of the interface.

       --protocol
              Display the protocol name of the interface. This allows to identify all the cards that are compatible with each other and accept the
              same type of configuration.
              This can also be used to check Wireless Extension support on the interface, as this is the only attribute that all drivers  support‐
              ing Wireless Extension are mandated to support.

SEE ALSO
       iwconfig(8), ifconfig(8), iwspy(8), iwpriv(8).

wireless-tools                                                   02 December 2003                                                       IWGETID(8)
