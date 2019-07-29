AIRVENTRILOQUIST-NG(8)                                        System Manager's Manual                                       AIRVENTRILOQUIST-NG(8)

NAME
       airventriloquist-ng - encrypted WiFi packet injection

SYNOPSIS
       airventriloquist-ng [options]

DESCRIPTION
       airventriloquist-ng injects on encrypted WiFi packet and circumvents wireless intrusion prevention systems.

OPTIONS
       --help Shows the help screen.

       -i <replay interface>
              Interface to capture and inject. Mandatory option.

       -d, --deauth
              Sends active deauthentications frames to encrypted stations.

       -e <value>, --essid <value>
              ESSID  of  target  network.  For SSID containing special characters, see https://www.aircrack-ng.org/doku.php?id=faq#how_to_use_spa‐
              ces_double_quote_and_single_quote_etc_in_ap_names

       -p <value>, --passphrase <value>
              WPA Passphrase of the target network. Passphrase is between 8 and 63 characters long.

       -c, --icmp
              Respond to all ICMP frames (Debug).

       -n, --dns
              IP to resolve all DNS queries to.

       -s <URL>, --hijack <URL>
              URL to look for in HTTP requests when hijacking connections. The URL can have wildcards characters. Example: *jquery*.js*

       -r <URL>, --redirect <URL>
              URL to redirect hijacked connections to.

       -v, --verbose
              Verbose output.

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
       airtun-ng(8)

Version 1.5.2                                                      December 2018                                            AIRVENTRILOQUIST-NG(8)
