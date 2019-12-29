TELINIT(8)                                      telinit                                     TELINIT(8)

NAME
       telinit - Change SysV runlevel

SYNOPSIS
       telinit [OPTIONS...] {COMMAND}

DESCRIPTION
       telinit may be used to change the SysV system runlevel. Since the concept of SysV runlevels is
       obsolete the runlevel requests will be transparently translated into systemd unit activation
       requests.

OPTIONS
       The following options are understood:

       --help
           Print a short help text and exit.

       --no-wall
           Do not send wall message before reboot/halt/power-off.

       The following commands are understood:

       0
           Power-off the machine. This is translated into an activation request for poweroff.target
           and is equivalent to systemctl poweroff.

       6
           Reboot the machine. This is translated into an activation request for reboot.target and is
           equivalent to systemctl reboot.

       2, 3, 4, 5
           Change the SysV runlevel. This is translated into an activation request for
           runlevel2.target, runlevel3.target, ... and is equivalent to systemctl isolate
           runlevel2.target, systemctl isolate runlevel3.target, ...

       1, s, S
           Change into system rescue mode. This is translated into an activation request for
           rescue.target and is equivalent to systemctl rescue.

       q, Q
           Reload daemon configuration. This is equivalent to systemctl daemon-reload.

       u, U
           Serialize state, reexecute daemon and deserialize state again. This is equivalent to
           systemctl daemon-reexec.

EXIT STATUS
       On success, 0 is returned, a non-zero failure code otherwise.

NOTES
       This is a legacy command available for compatibility only. It should not be used anymore, as
       the concept of runlevels is obsolete.

SEE ALSO
       systemd(1), systemctl(1), wall(1)

systemd 242                                                                                 TELINIT(8)
