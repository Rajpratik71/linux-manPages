SYSTEMD-RUN(1)                                                                                 systemd-run                                                                                 SYSTEMD-RUN(1)

NAME
       systemd-run - Run programs in transient scope or service or timer units

SYNOPSIS
       systemd-run [OPTIONS...] COMMAND [ARGS...]

       systemd-run [OPTIONS...] [TIMER OPTIONS...] {COMMAND} [ARGS...]

DESCRIPTION
       systemd-run may be used to create and start a transient .service or .scope unit and run the specified COMMAND in it. It may also be used to create and start transient .timer units.

       If a command is run as transient service unit, it will be started and managed by the service manager like any other service, and thus shows up in the output of systemctl list-units like any
       other unit. It will run in a clean and detached execution environment, with the service manager as its parent process. In this mode, systemd-run will start the service asynchronously in the
       background and return after the command has begun execution.

       If a command is run as transient scope unit, it will be started by systemd-run itself as parent process and will thus inherit the execution environment of the caller. However, the processes of
       the command are managed by the service manager similar to normal services, and will show up in the output of systemctl list-units. Execution in this case is synchronous, and will return only
       when the command finishes. This mode is enabled via the --scope switch (see below).

       If a command is run with timer options such as --on-calendar= (see below), a transient timer unit is created alongside the service unit for the specified command. Only the transient timer unit
       is started immediately, the transient service unit will be started when the transient timer elapses. If the --unit= is specified, the COMMAND may be omitted. In this case, systemd-run only
       creates a .timer unit that invokes the specified unit when elapsing.

OPTIONS
       The following options are understood:

       --no-ask-password
           Do not query the user for authentication for privileged operations.

       --scope
           Create a transient .scope unit instead of the default transient .service unit.

       --unit=
           Use this unit name instead of an automatically generated one.

       --property=, -p
           Sets a unit property for the scope or service unit that is created. This takes an assignment in the same format as systemctl(1)'s set-property command.

       --description=
           Provide a description for the service or scope unit. If not specified, the command itself will be used as a description. See Description= in systemd.unit(5).

       --slice=
           Make the new .service or .scope unit part of the specified slice, instead of the system.slice.

       --remain-after-exit
           After the service or scope process has terminated, keep the service around until it is explicitly stopped. This is useful to collect runtime information about the service after it finished
           running. Also see RemainAfterExit= in systemd.service(5).

       --send-sighup
           When terminating the scope or service unit, send a SIGHUP immediately after SIGTERM. This is useful to indicate to shells and shell-like processes that the connection has been severed. Also
           see SendSIGHUP= in systemd.kill(5).

       --service-type=
           Sets the service type. Also see Type= in systemd.service(5). This option has no effect in conjunction with --scope. Defaults to simple.

       --uid=, --gid=
           Runs the service process under the UNIX user and group. Also see User= and Group= in systemd.exec(5).

       --nice=
           Runs the service process with the specified nice level. Also see Nice= in systemd.exec(5).

       --setenv=
           Runs the service process with the specified environment variables set. Also see Environment= in systemd.exec(5).

       --pty, -t
           When invoking a command, the service connects its standard input and output to the invoking tty via a pseudo TTY device. This allows invoking binaries as services that expect interactive
           user input, such as interactive command shells.

       --quiet, -q
           Suppresses additional informational output while running. This is particularly useful in combination with --pty when it will suppress the initial message explaining how to terminate the TTY
           connection.

       --on-active=, --on-boot=, --on-startup=, --on-unit-active=, --on-unit-inactive=
           Defines monotonic timers relative to different starting points. Also see OnActiveSec=, OnBootSec=, OnStartupSec=, OnUnitActiveSec= and OnUnitInactiveSec= in systemd.timer(5). This options
           have no effect in conjunction with --scope.

       --on-calendar=
           Defines realtime (i.e. wallclock) timers with calendar event expressions. Also see OnCalendar= in systemd.timer(5). This option has no effect in conjunction with --scope.

       --timer-property=
           Sets a timer unit property for the timer unit that is created. It is similar with --property but only for created timer unit. This option only has effect in conjunction with --on-active=,
           --on-boot=, --on-startup=, --on-unit-active=, --on-unit-inactive=, --on-calendar=. This takes an assignment in the same format as systemctl(1)'s set-property command.

       --no-block
           Do not synchronously wait for the requested operation to finish. If this is not specified, the job will be verified, enqueued and systemd-run will wait until the unit's start-up is
           completed. By passing this argument, it is only verified and enqueued.

       --user
           Talk to the service manager of the calling user, rather than the service manager of the system.

       --system
           Talk to the service manager of the system. This is the implied default.

       -H, --host=
           Execute the operation remotely. Specify a hostname, or a username and hostname separated by "@", to connect to. The hostname may optionally be suffixed by a container name, separated by ":",
           which connects directly to a specific container on the specified host. This will use SSH to talk to the remote machine manager instance. Container names may be enumerated with machinectl -H
           HOST.

       -M, --machine=
           Execute operation on a local container. Specify a container name to connect to.

       -h, --help
           Print a short help text and exit.

       --version
           Print a short version string and exit.

       All command line arguments after the first non-option argument become part of the command line of the launched process. If a command is run as service unit, its first argument needs to be an
       absolute binary path.

