vmmouse_detect(1)                                             General Commands Manual                                            vmmouse_detect(1)

NAME
       vmmouse_detect - VMware mouse device autodetection tool

SYNOPSIS
       vmmouse_detect

OPTIONS
       vmmouse_detect has no options

DESCRIPTION
       vmmouse_detect  is  a  tool  for detecting if running in a VMware environment where vmmouse is used.  It exits with a 0 return value if the
       vmmouse client is enabled, and 1 if not.

DIAGNOSTICS
       vmmouse_detect's exit status is used to communicate information.

       0      vmmouse_detect found a mouse and exited normally.

       1      Either the vmmouse client was not enabled, or it is not being run from within a VMware virtual machine.

BUGS
       Please report bugs in vmmouse_detect <https://bugs.launchpad.net/ubuntu/+source/mdetect/vmmouse_detect>.

AUTHORS
       vmmouse_detect is copyright 2007 VMware, Inc.

LICENSING
       The vmmouse_detect source code is licensed under a BSD-like license.  See COPYING for details.

       This manual page is licensed under the GNU General Public License.

SEE ALSO
       mdetect(1), XFree86(1)

X Version 11                                                 xf86-input-vmmouse 13.1.0                                           vmmouse_detect(1)
