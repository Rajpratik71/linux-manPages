DNIE-TOOL(1)                                 OpenSC Tools                                DNIE-TOOL(1)

NAME
       dnie-tool - displays information about DNIe based security tokens

SYNOPSIS
       dnie-tool [OPTIONS]

DESCRIPTION
       The dnie-tool utility is used to display additional information about DNIe, the Spanish
       National eID card.

OPTIONS
       --idesp, -i
           Show the DNIe IDESP value.

       --data, -d
           Show DNIe personal information. Reads and print DNIe number and User Name and SurName

       --all, -a
           Displays every available information. This command is equivalent to -d -i -s

       --serial, -s
           Displays DNIe Serial Number

       --version, -V
           Show DNIe sw version. Displays software version for in-card DNIe OS

       --pin pin, -p pin
           Specify the user pin pin to use. If set to env:VARIABLE, the value of the environment
           variable VARIABLE is used. The default is do not enter pin

       --reader num, -r num
           Specify the reader to use. By default, the first reader with a present card is used. If
           num is an ATR, the reader with a matching card will be chosen.

       --driver driver, -c driver
           Specify the card driver driver to use. Default is use driver from configuration file, or
           auto-detect if absent

       --wait, -w
           Causes dnie-tool to wait for the token to be inserted into reader.

       --verbose, -v
           Causes dnie-tool to be more verbose. Specify this flag several times to enable debug
           output in the opensc library.

AUTHORS
       dnie-tool was written by Juan Antonio Martinez <jonsito@terra.es>.

opensc                                        06/10/2019                                 DNIE-TOOL(1)
