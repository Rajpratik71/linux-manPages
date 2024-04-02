ETTERCAP(8)                                                   System Manager's Manual                                                  ETTERCAP(8)

NAME
       ettercap-pkexec - graphical pkexec-based launcher for ettercap

       This launcher depends on policykit-1 and the menu packages, and basically wraps the ettercap binary command
       with a pkexec action script usually defined on /usr/share/polkit-1/actions/org.pkexec.ettercap.policy,
       allowing users to directly call ettercap from the desktop or menu launcher with root privileges.
       The commands available are exactly the same as the ettercap man page.

       Please refer to man ettercap for the list of available parameters.
       (don't forget to change "ettercap" to "ettercap-pkexec" as caller program).

       example:

       ettercap-pkexec -G will start ettercap with root privileges and the GTK2 interface.

AUTHOR
       This code was originally taken from arch distro, and refactored to work with cmake system by
       Gianfranco Costamagna (LocutusOfBorg) <costamagnagianfranco@yahoo.it>

ORIGINAL AUTHORS
       Alberto Ornaghi (ALoR) <alor@users.sf.net>
       Marco Valleri (NaGA) <naga@antifork.org>

PROJECT STEWARDS
       Emilio Escobar (exfil)  <eescobar@gmail.com>
       Eric Milam (Brav0Hax)  <jbrav.hax@gmail.com>

OFFICIAL DEVELOPERS
       Mike Ryan (justfalter)  <falter@gmail.com>
       Gianfranco Costamagna (LocutusOfBorg)  <costamagnagianfranco@yahoo.it>
       Antonio Collarino (sniper)  <anto.collarino@gmail.com>
       Ryan Linn   <sussuro@happypacket.net>
       Jacob Baines   <baines.jacob@gmail.com>

CONTRIBUTORS
       Dhiru Kholia (kholia)  <dhiru@openwall.com>
       Alexander Koeppe (koeppea)  <format_c@online.de>
       Martin Bos (PureHate)  <purehate@backtrack.com>
       Enrique Sanchez
       Gisle Vanem  <giva@bgnett.no>
       Johannes Bauer  <JohannesBauer@gmx.de>
       Daten (Bryan Schneiders)  <daten@dnetc.org>

SEE ALSO
       etter.conf(5) ettercap_curses(8) ettercap_plugins(8) etterlog(8) etterfilter(8)

AVAILABILITY
       https://github.com/Ettercap/ettercap/downloads

GIT
       git clone git://github.com/Ettercap/ettercap.git
       or
       git clone https://github.com/Ettercap/ettercap.git

BUGS
       Our software never has bugs.
       It just develops random features.   ;)

       KNOWN-BUGS

       - ettercap doesn't handle fragmented packets... only the first segment will be displayed by the sniffer. However all the fragments are cor‐
       rectly forwarded.

       + please send bug-report,  patches  or  suggestions  to  <ettercap-betatesting@lists.sourceforge.net>  or  visit  https://github.com/Etter‐
       cap/ettercap/issues.

       + to report a bug, follow the instructions in the README.BUGS file

PHILOLOGICAL HISTORY
       "Even  if  blessed  with  a  feeble  intelligence,  they are cruel and smart..."  this is the description of Ettercap, a monster of the RPG
       Advanced Dungeons & Dragon.

       The name "ettercap" was chosen because it has an assonance with "ethercap" which means "ethernet capture" (what ettercap actually does) and
       also because such monsters have a powerful poison... and you know, arp poisoning... ;)

The Lord Of The (Token)Ring
       (the fellowship of the packet)

       "One Ring to link them all, One Ring to ping them,
        one Ring to bring them all and in the darkness sniff them."

Last words
       "Programming  today  is a race between software engineers striving to build bigger and better idiot-proof programs, and the Universe trying
       to produce bigger and better idiots. So far, the Universe is winning." - Rich Cook

ettercap 0.8.2                                                                                                                         ETTERCAP(8)
