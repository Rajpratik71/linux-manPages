GIDS-TOOL(1)                                 OpenSC Tools                                GIDS-TOOL(1)

NAME
       gids-tool - smart card utility for GIDS cards

SYNOPSIS
       gids-tool [OPTIONS]

       The gids-tool utility can be used from the command line to perform miscellaneous smart card
       operations on a GIDS smart card.

OPTIONS
       -X, --initialize
           Initialize token.

       --admin-key argument
           Define the administrator key

       --pin argument
           Define user PIN.

       --serial-number argument
           Define serial number.

       -U, --unblock
           Unblock the user PIN after an administrator authentication.

       -C, --change-admin-key
           Change the administrator key.

       --new-admin-key argument
           Define the new administrator key.

       --reader argument, -r argument
           Specify the reader to use. By default, the first reader with a present card is used. If
           num is an ATR, the reader with a matching card will be chosen.

       -w, --wait
           Wait for a card to be inserted.

       -v, --verbose
           Verbose operation. Use several times to enable debug output.

SEE ALSO
       opensc-tool(1)

AUTHORS
       gids-tool was written by Vincent Le Toux <vincent.letoux@mysmartlogon.com>.

opensc                                        06/10/2019                                 GIDS-TOOL(1)
