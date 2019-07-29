XDG-ICON-RESOURCE(1)                                         xdg-icon-resource Manual                                         XDG-ICON-RESOURCE(1)

NAME
       xdg-icon-resource - command line tool for (un)installing icon resources

SYNOPSIS
       xdg-icon-resource install [--noupdate] [--novendor] [--theme theme] [--context context] [--mode mode] --size size icon-file [icon-name]

       xdg-icon-resource uninstall [--noupdate] [--theme theme] [--context context] [--mode mode] --size size icon-name

       xdg-icon-resource forceupdate [--theme theme] [--mode mode]

       xdg-icon-resource {--help | --manual | --version}

DESCRIPTION
       The xdg-icon-resource program can be used to install icon resources into the desktop icon system in order to illustrate menu entries, to
       depict desktop icons or to graphically represent file types.

       The desktop icon system identifies icons by name. Depending on the required size, the choice of icon theme and the context in which the
       icon is used, the desktop icon system locates an appropriate icon resource to depict an icon. Icon resources can be XPM files or PNG files.

       The desktop icon system works according to the XDG Icon Theme Specification at
       http://www.freedesktop.org/wiki/Specifications/icon-theme-spec

COMMANDS
       install
           Installs the icon file indicated by icon-file to the desktop icon system under the name icon-name. Icon names do not have an extension.
           If icon-name is not provided the name is derived from icon-file. The icon file must have .png or .xpm as extension. If a corresponding
           .icon file exists in the same location as icon-file it will be installed as well.

       uninstall
           Removes the icon indicated by icon-name from the desktop icon system. Note that icon names do not have an extension.

       forceupdate
           Force an update of the desktop icon system. This is only useful if the last call to xdg-icon-resource included the --noupdate option.

OPTIONS
       --noupdate
           Postpone updating the desktop icon system. If multiple icons are added in sequence this flag can be used to indicate that additional
           changes will follow and that it is not necessary to update the desktop icon system right away.

       --novendor
           Normally, xdg-icon-resource checks to ensure that an icon file to be installed in the apps context has a proper vendor prefix. This
           option can be used to disable that check.

           A vendor prefix consists of alpha characters ([a-zA-Z]) and is terminated with a dash ("-"). Companies and organizations are encouraged
           to use a word or phrase, preferably the organizations name, for which they hold a trademark as their vendor prefix. The purpose of the
           vendor prefix is to prevent name conflicts.

       --theme theme
           Installs or removes the icon file as part of theme. If no theme is specified the icons will be installed as part of the default hicolor
           theme. Applications may install icons under multiple themes but should at least install icons for the default hicolor theme.

       --context context
           Specifies the context for the icon. Icons to be used in the application menu and as desktop icon should use apps as context which is
           the default context. Icons to be used as file icons should use mimetypes as context. Other common contexts are actions, devices,
           emblems, filesystems and stock.

       --size size
           Specifies the size of the icon. All icons must be square. Common sizes for icons in the apps context are: 16, 22, 32, 48, 64 and 128.
           Common sizes for icons in the mimetypes context are: 16, 22, 32, 48, 64 and 128

       --mode mode
           mode can be user or system. In user mode the file is (un)installed for the current user only. In system mode the file is (un)installed
           for all users on the system. Usually only root is allowed to install in system mode.

           The default is to use system mode when called by root and to use user mode when called by a non-root user.

       --help
           Show command synopsis.

       --manual
           Show this manual page.

       --version
           Show the xdg-utils version information.

ENVIRONMENT VARIABLES
       xdg-icon-resource honours the following environment variables:

       XDG_UTILS_DEBUG_LEVEL
           Setting this environment variable to a non-zero numerical value makes xdg-icon-resource do more verbose reporting on stderr. Setting a
           higher value increases the verbosity.

       XDG_UTILS_INSTALL_MODE
           This environment variable can be used by the user or administrator to override the installation mode. Valid values are user and system.

EXIT CODES
       An exit code of 0 indicates success while a non-zero exit code indicates failure. The following failure codes can be returned:

       1
           Error in command line syntax.

       2
           One of the files passed on the command line did not exist.

       3
           A required tool could not be found.

       4
           The action failed.

       5
           No permission to read one of the files passed on the command line.

SEE ALSO
       xdg-desktop-icon(1), xdg-desktop-menu(1), xdg-mime(1), Icon theme specification[1]

EXAMPLES
       To install an icon resource to depict a launcher for the application myfoobar, the company ShinyThings Inc. can use:

           xdg-icon-resource install --size 64 shinythings-myfoobar.png

       To install an icon for a new application/x-foobar file type one can use:

           xdg-icon-resource install --context mimetypes --size 48 ./mime-foobar-48.png application-x-foobar
           xdg-icon-resource install --context mimetypes --size 64 ./mime-foobar-64.png application-x-foobar

       This will install two icons with the name application-x-foobar but with different sizes.

AUTHORS
       Kevin Krammer
           Author.

       Jeremy White
           Author.

COPYRIGHT
       Copyright © 2006

NOTES
        1. Icon theme specification
           http://www.freedesktop.org/wiki/Specifications/icon-theme-spec/

xdg-utils 1.0                                                       05/21/2018                                                XDG-ICON-RESOURCE(1)
