XDG-SETTINGS(1)                                                 xdg-settings Manual                                                XDG-SETTINGS(1)

NAME
       xdg-settings - get various settings from the desktop environment

SYNOPSIS
       xdg-settings {get | check | set} {property} [subproperty] [value]

       xdg-settings {--help | --list | --manual | --version}

DESCRIPTION
       xdg-settings gets various settings from the desktop environment. For instance, desktop environments often provide proxy configuration and
       default web browser settings. Using xdg-settings these parameters can be extracted for use by applications that do not use the desktop
       environment's libraries (which would use the settings natively).

       xdg-settings is for use inside a desktop session only. It is not recommended to use xdg-settings as root.

OPTIONS
       --help
           Show command synopsis.

       --list
           List all properties xdg-settings knows about.

       --manual
           Show this manual page.

       --version
           Show the xdg-utils version information.

PROPERTIES
       When using xdg-settings to get, check or set a destkop setting, properties and possibly sub-properties are used to specify the setting to
       be changed.

       Some properties (such as default-web-browser) fully describe the setting to be changed. Other properties (such as
       default-url-scheme-handler) require more information (in this case the actual scheme to set the default handler for) which must be provided
       in a sub-property.

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

SEE ALSO
       xdg-mime(1), xdg-open(1), MIME applications associations specification[1]

EXAMPLES
       Get the desktop file name of the current default web browser

                   xdg-settings get default-web-browser

       Check whether the default web browser is firefox.desktop, which can be false even if "get default-web-browser" says that is the current
       value (if only some of the underlying settings actually reflect that value)

                   xdg-settings check default-web-browser firefox.desktop

       Set the default web browser to google-chrome.desktop

                   xdg-settings set default-web-browser google-chrome.desktop

       Set the default mailto URL scheme handler to be evolution.desktop

                   xdg-settings set default-url-scheme-handler mailto evolution.desktop

AUTHOR
       Mike Mammarella
           Author.

COPYRIGHT
       Copyright © 2009-2011

NOTES
        1. MIME applications associations specification
           http://www.freedesktop.org/wiki/Specifications/mime-apps-spec/

xdg-utils 1.1.0                                                     05/21/2018                                                     XDG-SETTINGS(1)
