BUM(8)                                                        System Manager's Manual                                                       BUM(8)

NAME
       Boot-Up Manager - Graphical runlevel configuration tool

SYNOPSIS
       bum

DESCRIPTION
       bum is a runlevel configuration editor which allows  to configure init services when the system boots up or reboots.  It displays a list of
       every service which could be started at boot.  User can toggle individual services on and off.

       A detailed documentation on the program could be read at: http://www.marzocca.net/linux/bumdocs.html.

FILE
       /var/lib/bum/packages
         The script<->packages name file.

       /var/lib/bum/numbers
         The service number data file.

       /var/lock/bum
         Lock file.

AUTHOR
       Fabio MARZOCCA <thesaltydog@gmail.org>

User Contributed Perl Documentation                                perl v5.10.0                                                             BUM(8)
