ALSACTL(1)                                                    General Commands Manual                                                   ALSACTL(1)

NAME
       alsactl - advanced controls for ALSA soundcard driver

SYNOPSIS
       alsactl [options] [store|restore|init] <card # or id or device>

       alsactl monitor <card # or id>

DESCRIPTION
       alsactl  is  used  to  control advanced settings for the ALSA soundcard drivers. It supports multiple soundcards. If your card has features
       that you can't seem to control from a mixer application, you have come to the right place.

COMMANDS
       store saves the current driver state for the selected soundcard to the configuration file.

       restore loads driver state for the selected soundcard from the configuration file. If restoring fails (eventually partly), the init  action
       is called.

       nrestore is like restore, but it notifies also the daemon to do new rescan for available soundcards.

       init tries to initialize all devices to a default state. If device is not known, error code 99 is returned.

       daemon manages to save periodically the sound state.

       rdaemon like daemon but restore the sound state at first.

       kill notifies the daemon to do the specified operation (quit, rescan, save_and_quit).

       monitor is for monitoring the events received from the given control device.

       If no soundcards are specified, setup for all cards will be saved, loaded or monitored.

OPTIONS
       -h, --help
              Help: show available flags and commands.

       -d, --debug
              Use debug mode: a bit more verbose.

       -v, --version
              Print alsactl version number.

       -f, --file
              Select the configuration file to use. The default is /var/lib/alsa/asound.state.

       -l, --lock
              Use the file locking to serialize the concurrent access to the state file (this option is default for the global state file).

       -L, --no-lock
              Do not use the file locking to serialize the concurrent access to the state file (including the global state file).

       -O, --lock-state-file
              Select the state lock file path.

       -F, --force
              Used with restore command.  Try to restore the matching control elements as much as possible.  This option is set as default now.

       -g, --ignore
              Used  with  store  and restore commands. Do not show 'No soundcards found' and do not set an error exit code when soundcards are not
              installed.

       -P, --pedantic
              Used with restore command.  Don't restore mismatching control elements.  This option was the old default behavior.

       -I, --no-init-fallback
              Don't initialize cards if restore fails.  Since version 1.0.18, alsactl tries to initialize the card with the restore  operation  as
              default.   But  this  can cause incompatibility with the older version.  The caller may expect that the state won't be touched if no
              state file exists.  This option takes the restore behavior back to the older version by suppressing the initialization.

       -r, --runstate
              Save restore and init state to this file. The file will contain only errors.  Errors are appended with the soundcard id to  the  end
              of file.

       -R, --remove
              Remove runstate file at first.

       -E, --env #=#
              Set environment variable (useful for init action or you may override ALSA_CONFIG_PATH to read different or optimized configuration -
              may be useful for "boot" scripts).

       -i, --initfile
              The configuration file for init. By default, PREFIX/share/alsa/init/00main is used.

       -p, --period
              The store period in seconds for the daemon command.

       -e, --pid-file
              The pathname to store the process-id file in the HDB UUCP format (ASCII).

       -b, --background
              Run the task in background.

       -s, --syslog
              Use syslog for messages.

       -n, --nice
              Set the process priority (see 'man nice')

       -c, --sched-idle
              Set the process scheduling policy to idle (SCHED_IDLE).

FILES
       /var/lib/alsa/asound.state (or whatever file you specify with the -f flag) is used to store current settings for your soundcards. The  set‐
       tings  include  all  the  usual soundcard mixer settings.  More importantly, alsactl is capable of controlling other card-specific features
       that mixer apps usually don't know about.

       The configuration file is generated automatically by running alsactl store. Editing the configuration file by hand  may  be  necessary  for
       some soundcard features (e.g. enabling/disabling automatic mic gain, digital output, joystick/game ports, some future MIDI routing options,
       etc).

SEE ALSO
        amixer(1), alsamixer(1), aplay(1), alsactl_init(7)

BUGS
       None known.

AUTHOR
       alsactl is  by  Jaroslav  Kysela  <perex@perex.cz>  and  Abramo  Bagnara  <abramo@alsa-project.org>.  This  document  is  by  Paul  Winkler
       <zarmzarm@erols.com>.

                                                                    07 May 2014                                                         ALSACTL(1)
