XDG-DESKTOP-ICON(1)                     xdg-desktop-icon Manual                    XDG-DESKTOP-ICON(1)

NAME
       xdg-desktop-icon - command line tool for (un)installing icons to the desktop

SYNOPSIS
       xdg-desktop-icon install [--novendor] FILE

       xdg-desktop-icon uninstall FILE

       xdg-desktop-icon {--help | --manual | --version}

DESCRIPTION
       The xdg-desktop-icon program can be used to install an application launcher or other file on
       the desktop of the current user.

       An application launcher is represented by a *.desktop file. Desktop files are defined by the
       freedesktop.org Desktop Entry Specification. The most important aspects of *.desktop files are
       summarized below.

COMMANDS
       install
           Installs FILE to the desktop of the current user.  FILE can be a *.desktop file or any
           other type of file.

       uninstall
           Removes FILE from the desktop of the current user.

OPTIONS
       --novendor
           Normally, xdg-desktop-icon checks to ensure that a *.desktop file to be installed has a
           vendor prefix. This option can be used to disable that check.

           A vendor prefix consists of alpha characters ([a-zA-Z]) and is terminated with a dash
           ("-"). Companies and organizations are encouraged to use a word or phrase, preferably the
           organizations name, for which they hold a trademark as their vendor prefix. The purpose of
           the vendor prefix is to prevent name conflicts.

       --help
           Show command synopsis.

       --manual
           Show this manual page.

       --version
           Show the xdg-utils version information.

DESKTOP FILES
       An application launcher can be added to the desktop by installing a *.desktop file. A *.desktop
       file consists of a [Desktop Entry] header followed by several Key=Value lines.

       A *.desktop file can provide a name and description for an application in several different
       languages. This is done by adding a language code as used by LC_MESSAGES in square brackets
       behind the Key. This way one can specify different values for the same Key depending on the
       currently selected language.

       The following keys are often used:

       Type=Application
           This is a mandatory field that indicates that the *.desktop file describes an application
           launcher.

       Name=Application Name
           The name of the application. For example Mozilla

       GenericName=Generic Name
           A generic description of the application. For example Web Browser

       Comment=Comment
           Optional field to specify a tooltip for the application. For example Visit websites on the
           Internet

       Icon=Icon File
           The icon to use for the application. This can either be an absolute path to an image file
           or an icon-name. If an icon-name is provided an image lookup by name is done in the user's
           current icon theme. The xdg-icon-resource command can be used to install image files into
           icon themes. The advantage of using an icon-name instead of an absolute path is that with
           an icon-name the application icon can be provided in several different sizes as well as in
           several differently themed styles.

       Exec=Command Line
           The command line to start the application. If the application can open files the %f
           placeholder should be specified. When a file is dropped on the application launcher the %f
           is replaced with the file path of the dropped file. If multiple files can be specified on
           the command line the %F placeholder should be used instead of %f. If the application is
           able to open URLs in addition to local files then %u or %U can be used instead of %f or %F.

       For a complete overview of the *.desktop file format please visit
       http://www.freedesktop.org/wiki/Specifications/desktop-entry-spec

ENVIRONMENT VARIABLES
       xdg-desktop-icon honours the following environment variables:

       XDG_UTILS_DEBUG_LEVEL
           Setting this environment variable to a non-zero numerical value makes xdg-desktop-icon do
           more verbose reporting on stderr. Setting a higher value increases the verbosity.

EXIT CODES
       An exit code of 0 indicates success while a non-zero exit code indicates failure. The following
       failure codes can be returned:

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
       xdg-icon-resource(1)

EXAMPLES
       The company ShinyThings Inc. has developed an application named "WebMirror" and would like to
       add a launcher for for on the desktop. The company will use "shinythings" as its vendor id. In
       order to add the application to the desktop there needs to be a .desktop file for the
       application:

           shinythings-webmirror.desktop:

             [Desktop Entry]
             Encoding=UTF-8
             Type=Application

             Exec=webmirror
             Icon=shinythings-webmirror

             Name=WebMirror
             Name[nl]=WebSpiegel

       Now the xdg-desktop-icon tool can be used to add the webmirror.desktop file to the desktop:

           xdg-desktop-icon install ./shinythings-webmirror.desktop

       To add a README file to the desktop as well, the following command can be used:

           xdg-desktop-icon install ./shinythings-README

AUTHORS
       Kevin Krammer
           Author.

       Jeremy White
           Author.

COPYRIGHT
       Copyright © 2006

xdg-utils 1.0                                 10/02/2018                           XDG-DESKTOP-ICON(1)
