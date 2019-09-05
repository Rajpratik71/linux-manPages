CHKBIN(8)                                                                                  Support Utilities Manual                                                                                 CHKBIN(8)



NAME
       chkbin - Binary Check Tool

SYNOPSIS
       chkbin [-ah] </path/to/file>

DESCRIPTION
       Checks  the RPM package owner of the file being checked. It also checks the RPM package owner for each of the file's shared library dependencies. It then runs an rpm verify on each of the unique RPM
       packages associated with the file and it's shared library dependencies.

       This tool will create a text file in the default /var/log directory. Supportconfig will gather chkbin log files if present. Please attach the chkbin log files or the supportconfig with chkbin  files
       to your open service request, using the following URL: https://secure-support.novell.com/eService_enu

       If you cannot attach the file to the service request, then email it to the support engineer assigned to your service request.

OPTIONS
       -h     This screen

       -a     Include all: The system library cache and all open files

REPORTING BUGS
       Please submit bug fixes or comments via: http://en.opensuse.org/Supportutils#Reporting_Bugs

AUTHOR
       Jason Record <jrecord@suse.com>

COPYRIGHT
       This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation; version 2 of the License.

       This  program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Gen-
       eral Public License for more details.

       You should have received a copy of the GNU General Public License along with this program; if not, see <http://www.gnu.org/licenses/>.



supportutils                                                                                     20 Mar 2014                                                                                        CHKBIN(8)