EXIT STATUS
       On success, 0 is returned, a non-zero failure code otherwise.

EXAMPLES
       The following command will log the environment variables provided by systemd to services:

           # systemd-run env
           Running as unit run-19945.service.
           # journalctl -u run-19945.service
           Sep 08 07:37:21 bupkis systemd[1]: Starting /usr/bin/env...
           Sep 08 07:37:21 bupkis systemd[1]: Started /usr/bin/env.
           Sep 08 07:37:21 bupkis env[19948]: PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin
           Sep 08 07:37:21 bupkis env[19948]: LANG=en_US.UTF-8
           Sep 08 07:37:21 bupkis env[19948]: BOOT_IMAGE=/vmlinuz-3.11.0-0.rc5.git6.2.fc20.x86_64

       The following command invokes the updatedb(8) tool, but lowers the block I/O weight for it to 10. See systemd.resource-control(5) for more information on the BlockIOWeight= property.

           # systemd-run -p BlockIOWeight=10 updatedb

       The following command will touch a file after 30 seconds.

           # date; systemd-run --on-active=30 --timer-property=AccuracySec=100ms /bin/touch /tmp/foo
           Mon Dec  8 20:44:24 KST 2014
           Running as unit run-71.timer.
           Will run as unit run-71.service.
           # journalctl -b -u run-71.timer
           -- Logs begin at Fri 2014-12-05 19:09:21 KST, end at Mon 2014-12-08 20:44:54 KST. --
           Dec 08 20:44:38 container systemd[1]: Starting /bin/touch /tmp/foo.
           Dec 08 20:44:38 container systemd[1]: Started /bin/touch /tmp/foo.
           # journalctl -b -u run-71.service
           -- Logs begin at Fri 2014-12-05 19:09:21 KST, end at Mon 2014-12-08 20:44:54 KST. --
           Dec 08 20:44:48 container systemd[1]: Starting /bin/touch /tmp/foo...
           Dec 08 20:44:48 container systemd[1]: Started /bin/touch /tmp/foo.

       The following command invokes /bin/bash as a service passing its standard input, output and error to the calling TTY.

           # systemd-run -t --send-sighup /bin/bash

SEE ALSO
       systemd(1), systemctl(1), systemd.unit(5), systemd.service(5), systemd.scope(5), systemd.slice(5), systemd.exec(5), systemd.resource-control(5), systemd.timer(5), machinectl(1)

systemd 229                                                                                                                                                                                SYSTEMD-RUN(1)
