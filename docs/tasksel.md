TASKSEL(8)                                                                       Debian specific manpage                                                                       TASKSEL(8)

NAME
       tasksel - a user interface for installing tasks

SYNOPSIS
       tasksel install <task>

       tasksel remove <task>

       tasksel [options]

DESCRIPTION
       tasksel shows all available tasks and allows selecting ones to install

OPTIONS
       -t, --test
           test mode; don't actually install or remove packages

       --new-install
           automatically select some tasks without even displaying them to the user; default other tasks to on; used during new Debian installs.

       --list-tasks
           list on stdout the tasks that would be displayed in the tasksel interface

       --task-packages task
           lists on stdout the packages that are available and part of the given task

           Note that this option may be given more than once.

       --task-desc task
           outputs the extended description of the given task

       --debconf-apt-progress options
           Pass the specified options to the debconf-apt-progress command that tasksel runs.

SEE ALSO
       dpkg(8), apt-get(8)

FILES
       /usr/share/tasksel/descs/*.desc and /usr/local/share/tasksel/descs/*.desc are used to define tasks.

AUTHOR
       tasksel was written by Randolph Chung <tausq@debian.org> and Joey Hess <joeyh@debian.org>

HISTORY
       This document first appeared with tasksel-1.0

3.48                                                                                    2018-11-12                                                                             TASKSEL(8)
