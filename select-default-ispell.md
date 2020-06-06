SELECT-DEFAULT-ISPELL(8)                                                                                                                                                         SELECT-DEFAULT-ISPELL(8)

NAME
           select-default-ispell - select default ispell dictionary

SYNOPSIS
        select-default-ispell [options]

         Options (all long only options):
           --set-default='regexp' Try 'regexp' to get a single match and set
                                  it as default. Fail otherwise.
           --show-choices         Show available choices to STDERR and exit.
           --debug                Enable debug mode

DESCRIPTION
       This program is responsible for selecting default ispell dictionary.

       If --show-choices is used will just output a list of available choices to STDERR and exit.  STDOUT cannot be used, this program loads debconf and debconf captures STDOUT.

       If --set-default is used, program will try to get a single regexp match from available choices, failing if not.  Will try case dependent match first, then case independent.

       If --set-default is not used this program will make debconf always ask the shared question about the default ispell dictionary to be used in your system according to the installed ones.

       In both cases, will do the appropriate settings if needed.

       Calls internally update-default-ispell.

SEE ALSO
       The dictionaries-common policy document

AUTHORS
       Rafael Laboissiere, Agustin Martin

1.26.3                                                                                          2015-8-31                                                                        SELECT-DEFAULT-ISPELL(8)
