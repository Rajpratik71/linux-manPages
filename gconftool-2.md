GCONFTOOL-2(1)                                                                                User Commands                                                                                GCONFTOOL-2(1)

NAME
       gconftool-2 - GNOME configuration tool

SYNOPSIS
       gconftool-2  [-?]  [-?|--help]  [--usage]  [-s|--set]  [-g|--get]  [--set-schema]  [-u|--unset] [--recursive-unset] [-a|--all-entries] [--all-dirs] [--dump] [--load=STRING] [-R|--recursive-list]
       [--dir-exists=STRING] [--shutdown] [-p|--ping] [--spawn] [-t|--type int|bool|float|string|list|pair] [-T|--get-type]  [--get-list-size]  [--get-list-element]  [--list-type=int|bool|float|string]
       [--car-type=int|bool|float|string]    [--cdr-type=int|bool|float|string]    [--short-desc=DESCRIPTION]    [--long-desc=DESCRIPTION]   [--owner=OWNER]   [--install-schema-file=FILENAME]   [--con‐
       fig-source=SOURCE] [--direct] [--makefile-install-rule] [--makefile-uninstall-rule] [--break-key] [--break-directory] [--short-docs] [--long-docs] [--get-schema-name]  [--apply-schema]  [--unap‐
       ply-schema] [--get-default-source] [-v|--version]

DESCRIPTION
       Each  preference in the GConf repository is expressed as a key-value pair. A GConf preference key is an element in the GConf repository that corresponds to an application preference.  Preference
       keys typically have simple values such as strings, integers, or lists of strings and integers. The default key-value pairs are installed on the system, and are known as schemas.  gconftool-2  is
       the  command-line  interface  tool  that  enables you to set the values of keys, display the values of keys, and install schemas from schema definition files when you install an application. The
       GConf preference keys are stored and managed by the GConf daemon (gconfd-2).  These keys are cached in memory, and saved to disk in XML format when appropriate.

OPTIONS
       -s, --set
              Set a key to a value and sync. Use with --type.

       -g, --get
              Print the value of a key to standard output.

       -u, --unset
              Unset the keys on the command line.

       --recursive-unset
              Recursively unset all keys at or below the key/directory names on the command line.

       -a, --all-entries
              Print all key/value pairs in a directory.

       --all-dirs
              Print all subdirectories in a directory.

       -R, --recursive-list
              Print all subdirectories and entries under a dir, recursively.

       --dir-exists=STRING
              Return 0 if the directory exists, 2 if it does not.

       -t, --type=int|bool|float|string|list|pair
              Specify the type of the value being set, or the type of the value a schema describes. Unique abbreviations are allowed.

       --list-type=int|bool|float|string
              Specify the type of the list value being set, or the type of the value a schema describes. Unique abbreviations are allowed.

       --car-type=int|bool|float|string
              Specify the type of the car pair value being set, or the type of the value a schema describes. Unique abbreviations are allowed.

       --cdr-type=int|bool|float|string
              Specify the type of the cdr pair value being set, or the type of the value a schema describes. Unique abbreviations are allowed.

       --short-desc=DESCRIPTION
              Specify a short half-line description to go in a schema.

       --long-desc=DESCRIPTION
              Specify a several-line description to go in a schema.

       --owner=OWNER
              Specify the owner of a schema.

       --install-schema-file=FILENAME
              Specify a schema file to be installed

       --config-source=SOURCE
              Specify a configuration source to use rather than the default path

       --direct
              Access the config database directly, bypassing server. Requires that gconfd is not running.

       --set-schema
              Set a schema and sync. Use with --short-desc, --long-desc, --owner, and --type.

       --makefile-install-rule
              Properly installs schema files on the command line into the database. GCONF_CONFIG_SOURCE environment variable should be set to a non-default config source or set to the empty  string  to
              use the default.

       --break-key
              Torture-test an application by setting and unsetting a bunch of values of different types for keys on the command line.

       --break-directory
              Torture-test an application by setting and unsetting a bunch of keys inside the directories on the command line.

       --short-docs
              Get the short doc string for a key

       --long-docs
              Get the long doc string for a key

       --get-schema-name
              Get the name of the schema applied to this key

       --apply-schema
              Specify the schema name followed by the key to apply the schema name to

       --unapply-schema
              Remove any schema name applied to the given keys

       --get-default-source
              Get the name of the default source.

       --shutdown
              Shut down gconfd. Don't use this option without good reason.

       -p, --ping
              Return 0 if gconfd is running, 2 if not.

       --spawn
              Launch the config server (gconfd). (Normally happens automatically when needed.)

       -v, --version
              Print version

       Help options

       -?, --help
              Show the help message.

EXAMPLES
       Display the path to the current desktop wallpaper.

              gconftool-2 --get /desktop/gnome/background/picture_filename

       Change the widget font to "Serif 12"

              gconftool-2 --type string --set /desktop/gnome/interface/font_name "Serif 12"

AUTHOR
       GConf was written by Havoc Pennington <hp@redhat.com>.

SEE ALSO
       The GConf web site, http://www.gnome.org/projects/gconf/.

gconftool-2 2.2.1                                                                             February 2006                                                                                GCONFTOOL-2(1)
