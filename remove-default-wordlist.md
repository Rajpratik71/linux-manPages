REMOVE-DEFAULT-WORDLIST(8)                                                                                              REMOVE-DEFAULT-WORDLIST(8)

NAME
       remove-default-wordlist - remove default wordlist

SYNOPSIS
        remove-default-wordlist <package>

DESCRIPTION
       WARNING: Not to be used from the command line unless you know very well what you are doing.

       When called from package postrm, this program will take care of removing the entries associated to a wordlist package from the
       dictionaries-common database and call for the new selection if it was the default one.

SEE ALSO
       The dictionaries-common policy document

AUTHORS
       Rafael Laboissiere

1.27.2~ubuntu16.04.1~c42.ppa1                                       2017-12-18                                          REMOVE-DEFAULT-WORDLIST(8)
