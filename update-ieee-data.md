update-ieee-data(8)                     System Manager's Manual                    update-ieee-data(8)

NAME
       update-ieee-data  -  update  data files from IEEE Standards Association such as the OUI and IAB
       lists

SYNOPSIS
       update-ieee-data

DESCRIPTION
       update-ieee-data fetches the current version of the OUI and IAB lists from IEEE Standards Asso‐
       ciation and installs it, if the installed versions is older than 5 days.

       This utility requires curl, wget or libwww-perl to be installed.

OPTIONS
       -q     Be quiet. Do not output messages.

       -f     Force the update, even if the file is newer than 5 days.

FILES
       /var/lib/ieee-data
              Directory with the updated listings.

AUTHORS
       Filippo Giunchedi <filippo@debian.org> and Luciano Bello <luciano@debian.org>.

ieee-data                                    13 June 2014                          update-ieee-data(8)
