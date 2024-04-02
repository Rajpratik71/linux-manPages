NETKEY-TOOL(1)                                                                                   OpenSC Tools                                                                                  NETKEY-TOOL(1)



NAME
       netkey-tool - administrative utility for Netkey E4 cards

SYNOPSIS
       netkey-tool [OPTIONS] [COMMAND]

DESCRIPTION
       The netkey-tool utility can be used from the command line to perform some smart card operations with NetKey E4 cards that cannot be done easily with other OpenSC-tools, such as changing local PINs,
       storing certificates into empty NetKey E4 cert-files or displaying the initial PUK-value.

OPTIONS
       --help, -h
           Displays a short help message.

       --pin pin-value, -p pin-value
           Specifies the current value of the global PIN.

       --puk pin-value, -u pin-value
           Specifies the current value of the global PUK.

       --pin0 pin-value, -0 pin-value
           Specifies the current value of the local PIN0 (aka local PIN).

       --pin1 pin-value, -1 pin-value
           Specifies the current value of the local PIN1 (aka local PUK).

       --reader number, -r number
           Use smart card in specified reader. Default is reader 0.

       -v
           Causes netkey-tool to be more verbose. This options may be specified multiple times to increase verbosity.

PIN FORMAT
       With the -p, -u, -0 or the -1 one of the cards pins may be specified. You may use plain ascii-strings (i.e. 123456) or a hex-string (i.e. 31:32:33:34:35:36). A hex-string must consists of exacly n
       2-digit hexnumbers separated by n-1 colons. Otherwise it will be interpreted as an ascii string. For example :12:34: and 1:2:3:4 are both pins of length 7, while 12:34 and 01:02:03:04 are pins of
       length 2 and 4.

COMMANDS
       When used without any options or commands, netkey-tool will display information about the smart cards pins and certificates. This will not change your card in any aspect (assumed there are no bugs
       in netkey-tool). In particular the tries-left counters of the pins are investigated without doing actual pin-verifications.

       If you specify the global PIN via the --pin option, netkey-tool will also display the initial value of the cards global PUK. If your global PUK was changed netkey-tool will still display its initial
       value. There's no way to recover a lost global PUK once it was changed. There's also no way to display the initial value of your global PUK without knowing the current value of your global PIN.

       For most of the commands that netkey-tool can execute, you have to specify one pin. One notable exeption is the nullpin command, but this command can only be executed once in the lifetime of a
       NetKey E4 card.

       cert number filename
           This command will read one of your cards certificates (as specified by number) and save this certificate into file filename in PEM-format. Certificates on a NetKey E4 card are readable without a
           pin, so you don't have to specify one.

       cert filename number
           This command will read the first PEM-encoded certificate from file filename and store this into your smart cards certificate file number. Some of your smart cards certificate files might be
           readonly, so this will not work with all values of number. If a certificate file is writable you must specify a pin in order to change it. If you try to use this command without specifying a
           pin, netkey-tool will tell you which one is needed.

       change { pin | puk | pin0 | pin1 } new-pin
           This changes the value of the specified pin to the given new value. You must specify either the current value of the pin or another pin to be able to do this and if you don't specify a correct
           one, netkey-tool will tell you which one is needed.

       nullpin initial-pin
           This command can be executed only if the global PIN of your card is in nullpin-state. There's no way to return back to nullpin-state once you have changed your global PIN. You don't need a pin
           to execute the nullpin-command. After a succesfull nullpin-command netkey-tool will display your cards initial PUK-value.

       unblock { pin | pin0 | pin1 }
           This unblocks the specified pin. You must specify another pin to be able to do this and if you don't specify a correct one, netkey-tool will tell you which one is needed.

SEE ALSO
       opensc-explorer(1)

AUTHORS
       netkey-tool was written by Peter Koch <pk_opensc@web.de>.



opensc                                                                                            10/08/2014                                                                                   NETKEY-TOOL(1)
