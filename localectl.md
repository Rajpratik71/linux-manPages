LOCALECTL(1)                      localectl                      LOCALECTL(1)

NAME
       localectl - Control the system locale and keyboard layout settings

SYNOPSIS
       localectl [OPTIONS...] {COMMAND}

DESCRIPTION
       localectl may be used to query and change the system locale and
       keyboard layout settings. It communicates with systemd-localed(8) to
       modify files such as /etc/locale.conf and /etc/vconsole.conf.

       The system locale controls the language settings of system services
       and of the UI before the user logs in, such as the display manager, as
       well as the default for users after login.

       The keyboard settings control the keyboard layout used on the text
       console and of the graphical UI before the user logs in, such as the
       display manager, as well as the default for users after login.

       Note that the changes performed using this tool might require the
       initramfs to be rebuilt to take effect during early system boot. The
       initramfs is not rebuilt automatically by localectl.

       Note that systemd-firstboot(1) may be used to initialize the system
       locale for mounted (but not booted) system images.

OPTIONS
       The following options are understood:

       --no-ask-password
           Do not query the user for authentication for privileged
           operations.

       --no-convert
           If set-keymap or set-x11-keymap is invoked and this option is
           passed, then the keymap will not be converted from the console to
           X11, or X11 to console, respectively.

       -H, --host=
           Execute the operation remotely. Specify a hostname, or a username
           and hostname separated by "@", to connect to. The hostname may
           optionally be suffixed by a container name, separated by ":",
           which connects directly to a specific container on the specified
           host. This will use SSH to talk to the remote machine manager
           instance. Container names may be enumerated with machinectl -H
           HOST.

       -M, --machine=
           Execute operation on a local container. Specify a container name
           to connect to.

       -h, --help
           Print a short help text and exit.

       --version
           Print a short version string and exit.

       --no-pager
           Do not pipe output into a pager.

       The following commands are understood:

       status
           Show current settings of the system locale and keyboard mapping.

       set-locale LOCALE...
           Set the system locale. This takes one or more assignments such as
           "LANG=de_DE.utf8", "LC_MESSAGES=en_GB.utf8", and so on. See
           locale(7) for details on the available settings and their
           meanings. Use list-locales for a list of available locales (see
           below).

       list-locales
           List available locales useful for configuration with set-locale.

       set-keymap MAP [TOGGLEMAP]
           Set the system keyboard mapping for the console and X11. This
           takes a mapping name (such as "de" or "us"), and possibly a second
           one to define a toggle keyboard mapping. Unless --no-convert is
           passed, the selected setting is also applied as the default system
           keyboard mapping of X11, after converting it to the closest
           matching X11 keyboard mapping. Use list-keymaps for a list of
           available keyboard mappings (see below).

       list-keymaps
           List available keyboard mappings for the console, useful for
           configuration with set-keymap.

       set-x11-keymap LAYOUT [MODEL [VARIANT [OPTIONS]]]
           Set the system default keyboard mapping for X11 and the virtual
           console. This takes a keyboard mapping name (such as "de" or
           "us"), and possibly a model, variant, and options, see kbd(4) for
           details. Unless --no-convert is passed, the selected setting is
           also applied as the system console keyboard mapping, after
           converting it to the closest matching console keyboard mapping.

       list-x11-keymap-models, list-x11-keymap-layouts,
       list-x11-keymap-variants [LAYOUT], list-x11-keymap-options
           List available X11 keymap models, layouts, variants and options,
           useful for configuration with set-keymap. The command
           list-x11-keymap-variants optionally takes a layout parameter to
           limit the output to the variants suitable for the specific layout.

EXIT STATUS
       On success, 0 is returned, a non-zero failure code otherwise.

ENVIRONMENT
       $SYSTEMD_PAGER
           Pager to use when --no-pager is not given; overrides $PAGER. If
           neither $SYSTEMD_PAGER nor $PAGER are set, a set of well-known
           pager implementations are tried in turn, including less(1) and
           more(1), until one is found. If no pager implementation is
           discovered no pager is invoked. Setting this environment variable
           to an empty string or the value "cat" is equivalent to passing
           --no-pager.

       $SYSTEMD_LESS
           Override the options passed to less (by default "FRSXMK").

       $SYSTEMD_LESSCHARSET
           Override the charset passed to less (by default "utf-8", if the
           invoking terminal is determined to be UTF-8 compatible).

SEE ALSO
       systemd(1), locale(7), locale.conf(5), vconsole.conf(5), loadkeys(1),
       kbd(4), The XKB Configuration Guide[1], systemctl(1), systemd-
       localed.service(8), systemd-firstboot(1), mkinitrd(8)

NOTES
        1. The XKB Configuration Guide
           http://www.x.org/releases/current/doc/xorg-docs/input/XKB-Config.html

systemd 237                                                      LOCALECTL(1)
