GETAPPCORE(8)                                                                              Support Utilities Manual                                                                             GETAPPCORE(8)



NAME
       getappcore - Get Application Core File

SYNOPSIS
       getappcore [OPTIONS] </path/to/core/file>

DESCRIPTION
       Creates  an  archive containing an application core, and all files required to analyze the application core - including the binary which created the core, and all required shared libraries. Included
       in the archive is a logfile containing RPM version information for further investigation by SUSE.

OPTIONS
       -h     This screen

       -b path
              Path to the binary which generated the application core file

       -r srnum
              Novell Service Request number associated with this issue

       -u     Automatically uploads archive to ftp.novell.com:/incoming

       -v     Enable verbose messages

EXAMPLES
       getappcore -ur 12345678901 -b /bin/rpm /core.15832

AUTHOR
       Mike Latimer <mlatimer@suse.com>

COPYRIGHT
       This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation; version 2 of the License.

       This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU  Gen-
       eral Public License for more details.

       You should have received a copy of the GNU General Public License along with this program; if not, see <http://www.gnu.org/licenses/>.



supportutils                                                                                     20 Mar 2014                                                                                    GETAPPCORE(8)
