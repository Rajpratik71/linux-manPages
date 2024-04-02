UPGRADE-SYSTEM(8)                                                Debian GNU/Linux                                                UPGRADE-SYSTEM(8)

NAME
       upgrade-system - Command for upgrading and sanitizing a Debian system

SYNOPSIS
       upgrade-system

DESCRIPTION
       upgrade-system  is  an  APT  front-end  that simplifies regular upgrading of Debian systems, only requiring an administrator's intervention
       whenever updated packages necessitate the configuration of new features.

       The command sequentially performs the following operations:

       ·  Synchronize the list of available Debian packages.

       ·  Upgrade all installed packages to their newest versions.

       ·  Recursively uninstall all obsolete package dependencies.

       ·  Clean retrieved archives off the APT cache.

ENVIRONMENT
       Setting the FLAUSCH environment variable enables useful advanced system sanitization features. See upgrade-system.conf(5) for more details.

FILES
       /etc/upgrade-system.conf

AUTHORS
       Copyright © 2004-2012 Martin-Éric Racine <martin-eric.racine@iki.fi>
       Copyright © 2004,2012 Christoph Schindler <hop@30hopsmax.at>
       Copyright © 2003-2004 Martin Zdrahal <martin.zdrahal@konflux.at>

LICENSE
       GPLv2+: GNU GPL version 2 or later <http://gnu.org/licenses/gpl.html>.

SEE ALSO
       apt(8), upgrade-system.conf(5).

http://q-funk.iki.fi                                                2004-02-16                                                   UPGRADE-SYSTEM(8)
