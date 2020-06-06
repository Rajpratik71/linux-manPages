CD-CREATE-PROFILE(1)                                                                                                                                                                 CD-CREATE-PROFILE(1)

NAME
       cd-create-profile - Color Manager Profile Creation Tool

SYNOPSIS
       cd-create-profile [ --verbose ]

DESCRIPTION
       This manual page documents briefly the cd-create-profile command.

       cd-create-profile allows an administrator to create ICC profiles on their system.

OPTIONS
       This program follows the usual GNU command line syntax, with long options starting with two dashes (`-'). A summary of options is included below.

       --help Show summary of options.

       --description (optional)
              Sets the profile description.

       --copyright (optional)
              Sets the profile copyright.

       --model (optional)
              Sets the profile model.

       --manufacturer (optional)
              Sets the profile manufacturer.

       --srgb-palette
              Specifies a comma seporated values file that is used for the named color.

              The format of the CSV file must be "Color Name",0-255(red),0-255(green),0-255(blue).

       --output
              Specifies the output ICC filename.

       --nc-prefix (optional)
              Specifies the named color palette prefix.

       --nc-suffix (optional)
              Specifies the named color palette suffix.

AUTHOR
       This manual page was written by Richard Hughes <richard@hughsie.com>.

                                                                                               8 April,1011                                                                          CD-CREATE-PROFILE(1)
