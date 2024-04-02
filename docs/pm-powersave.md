PM-POWERSAVE(8)                                                pm-utils User Manual                                                PM-POWERSAVE(8)

NAME
       pm-powersave - Put your computer into low power mode

SYNOPSIS
       pm-powersave [{true | false}]

DESCRIPTION
       This manual page documents briefly the pm-powersave command.

       pm-powersave can be used to set your system into low power mode.

OPTIONS
       true
           Put the computer into low power mode to reduce energy consumption and extend your laptop's battery life.

       false
           Turn off low power mode.

FILES
       /etc/pm/power.d/, /usr/lib/pm-utils/power.d/
           When you run pm-powersave it combines the scripts in these two directories and executes them in sorted order. If both directories
           contain a script with the same name, the one in /etc/pm/power.d/ has a higher precedence and only this one will be executed.

           Therefore to disable a script from /usr/lib/pm-utils/power.d/ simply create an empty file in /etc/pm/power.d/ with the same name and
           without the executable bit set.

SEE ALSO
       pm-suspend(8), pm-hibernate(8)

AUTHOR
       Michael Biebl <biebl@debian.org>
           Manpage author.

COPYRIGHT
       Copyright © 2007 Michael Biebl

       This manual page was originally written for the Debian(TM) system, and has been adopted by the pm-utils project.

       Permission is granted to copy, distribute and/or modify this document under the terms of the GNU General Public License, Version 2 or (at
       your option) any later version published by the Free Software Foundation.

pm-powersave                                                        Mar 5, 2007                                                    PM-POWERSAVE(8)
