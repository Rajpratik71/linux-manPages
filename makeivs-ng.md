MAKEIVS-NG(1)                                                 General Commands Manual                                                MAKEIVS-NG(1)

NAME
       makeivs - generate a dummy IVS dump file with a specific WEP key

SYNOPSIS
       makeivs <ivs file> <104-bit key>

DESCRIPTION
       makeivs-ng  is  a  tool  designed to generate an IVS dump file with an inputted WEP key.  The aim of is tools is to provide a way to create
       dumps with a known encryption key for tests.

OPTIONS
       Common options:

       -b <bssid> or --bssid <bssid>
              Set the BSSID (Access Point MAC)

       -f <num> or --first <num>
              Value for the first IV generated.

       -k <key> or --key <key>
              Target network WEP key in hex. Separator between bytes is accepted but not necessary.

       -s <num> or --seed <num>
              Seed used to setup random generator. May be used in combination with -p or --prng.

       -w <file> or --write <file>
              Filename to write IVs into.

       -c <num> or --count <num>
              Amount of IVs to generate. Default value is 100000.

       -d <num> or --dupe <num>
              Percentage of duplicate IVs.

       -e <num> or --error <num>
              Percentage of erroneous keystreams.

       -l <num> or --length <num>
              Size of keystreams. Default: 16 bytes.

       -n or --nofms
              Ignores weak IVs.

       -p or --prng
              Use random values when generating IVs. Default is to use sequential values.

       --help Show help screen.

EXAMPLE
       makeivs makeivs -w out.ivs -k 123456789ABCDEF123456789AB

AUTHOR
       This manual page was written by Adam Cecile <gandalf@le-vert.net> for the Debian system (but may be used by others).  Permission is granted
       to copy, distribute and/or modify this document under the terms of the GNU General Public License, Version 2 or any later version published
       by the Free Software Foundation On Debian systems, the complete text of the GNU General Public License can be found  in  /usr/share/common-
       licenses/GPL.

SEE ALSO
       airbase-ng(8)
       aireplay-ng(8)
       airmon-ng(8)
       airodump-ng(8)
       airodump-ng-oui-update(8)
       airserv-ng(8)
       airtun-ng(8)
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
       packetforge-ng(1)
       wpaclean(1)
       airventriloquist(8)

Version 1.5.2                                                      December 2018                                                     MAKEIVS-NG(1)
