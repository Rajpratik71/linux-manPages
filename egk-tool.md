EGK-TOOL(1)                                  OpenSC Tools                                 EGK-TOOL(1)

NAME
       egk-tool - displays information on the German electronic health card (elektronische
       Gesundheitskarte, eGK)

SYNOPSIS
       egk-tool [OPTIONS]

DESCRIPTION
       The egk-tool utility is used to display information stored on the German elektronic health
       card (elektronische Gesundheitskarte, eGK).

OPTIONS
       --help, -h
           Print help and exit.

       --version, -V
           Print version and exit.

       --reader arg, -r arg
           Specify the reader to use. Use -1 as arg to automatically detect the reader to use. By
           default, the first reader with a present card is used.

       --verbose, -v
           Causes egk-tool to be more verbose. Specify this flag several times to be more verbose.

   Health Care Application (HCA)
       --pd
           Show 'Persönliche Versicherungsdaten' (XML).

       --vd
           Show 'Allgemeine Versicherungsdaten' (XML).

       --gvd
           Show 'Geschützte Versicherungsdaten' (XML).

       --vsd-status
           Show 'Versichertenstammdaten-Status'.

AUTHORS
       egk-tool was written by Frank Morgner <frankmorgner@gmail.com>.

opensc                                        06/10/2019                                  EGK-TOOL(1)
