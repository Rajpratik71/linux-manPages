PANELCTL(1)                                                                                     User Commands                                                                                     PANELCTL(1)



NAME
       panelctl - manual page for panelctl (libavc1394) 0.1

SYNOPSIS
       panelctl [OPTION] <channel|command>

DESCRIPTION
       panelctl  is a command line tool to send control commands via an IEEE1394 link to an AV/C Panel such as the Motorola Digital Consumer Terminal (DCT) series. Or for the non-techies: panelctl lets you
       remote control your digital cable box via a Firewire cable.

OPTIONS
       -d, --debug
              Display debug information

       -h, --help
              Display this help and exit

       -v, --version
              Output version information and exit

   Channels:
       001 - 999
              Tune directly to a specific channel

   Commands:
       ok     Select the highlighted item

       up     Move up in the menu or guide

       down   Move down in the menu or guide

       left   Move left in the menu or guide

       right  Move right in the menu or guide

       menu   Enter or Exit the Main Menu

       lock   Bring up Parental Control screen

       guide  Bring up Listings By Time screen

       favorite
              Scan through just your favorite channels

       exit   Return to live TV from the menu or guide

       enter  Enter the digital Music menu

       channelup
              Change channel up

       channeldown
              Change channel down

       last   Return to the previous menu or channel

       info   See a description of the current show

       help   See helpful information

       pageup Move up one page in the menu or guide

       pagedown
              Move down one page in the menu or guide

       power  Toggle the device on or off

       volumeup
              Change volume up

       volumedown
              Change volume down

       mute   Toggle sound on or off

       play   Play DVR or On-Demand content

       stop   Stop DVR or On-Demand content

       pause  Pause DVR or On-Demand content

       record Record content on the DVR

       rewind Rewind DVR or On-Demand content

       fastforward
              Fast Forward DVR or On-Demand content

       soundoff
              Turn sound off

       soundon
              Turn sound on

       num0 - num9
              Emulate a number key pressed

AUTHOR
       Written by Stacey Son, John Woodell, and Dan Dennedy.

COPYRIGHT
       Copyright (C) 2004-2006

SEE ALSO
       dvcont



panelctl (libavc1394) 0.1                                                                         April 2006                                                                                      PANELCTL(1)
