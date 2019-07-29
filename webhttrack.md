webhttrack(1)                                                 General Commands Manual                                                webhttrack(1)

NAME
       webhttrack - offline browser : copy websites to a local directory

SYNOPSIS
       webhttrack [ keyword value [ keyword value .. ] ]

DESCRIPTION
       webhttrack this program is a script frontend to httrack(1) and htsserver(1) , a website copier.

EXAMPLES
       webhttrack lang 1
               will launch the webhttrack server frontend, and the default system browser, with "lang" set to "english" (language #1)

FILES
       /etc/httrack.conf
              The system wide configuration file.

ENVIRONMENT
       HOME   Is being used if you defined in /etc/httrack.conf the line path ~/websites/#

DIAGNOSTICS
       Errors/Warnings are reported to hts-log.txt located in the destination directory.

BUGS
       Please  reports  bugs  to <bugs@httrack.com>.  Include a complete, self-contained example that will allow the bug to be reproduced, and say
       which version of (web)httrack you are using. Do not forget to detail options used, OS version, and any other information  you  deem  neces‐
       sary.

COPYRIGHT
       Copyright (C) 1998-2013 Xavier Roche and other contributors

       This  program  is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by
       the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

       This program is distributed in the hope that it will be useful, but WITHOUT ANY  WARRANTY;  without  even  the  implied  warranty  of  MER‐
       CHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

       You should have received a copy of the GNU General Public License along with this program. If not, see <http://www.gnu.org/licenses/>.

AVAILABILITY
       The  most  recent released version of (web)httrack can be found at: http://www.httrack.com

AUTHOR
       Xavier Roche <roche@httrack.com>

SEE ALSO
       The  HTML  documentation  (available  online at http://www.httrack.com/html/ ) contains more detailed information. Please also refer to the
       httrack FAQ (available online at http://www.httrack.com/html/faq.html )

httrack website copier                                               Mar 2003                                                        webhttrack(1)
