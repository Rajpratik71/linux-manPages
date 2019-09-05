ALSACONF(8)                                                                                System Manager's Manual                                                                                ALSACONF(8)



NAME
       alsaconf - configuration tool for the Advanced Linux Sound Architecture


SYNOPSIS
       alsaconf [options]


DESCRIPTION
       This manual page documents briefly the alsaconf command.  This manual page was written for the Debian distribution because the original program does not have a manual page.

       Alsaconf is a simple shell script which tries to detect the sound cards on your system and writes a suitable configuration file for ALSA. It will try to guess what GNU/Linux distribution you're run-
       ning, and will act accordingly to the standards of that distribution, if specific support is available.

       Alsaconf will write a module-init-tools (or modutils) snippet which can be then used by module-init-tools (or modutils) to load the correct parameters for your sound card.


OPTIONS
       Alsaconf accepts the following options:

       -c, --config file
              Specify the module config file.  As default, alsaconf probes the available config file automatically.

       -d, --devmode mode
              Set the device mode for the ALSA devices (default = 0666).  This option is obsolete in the recent ALSA version.

       -g, --gid gid
              Set the gid for the ALSA devices (default = 0).  This option is obsolete in the recent ALSA version.

       -h, --help
              Displays this help text.

       -L, --log file
              Logging on the given file.  The log is appended to the file.  This option is for debugging purpose only.

       -l, --legacy
              Check only for legacy non-isapnp cards.

       -m, --modinfo
              Read module descriptions instead of reading a card database.

       -P, --listprobe
              List the supported legacy card modules.

       -p, --probe card-name
              Probe a legacy non-isapnp card and print module options.

       -r, --strict
              Set strict device mode (equiv. with -g 17 -d 0660).  This option is obsolete in the recent ALSA version.

       -s, --sound-wav-file
              Use the specified wav file as a test sound.

       -u, --uid uid
              Set the uid for the ALSA devices (default = 0).  This option is obsolete in the recent ALSA version.


DEBIAN SPECIFIC
       In Debian, the default gid of the device files is 29 (corresponding to the audio group) and the default device mode is 0660.

       For the ALSA base package, see also /usr/share/doc/alsa-base/


SEE ALSO
        alsamixer(1), amixer(1), aplay(1), arecord(1)


HOMEPAGE
       http://www.alsa-project.org/


AUTHOR
       The alsaconf script was written by Takashi Iwai <tiwai@suse.de>, Bernd Kaindl <bk@suse.de> and Jan Ondrej (SAL) <ondrejj@salstar.sk>

       This manual page was written by Jordi Mallach <jordi@debian.org>, for the Debian system (but may be used by others).



                                                                                              February 23, 2003                                                                                   ALSACONF(8)
