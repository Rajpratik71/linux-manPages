GLIB-GETTEXTIZE(1)                           User Commands                          GLIB-GETTEXTIZE(1)

NAME
       glib-gettextize - gettext internationalization utility

SYNOPSIS
       glib-gettextize [OPTION...] [DIRECTORY]

DESCRIPTION
       glib-gettextize helps to prepare a source package for being internationalized through gettext.
       It is a variant of the gettextize that ships with gettext.

       glib-gettextize differs from gettextize in that it doesn't create an intl/ subdirectory and
       doesn't modify po/ChangeLog (note that newer versions of gettextize behave like this when
       called with the --no-changelog option).

OPTIONS
       --help
           print help and exit

       --version
           print version information and exit

       -c, --copy
           copy files instead of making symlinks

       -f, --force
           force writing of new files even if old ones exist

SEE ALSO
       gettextize(1)

GLib                                                                                GLIB-GETTEXTIZE(1)
