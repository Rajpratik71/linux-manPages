PM-IS-SUPPORTED(1)                                                                         pm-utils User Manual                                                                        PM-IS-SUPPORTED(1)

NAME
       pm-is-supported - Test whether suspend or hibernate is supported.

SYNOPSIS
       pm-is-supported [{--suspend | --hibernate | --suspend-hybrid}]

DESCRIPTION
       This manual page documents briefly the pm-is-supported command.

       The intended purpose of pm-is-supported is to find out which power management modes are supported by the system. hald(8) will call it to do just that. (Note that UPower does not use this.)

OPTIONS
       --suspend
           Test whether suspend is supported. Suspend is a state where most devices are shutdown, except for RAM. This state still draws power.

       --hibernate
           Test whether hibernate is supported. During hibernate the state of the system is saved to disk, the system is fully powered off.

       --suspend-hybrid
           Test whether hybrid-suspend is supported. Hybrid-suspend is the process where first the state of the system is saved to disk -- just like with hibernate -- but instead of poweroff, the
           system goes in suspend state, which means it can wakeup quicker than for normal hibernation. The advantage over suspend is that you can resume even if you run out of power. s2both is a
           hybrid-suspend implementation.

RETURN VALUE
       The result of the test for a certain powermanagement state is defined by the following exit codes.

       Code   Diagnostic
       0      State available.
       1      State NOT available.

SEE ALSO
       hald(8), pm-suspend(8), s2both(8), UPower(7)

AUTHOR
       Tim Dijkstra <tim@famdijkstra.org>
           Manpage author.

COPYRIGHT
       Copyright © 2007 Tim Dijkstra

       This manual page was originally written for the Debian(TM) system, and has been adopted by the pm-utils project.

       Permission is granted to copy, distribute and/or modify this document under the terms of the GNU General Public License, Version 2 or (at your option) any later version published by the Free
       Software Foundation.

pm-is-supported                                                                                Apr 18, 2007                                                                            PM-IS-SUPPORTED(1)
