lxc-autostart(1)                                        lxc-autostart(1)

NAME
       lxc-autostart - start/stop/kill auto-started containers

SYNOPSIS
       lxc-autostart [-k] [-L] [-r] [-s] [-a] [-A] [-g groups] [-t
                     timeout]

DESCRIPTION
       lxc-autostart processes containers with  lxc.start.auto  set.  It
       lets  the  user  start, shutdown, kill, restart containers in the
       right order,  waiting  the  right  time.  Supports  filtering  by
       lxc.group or just run against all defined containers. It can also
       be used by external tools in list mode where no  action  will  be
       performed  and  the list of affected containers (and if relevant,
       delays) will be shown.

       The [-r], [-s] and [-k] options specify the  action  to  perform.
       If  none is specified, then the containers will be started.  [-a]
       and [-g] are used to specify which containers will  be  affected.
       By  default  only  containers without a lxc.group set will be af‐
       fected.  [-t TIMEOUT] specifies the maximum  amount  of  time  to
       wait for the container to complete the shutdown or reboot.

OPTIONS
       -r,--reboot
              Request a reboot of the container.

       -s,--shutdown
              Request a clean shutdown. If a [-t timeout] greater than 0
              is given and the container has not shut down  within  this
              period, it will be killed as with the [-k kill] option.

       -k,--kill
              Rather  than requesting a clean shutdown of the container,
              explicitly kill all tasks in the container.

       -L,--list
              Rather than performing the action, just print the contain‐
              er name and wait delays until starting the next container.

       -t,--timeout TIMEOUT
              Wait TIMEOUT seconds before hard-stopping the container.

       -g,--group GROUP
              Comma  separated  list  of  groups  to select (defaults to
              those without a lxc.group - the NULL group).  This  option
              may be specified multiple times and the arguments concate‐
              nated. The NULL or empty group may be specified as a lead‐
              ing comma, trailing comma, embedded double comma, or empty
              argument where the NULL group should be processed.  Groups
              are  processed in the order specified on the command line.
              Multiple invocations of the -g option may be freely inter‐
              mixed  with the comma separated lists and will be combined
              in specified order.

       -a,--all
              Ignore lxc.group and select all auto-started containers.

       -A,--ignore-auto
              Ignore the lxc.start.auto flag. Combined with -a, will se‐
              lect all containers on the system.

AUTOSTART AND SYSTEM BOOT
       The  lxc-autostart command is used as part of the LXC system ser‐
       vice, when enabled to run on host system at bootup and  at  shut‐
       down. It's used to select which containers to start in what order
       and how much to delay between each startup when the  host  system
       boots.

       Each container can be part of any number of groups or no group at
       all.  Two groups are special. One is the  NULL  group,  i.e.  the
       container  does  not  belong to any group. The other group is the
       "onboot" group.

       When the system boots with the LXC service enabled, it will first
       attempt to boot any containers with lxc.start.auto == 1 that is a
       member of the "onboot" group. The startup will  be  in  order  of
       lxc.start.order.   If an lxc.start.delay has been specified, that
       delay will be honored before attempting to start  the  next  con‐
       tainer to give the current container time to begin initialization
       and reduce overloading the host system. After starting  the  mem‐
       bers  of  the "onboot" group, the LXC system will proceed to boot
       containers with lxc.start.auto == 1 which are not members of  any
       group (the NULL group) and proceed as with the onboot group.

STARTUP GROUP EXAMPLES
       -g "onboot,"
              Start the "onboot" group first then the NULL group.

              This is the equivalent of: -g onboot -g "".

       -g "dns,web,,onboot"
              Starts the "dns" group first, the "web" group second, then
              the NULL group followed by the "onboot" group.

              This is the equivalent of: -g dns,web -g ,onboot or -g dns
              -g web -g "" -g onboot.

SEE ALSO
       lxc(7), lxc-create(1), lxc-copy(1), lxc-destroy(1), lxc-start(1),
       lxc-stop(1), lxc-execute(1), lxc-console(1), lxc-monitor(1), lxc-
       wait(1),  lxc-cgroup(1),  lxc-ls(1),  lxc-info(1), lxc-freeze(1),
       lxc-unfreeze(1), lxc-attach(1), lxc.conf(5)

AUTHOR
       Stéphane Graber <stgraber@ubuntu.com>

                               2018-12-20               lxc-autostart(1)
