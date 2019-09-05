check-bios-nx(1)                                                    cpu-checker                                                   check-bios-nx(1)

NAME
       check-bios-nx - determine if BIOS has blocked CPU's NX capabilities

SYNOPSIS
       check-bios-nx [-h|--help] [--verbose]

OPTIONS
       -h|--help - display a help message and exit

       --verbose - explain in detail what has been detected

DESCRIPTION
       This program attempts to determine if the running x86-based CPU has NX capabilities (regardless of it being disabled by the BIOS).

       If the CPU is NX-capable but the nx bit is missing from flags, exit 1 (i.e. "BIOS settings need changing"), otherwise exit 0 (i.e. "nothing
       wrong with BIOS")

MORE INFORMATION
       http://launchpad.net/cpu-checker

AUTHOR
       This manpage was written by Dustin Kirkland <kirkland@canonical.com> for Ubuntu systems (but may be used by others).  Permission is granted
       to copy, distribute and/or modify this document under the terms of the GNU General Public License, Version 3 published by the Free Software
       Foundation.

       On Debian systems, the complete text of the GNU General Public License can be found in /usr/share/common-licenses/GPL-3.

cpu-checker                                                        9 March 2010                                                   check-bios-nx(1)
