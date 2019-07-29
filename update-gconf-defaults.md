UPDATE-GCONF-DEFAULTS(8)                                      System Manager's Manual                                     UPDATE-GCONF-DEFAULTS(8)

NAME
       update-gconf-defaults - generate GConf defaults shipped in Debian packages

SYNOPSIS
       update-gconf-defaults [options]

DESCRIPTION
       This manual page documents briefly the update-gconf-defaults command.

       update-gconf-defaults is responsible for generating defaults used by GConf from the files found in /usr/share/gconf/defaults.

       The syntax of files in this directory consists in lines containing the key name, some white space, and the key value, which can be an inte‐
       ger, a boolean, a float, a string or a list of strings. Example:

       /apps/myprogram/frob_number     42
       /apps/myprogram/do_foo          true
       /apps/myprogram/priority        1.25
       /apps/myprogram/name            "Gotcha !"
       /apps/myprogram/names           [Ha ha!,Let's keep serious,Ho ho!]

       Files are processed in alphabetical order. Files processed later take precedence over the previous ones if they include the same  defaults.
       Thus, it is recommended to name them NN_package with NN being a 2-digit number and package the package name. It is recommended to set NN as
       10 for packages in the Debian archive, 20 for derived distributions, 50 for CDD distributions, and 90 for site-specific packages.

OPTIONS
       --source source_dir
              Specify an alternate source directory where to find the defaults.

       --destination destination_dir
              Specify an alternate destination directory where to build the resulting GConf tree.

       --mandatory
              Sets source and destination directories appropriate for the mandatory values.

FILES
       /usr/share/gconf/defaults/
              The directory from which defaults files are read.

       /usr/share/gconf/mandatory/
              The directory from which defaults files for mandatory settings are read.

       /var/lib/gconf/debian.defaults
              The directory where the GConf tree for default settings is generated. It is read by GConf with the default Debian configuration, and
              it takes precedence over upstream defaults.

       /var/lib/gconf/debian.mandatory
              The  directory  where the GConf tree for mandatory settings is generated. It is read by GConf with the default Debian configuration,
              and it takes precedence over user settings.

SEE ALSO
       dh_gconf(1),gconftool(1).

AUTHOR
       Josselin Mouette <joss@debian.org>.

                                                                    2 Feb 2009                                            UPDATE-GCONF-DEFAULTS(8)
