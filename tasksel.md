TASKSEL(8)                                                    Debian specific manpage                                                   TASKSEL(8)

NAME
       tasksel - a user interface for installing tasks

SYNOPSIS
       tasksel install <task>

       tasksel remove <task>

       tasksel [options]

DESCRIPTION
       tasksel shows all available tasks and allows to user to select ones to install

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

       --debconf-apt-from waypoint
           Start the debconf-apt-progress bar here.

       --debconf-apt-to waypoint
           End the debconf-apt-progress bar here.

       --debconf-apt-progress options
           Pass the specified options to the debconf-apt-progress command that tasksel runs. These will be appended to any --from and --to options
           constructed by tasksel itself based on --debconf-apt-from and --debconf-apt-to options.

SEE ALSO
       dpkg(8), apt-get(8)

FILES
       /usr/share/tasksel/*.desc and /usr/local/share/tasksel/*.desc are used to define tasks.

AUTHOR
       tasksel was written by Randolph Chung <tausq@debian.org> and Joey Hess <joeyh@debian.org>

HISTORY
       This document first appeared with tasksel-1.0

3.34ubuntu3                                                         2016-01-02                                                          TASKSEL(8)
