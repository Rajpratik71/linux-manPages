MASON-GUI-TEXT(1)                                                                                                                MASON-GUI-TEXT(1)

NAME
       mason-gui-text - front end to mason

SYNOPSIS
       mason-gui-text [--force]

DESCRIPTION
       mason-gui-text  is  a "textual GUI" front end to mason, the interactive firewall builder.  When it is run, it allows you to control mason's
       behavior through simple keystroke commands.  It can start and stop mason, allow you to edit the rules generated (and re-merge them into the
       currently running rule set), and change mason's settings.  It also has a "console lock" setting for locking the console down if necessary.

OPTIONS
       Default behaviour of mason-gui-text ist to exit if another instance of it is already running.

       --force
              Try to stop other instances of mason-gui-text and continue running

SEE ALSO
       mason(1)

AUTHOR
       This  manual  page was written by Jeff Licquia <jeff@luci.org> for the Debian GNU/Linux system (but may be used by others) and supplemented
       by Thomas Scheffczyk <scheffczyk@debian.org>.

                                                                                                                                 MASON-GUI-TEXT(1)
