IWLIST(8)                                                                               Linux Programmer's Manual                                                                               IWLIST(8)

NAME
       iwlist - Get more detailed wireless information from a wireless interface

SYNOPSIS
       iwlist [interface] scanning
       iwlist [interface] frequency
       iwlist [interface] rate
       iwlist [interface] keys
       iwlist [interface] power
       iwlist [interface] txpower
       iwlist [interface] retry
       iwlist [interface] event
       iwlist [interface] auth
       iwlist [interface] wpakeys
       iwlist [interface] genie
       iwlist [interface] modulation
       iwlist --help
       iwlist --version

DESCRIPTION
       Iwlist  is  used  to  display  some additional information from a wireless network interface that is not displayed by iwconfig(8).  The main argument is used to select a category of information,
       iwlist displays in detailed form all information related to this category, including information already shown by iwconfig(8).

PARAMETERS
       scan[ning]
              Give the list of Access Points and Ad-Hoc cells in range, and optionally a whole bunch of information about them (ESSID, Quality, Frequency, Mode...). The  type  of  information  returned
              depends on what the card supports.
              Triggering  scanning is a privileged operation (root only) and normal users can only read left-over scan results. By default, the way scanning is done (the scope of the scan) is dependant
              on the card and card settings.
              This command takes optional arguments, however most drivers will ignore those. The option essid is used to specify a scan on a specific ESSID. With some card/driver, this enables  to  see
              hidden networks. The option last does not trigger a scan and read left-over scan results.

       freq[uency]/channel
              Give  the list of available frequencies in the device and the number of defined channels. Please note that usually the driver returns the total number of channels and only the frequencies
              available in the present locale, so there is no one-to-one mapping between frequencies displayed and channel numbers.

       rate/bit[rate]
              List the bit-rates supported by the device.

       keys/enc[ryption]
              List the encryption key sizes supported and list all the encryption keys set in the device.

       power  List the various Power Management attributes and modes of the device.

       txpower
              List the various Transmit Powers available on the device.

       retry  List the transmit retry limits and retry lifetime on the device.

       ap/accesspoint/peers
              Give the list of Access Points in range, and optionally the quality of link to them. This feature is obsolete and now deprecated in favor of scanning support  (above),  and  most  drivers
              don't support it.
              Some  drivers  may  use  this command to return a specific list of Peers or Access Points, such as the list of Peers associated/registered with the card. See your driver documentation for
              details.

       event  List the wireless events supported by the device.

       auth   List the WPA authentication parametes curently set.

       wpa[keys]
              List all the WPA encryption keys set in the device.

       genie  List the Generic Information Elements set in the device (used for WPA support).

       modu[lation]
              List the modulations supported by the device and the modulations currently enabled.

       --version
              Display the version of the tools, as well as the recommended and current Wireless Extensions version for the tool and the various wireless interfaces.

       --help Display short help message.

FILES
       /proc/net/wireless

SEE ALSO
       iwconfig(8), iwspy(8).  iwevent(8), iwpriv(8), wireless(7).

wireless-tools                                                                                13 April 2006                                                                                     IWLIST(8)
