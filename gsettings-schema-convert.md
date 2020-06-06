GSETTINGS-SCHEMA-C(1)                                                                         User Commands                                                                         GSETTINGS-SCHEMA-C(1)

NAME
       gsettings-schema-convert - GConf to GSettings schema conversion

SYNOPSIS
       gsettings-schema-convert [option...] {file}

DESCRIPTION
       gsettings-schema-convert converts between GConf and GSettings schema file formats. Note that the conversion is not expected to be fully automated. You are expected to verify and edit the result
       of the conversion.

       Note that GSettings schemas need to be converted into binary form with glib-compile-schemas before they can be used by applications.

   Options
       -h, --help
           Print help and exit

       -o OUTPUT, --output=OUTPUT
           Store the generated output in the file OUTPUT. If no output file is specified, the generated output is written to stdout.

       -f, --force
           Overwrite the output file if it already exists.

       -g, --gconf
           The input file is a GConf schema.

       -s, --simple
           Produce a GSettings schema in simple format. The simple format is easier to edit and can be converted into the XML format with gsettings-schema-convert later on.

       -x, --xml
           Produce a GSettings schema in XML format. If the output format is not explicitly specified, this is the default.

       -i ID, --schema-id=ID
           Use ID as the schema id in the generated GSettings schema.

       -d DOMAIN, --gettext-domain=DOMAIN
           Use DOMAIN as the gettext domain in the generated GSettings schema.

       -u, --keep-underscores
           Keep underscores in key names instead of replacing them with dashes. GSettings keys should not contain any underscore.

SEE ALSO
       gsettings-data-convert(1) a related command to migrate user settings from GConf to GSettings.

User Commands                                                                                   01/21/2013                                                                          GSETTINGS-SCHEMA-C(1)
