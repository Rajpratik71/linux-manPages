EIDENV(1)                                                                                        OpenSC Tools                                                                                       EIDENV(1)



NAME
       eidenv - utility for accessing visible data from electronic identity cards

SYNOPSIS
       eidenv [OPTIONS]

DESCRIPTION
       The eidenv utility is used for accessing data from electronic identity cards (like national eID cards) which might not be present in PKCS#15 objects but available in custom files on the card. The
       data can be printed on screen or used by other programs via environment variables.

OPTIONS
       --exec prog, -x prog
           Executes the given program with data in environment variables.

       --help, -h
           Print help message on screen.

       --print, -n
           Prints all data fields from the card, like validity period, document number etc.

       --reader num, -r num
           Use the given reader. The default is the first reader with a card.

       --stats, -t
           Prints key usage statistics (only for Estonian ID card).

       --version, -v
           Prints the version of the utility and exits.

       --wait, -w
           Wait for a card to be inserted

AUTHORS
       eidenv utility was written by Stef Hoeben and Martin Paljak <martin@martinpaljak.net>.



opensc                                                                                            10/08/2014                                                                                        EIDENV(1)
