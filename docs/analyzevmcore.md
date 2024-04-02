ANALYZEVMCORE(8)                                                                           Support Utilities Manual                                                                          ANALYZEVMCORE(8)



NAME
       analyzevmcore - Creates an analysis file for kernel cores

SYNOPSIS
       analyzevmcore [OPTIONS]

DESCRIPTION
       Creates  an  analysis  file  (nts_analyzevmcore_<CORE_DATE>.txt)  for  all  kernel  cores found on the system. This analysis file is automatically copied to /var/log, and included in supportconfig's
       crash.txt file for further analysis by SUSE and Novell Technical Services.

       In order to create the analysis, this script requires the kernel (vmlinux-*) and the debuginfo kernel (vmlinux-*.debug) which match the kernel version which created the core.


   KERNEL VERSION
       The kernel version is determined automatically if a README.txt file exists in the core directory. This file is typically created during core generation, and should contain the following string:

          Kernel version : $(uname -r)

       If the README.txt is missing, the kernel version is taken from an existing kernel file (vmlinux-*) found in the core directory (also typically copied into the core directory during  core  creation).
       If no kernel file is found in the core directory, the kernel version is taken from the currently running kernel.  NOTE - If this is incorrect, the analysis will either fail, or be incomplete.

       To override the automatic kernel version detection process, a README.txt can be manually created in the core directory. In this case, the kernel version must be specified exactly as

          Kernel version : <correct version, i.e. 3.0.13-0.27-default>

       The kernel version can also be specified on the command line through using the -k option to point to a specific kernel file.


   DEBUGINFO KERNEL
       This debuginfo kernel contains symbols stripped from the normally running kernel.  These symbols are required for core analysis. The debuginfo kernel will only be found in the following ways:


       1.     If  the  kernel-*-debuginfo  RPM  is  installed on the system, the vmlinux-*.debug file will be found in /usr/lib/debug/boot. The kernel-*-debuginfo RPM can be installed through the Debuginfo
              update channel using:

                 zypper in kernel-<FLAVOR>-debuginfo

              For additional information on installing the Debuginfo update channel, see: http://www.suse.com/support/kb/doc.php?id=3074997


       2.     If a debuginfo kernel is not found in /usr/lib/debug/boot, the vmlinux-*.debug file will also be found if it exists in the same same directory as the normal kernel, or the same  directory  as
              the  core. As this is not normally the case, the vmlinux-*.debug file will first need to be extracted from the kernel-*-debuginfo RPM.  This can be done manually, or automatically through the
              following parameter:

                 -d [kernel-*-debuginfo.rpm]


              The correct kernel-*-debuginfo RPM can be downloaded through the Novell FileFinder, or through the patch database (using valid update credentials) at the following urls:

                   FileFinder:     http://download.novell.com/patch/finder
                   Patch Database: http://download.novell.com/patch/psdb

OPTIONS
       -h     This screen

       -c directory
              Analyze the specified vmcore directory, rather than all cores found on the system.

       -d RPM This option extracts the vmlinux-*.debug file from the specified kernel-*-debuginfo RPM into the core directory

       -k vmlinux
              The vmlinux-[version] file which created the core. This can always be found in /boot, and must match the kernel version which created the core. If this  is  in  the  current  directory  (e.g.
              /var/crash<date>), this parameter can be omitted.

       -r     Remove and recreate existing analysis files.

AUTHOR
       Mike Latimer <mlatimer@suse.com>

COPYRIGHT
       This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation; version 2 of the License.

       This  program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Gen-
       eral Public License for more details.

       You should have received a copy of the GNU General Public License along with this program; if not, see <http://www.gnu.org/licenses/>.



supportutils                                                                                     20 Mar 2014                                                                                 ANALYZEVMCORE(8)
