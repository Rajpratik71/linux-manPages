AIRTUN-NG(8)                                                  System Manager's Manual                                                 AIRTUN-NG(8)

NAME
       airtun-ng - a virtual tunnel interface creator for aircrack-ng

SYNOPSIS
       airtun-ng [options] <interface name>

DESCRIPTION
       airtun-ng creates a virtual tunnel interface (atX) for sending arbitrary IP packets by using raw ieee802.11 packet injection.

OPTIONS
       -H, --help
              Shows the help screen.

       -x <pps>
              Sets maximum number of packets per second.

       -a <BSSID>
              Specifies the BSSID for the iee802.11 header. In WDS Mode this sets the Receiver.

       -h <SMAC>
              Specifies the source MAC for the iee802.11 header.

       -i <iface>
              Sets the capture interface.

       -r <file>
              Specifies a file to read 802.11 frames.

       -y <PRGA-file>
              Is the name of the file, which provides the keystream for WEP encoding. (No receiving, just transmitting of IP packets.)

       -w <WEP-key>
              This is the WEP key to en-/decrypt all traffic going through the tunnel.

       -t <tods>
              Defines  the  ToDS  and FromDS bit in the ieee802.11 header. For tods=1, the ToDS bit is set to 1 and FromDS to 0, while tods=0 sets
              them the other way around. If set to 2, it will be tunneled in a WDS/bridge.

       -m <netmask>, --netmask <netmask>
              Filters networks based on bssid ^ netmask combination. Needs -d, used in replay mode.

       -d <BSSID>, --bssid <BSSID>
              Filters networks based on the <BSSID>. Used in replay mode.

       -f, --repeat
              Enables replay mode. All read frames, filtered by bssid and netmask (if specified), will be replayed.

       -s <transmitter>
              Set Transmitter MAC address for WDS Mode.

       -b     Bidirectional mode. This enables communication in Transmitter's AND Receiver's networks. Works only if you can see both stations.

EXAMPLES
       airtun-ng -a 00:14:22:56:F3:4E -t 0 -y keystream.xor wlan0

SEE ALSO
       airbase-ng(8)
       aireplay-ng(8)
       airmon-ng(8)
       airodump-ng(8)
       airodump-ng-oui-update(8)
       airserv-ng(8)
       besside-ng(8)
       easside-ng(8)
       tkiptun-ng(8)
       wesside-ng(8)
       aircrack-ng(1)
       airdecap-ng(1)
       airdecloak-ng(1)
       airolib-ng(1)
       besside-ng-crawler(1)
       buddy-ng(1)
       ivstools(1)
       kstats(1)
       makeivs-ng(1)
       packetforge-ng(1)
       wpaclean(1)
       airventriloquist(8)

Version 1.5.2                                                      December 2018                                                      AIRTUN-NG(8)
