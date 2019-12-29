GSETTINGS-DATA-CON(1)                        User Commands                       GSETTINGS-DATA-CON(1)

NAME
       gsettings-data-convert - GConf to GSettings data migration

SYNOPSIS
       gsettings-data-convert [option...]

DESCRIPTION
       gsettings-data-convert reads values out of the users GConf database and stores them in
       GSettings.

       The information about the mapping from GConf keys to GSettings keys is taken from files in
       /usr/share/GConf/gsettings. Each file in that directory is read as a key file, with sections
       for each GSettings schema that is being converted. The entries in each section map GSettings
       keys to paths in the GConf database. Currently, gsettings-data-convert supports all basic GConf
       types as well as lists of strings and lists of integers.

       A simple example might look like this:

           [org.gnome.fonts]
           antialiasing = /desktop/gnome/font_rendering/antialiasing
           dpi = /desktop/gnome/font_rendering/dpi
           hinting = /desktop/gnome/font_rendering/hinting
           rgba_order = /desktop/gnome/font_rendering/rgba_order

       If the GSettings schema does not have a fixed path, you must specify the path in the group
       name, separated by a colon character:

           [org.gnome.fonts:/desktop/gnome/font-rendering/]

       gsettings-data-convert keeps a list of the key files it has already converted, so it is safe to
       run it repeatedly to handle newly appeared key files. The expected use of this utility is to
       make each application install a key file for the GConf keys that it wants to be migrated, and
       run gsettings-data-convert every time a user logs in.

   Options
       -h, --help
           Print help and exit

       --dry-run
           Do not make any changes, just report what would be done

       --verbose
           Show verbose messages

SEE ALSO
       gsettings-schema-convert(1) is a related command that helps with the conversion of schemas from
       GConf to GSettings.

User Commands                                 01/21/2013                         GSETTINGS-DATA-CON(1)
