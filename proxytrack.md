proxytrack(1)                                                 General Commands Manual                                                proxytrack(1)

NAME
       proxytrack - proxy to serve content archived by httrack website copier

SYNOPSIS
       proxytrack proxy_address:proxy_port icp_address:icp_port [ httrack_cache_filename_1 [ httrack_cache_filename_2 .. ] ]

DESCRIPTION
       proxytrack this program allows you to create a proxy to deliver content already archived by httrack(1) , a website copier.

EXAMPLES
       proxytrack proxy:8080 localhost:3130 /home/archives/example.com/hts-cache/new.zip
               will  launch  the  proxytrack  proxy,  listening  to  :8080,  to  deliver  content  archived in the /home/archives/example.com/hts-
              cache/new.zip cache

ENVIRONMENT
DIAGNOSTICS
       Errors/Warnings are reported the console and standard error

BUGS
       Please reports bugs to <bugs@httrack.com>.  Include a complete, self-contained example that will allow the bug to be  reproduced,  and  say
       which  version  of  (web)httrack you are using. Do not forget to detail options used, OS version, and any other information you deem neces‐
       sary.

COPYRIGHT
       Copyright (C) 1998-2013 Xavier Roche and other contributors

       This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as  published  by
       the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

       This  program  is  distributed  in  the  hope  that  it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MER‐
       CHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

       You should have received a copy of the GNU General Public License along with this program. If not, see <http://www.gnu.org/licenses/>.

AVAILABILITY
       The  most  recent released version of (web)httrack can be found at: http://www.httrack.com

AUTHOR
       Xavier Roche <roche@httrack.com>

SEE ALSO
       The HTML documentation (available online at http://www.httrack.com/html/ ) contains more detailed information. Please  also  refer  to  the
       httrack FAQ (available online at http://www.httrack.com/html/faq.html )

httrack website copier                                               Mar 2003                                                        proxytrack(1)
