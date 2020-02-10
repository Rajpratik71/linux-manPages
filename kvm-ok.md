kvm-ok(1)                                                                                      cpu-checker                                                                                      kvm-ok(1)

NAME
       kvm-ok - determine if this system is capable of running hardware accelerated KVM virtual machines (ie, possesses Virtualization Technology)

DESCRIPTION
       kvm-ok is a program that will determine if the locate system can host hardware accelerated KVM virtual machines.

       The program will first determine if /proc/cpuinfo contains the flags indicating that the CPU has the Virtualization Technology (VT) capability.

       Next, it will check if the /dev/kvm device exists.

       If running as root, it will check your CPU's MSRs to see if VT is disabled in the BIOS.

       In some failure cases, kvm-ok provides hints on how you might go about enabling KVM on a system where it is arbitrarily disabled.

       If KVM can be used, this script will exit 0, otherwise it will exit non-zero.

SEE ALSO
       kvm(1), dmesg(1)

FILES
       /proc/cpuinfo, /dev/kvm

BUGS
       The  disabled-by-bios  check  currently  scans  dmesg(1) for a message displayed by the kernel.  This is not ideal, in that a long-running system will eventually roll the dmesg logs.  The kernel
       should expose the disabled-by-bios flag in /proc/cpuinfo.

       https://bugs.launchpad.net/ubuntu/+source/linux/+bug/535373

MORE INFORMATION
       http://launchpad.net/cpu-checker

AUTHOR
       This manpage and the utility was written by Dustin Kirkland <kirkland@canonical.com> for Ubuntu systems (but may be used by others).  Permission is granted to copy, distribute and/or modify this
       document under the terms of the GNU General Public License, Version 3 published by the Free Software Foundation.

       On Debian systems, the complete text of the GNU General Public License can be found in /usr/share/common-licenses/GPL-3.

cpu-checker                                                                                    9 March 2010                                                                                     kvm-ok(1)
