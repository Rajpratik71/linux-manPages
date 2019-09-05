wifi-radar(1)                                                 General Commands Manual                                                wifi-radar(1)

NAME
       WiFi Radar - utility for managing WiFi profiles

SYNOPSIS
       wifi-radar [OPTION]...

DESCRIPTION
       WiFi Radar is a PyGTK2 utility for managing WiFi profiles.

       It will look for the config file in /etc/wifi-radar/wifi-radar.conf.  You can change that in wifi-radar.

       If the configuration file does not exist, it will create it, so you must always run it within a correctly permitted account (as root or use
       sudo or pam).

       Recent versions partially implement WPA-TKIP with wpa_supplicant. You need a running wpa_supplicant installation  with  a  /etc/wpa_suppli‐
       cant/wpa_supplicant.conf  file.   Then by setting in your /etc/wifi-radar/wifi-radar.conf file the "use_wpa = yes" option and "wpa_driver =
       ipw" for example, wpa_supplicant will be launched when you connect using this profile.

       But currently you can't set your wpa_supplicant options like the psk, proto, key_mgmt etc. using wifi-radar.  Your wpa_supplicant  configu‐
       ration  file  should  be set and tested already. If you have different networks set in wpa_supplicant.conf, then you can switch using wifi-
       radar.

       The wifi-radar script accepts the following command-line options:

OPTIONS
       -v, --version for printing the version.

FILES
       /etc/wifi-radar/wifi-radar.conf
               See for more information.

BUGS
       Probably lots!

       Because of repeated scanning, WiFi Radar is very power consuming.

       Please report bugs to the mailing list <https://lists.anl.gov/mailman/listinfo/wifi-radar>

MORE INFORMATION
       The GIT repository is available at https://git.berlios.de/cgi-bin/gitweb.cgi?p=wifi-radar;a=summary

       If you have questions, visit http://wifi-radar.berlios.de

AUTHOR
       This Python program was originally written by Ahmad Baitaimal <ahmad@bitbuilder.com>.  It has been maintained at  various  times  by  Brian
       Elliott Finley <brian@thefinleys.com> and Sean Robinson <seankrobinson@gmail.com>.  Contributions have been provided by:

       ·   Douglas Breault <genkreton@comcast.net>

       ·   Nicolas Brouard <nicolas.brouard@libertysurf.fr>

       ·   Gary Case <gcase@redhat.com>

       ·   Jon Collette <jonc@etelos.com>

       ·   David Decotigny <com.d2@free.fr>

       ·   Simon Gerber <gesimu@gmail.com>

       ·   Joey Hurst <jhurst@lucubrate.org>

       ·   Ante Karamatic <ivoks@ubuntu.com>

       ·   Richard Monk <rmonk@redhat.com>

       ·   Kevin Otte <kotte@redhat.com>

       ·   Nathanael Rebsch <nathanael@dihedral.de>

       ·   Andrea Scarpino <andrea@archlinux.org>

       ·   Patrick Winnertz <winnie@debian.org>

SEE ALSO
       wifi-radar.conf(5) wpa_supplicant(8)

WiFi Radar 2.0                                                       July 2009                                                       wifi-radar(1)
