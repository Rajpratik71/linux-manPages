update-oui(8)                                                           OUI                                                          update-oui(8)

NAME
       update-oui - download new version of the OUI and IAB lists

SYNOPSIS
       update-oui

DESCRIPTION
       update-oui  fetches the current version of the OUI and IAB lists from http://standards.ieee.org/regauth/oui/index.shtml and installs it, if
       the installed versions is older than 5 days.

       This utility requires curl, wget or libwww-perl to be installed.

OPTIONS
       -q     Be quiet. Do not output messages.

       -f     Force the update, even if the file is newer than 5 days.

FILES
       /usr/share/misc/
              Directory holding symbolic links to oui.txt and iab.txt

AUTHORS
       Filippo Giunchedi <filippo@debian.org> and Luciano Bello <luciano@debian.org>.

ieee-data                                                          13 June 2014                                                      update-oui(8)
