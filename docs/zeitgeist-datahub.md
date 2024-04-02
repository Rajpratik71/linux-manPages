ZEITGEIST-DATAHUB(1)                                          General Commands Manual                                         ZEITGEIST-DATAHUB(1)

NAME
       zeitgeist-datahub - passive loggers for Zeitgeist

SYNOPSIS
       zeitgeist-datahub [OPTION]

DESCRIPTION
       zeitgeist-datahub  is  a  daemon which centralizes all passive data sources into a single process, and interfaces between said data sources
       (also known as loggers) and zeitgeist-daemon (with which it communicates via D-Bus).

       Passive data sources are those which run in the background and look for activities independently to  the  programs  they  monitor,  whereas
       Zeitgeist can also work with active data sources which are those in-build into other applications (either natively or through extensions).

OPTIONS
       The  program  follows  the  usual  GNU  command line syntax, with options starting with two dashes (`--'). A summary of options is included
       below.

       Currently there are no options available.

SEE ALSO
       zeitgeist-daemon

BUGS
       Please report any bugs on https://bugs.launchpad.net/zeitgeist-datahub.

AUTHORS
       Please see the AUTHORS file bundled with this application for a complete list of contributors.

LICENSE
       This program is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public  License  as  pub‐
       lished by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

       This  program  is  distributed  in  the  hope  that  it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MER‐
       CHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public License for more details.

       You  should  have  received  a  copy  of  the  GNU  Lesser   General   Public   License   along   with   this   program.    If   not,   see
       <http://www.gnu.org/licenses/>.

Zeitgeist                                                          May 20, 2009                                               ZEITGEIST-DATAHUB(1)
