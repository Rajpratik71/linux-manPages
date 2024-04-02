CARDOS-TOOL(1)                                                                                   OpenSC Tools                                                                                  CARDOS-TOOL(1)



NAME
       cardos-tool - displays information about Card OS-based security tokens or format them

SYNOPSIS
       cardos-tool [OPTIONS]

DESCRIPTION
       The cardos-tool utility is used to display information about smart cards and similar security tokens based on Siemens Card/OS M4.

OPTIONS
       --card-driver name, -c name
           Use the card driver specified by name. The default is to auto-detect the correct card driver.

       --format, -f
           Format the card or token.

       --info, -i
           Display information about the card or token.

       --reader number, -r number
           Specify the reader number number to use. The default is reader 0.

       --verbose, -v
           Causes cardos-tool to be more verbose. Specify this flag several times to enable debug output in the opensc library.

       --wait, -w
           Causes cardos-tool to wait for the token to be inserted into reader.



opensc                                                                                            10/08/2014                                                                                   CARDOS-TOOL(1)
