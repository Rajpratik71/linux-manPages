REMOVE-DEFAULT-ISPELL(8)                                                      REMOVE-DEFAULT-ISPELL(8)

NAME
       remove-default-ispell - remove default ispell dictionary

SYNOPSIS
        remove-default-ispell <package>

DESCRIPTION
       WARNING: Not to be used from the command line unless you know very well what you are doing.

       When called from package postrm, this program will take care of removing the entries associated
       to a ispell package from the dictionaries-common database and call for the new selection if it
       was the default one.

SEE ALSO
       The dictionaries-common policy document

AUTHORS
       Rafael Laboissiere

1.28.1                                        2018-11-15                      REMOVE-DEFAULT-ISPELL(8)
