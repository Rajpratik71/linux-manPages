OPENSC-TOOL(1)                                                                                   OpenSC Tools                                                                                  OPENSC-TOOL(1)



NAME
       opensc-tool - generic smart card utility

SYNOPSIS
       opensc-tool [OPTIONS]

DESCRIPTION
       The opensc-tool utility can be used from the command line to perform miscellaneous smart card operations such as getting the card ATR or sending arbitrary APDU commands to a card.

OPTIONS
       --atr, -a
           Print the Answer To Reset (ATR) of the card. Output is in hex byte format

       --card-driver driver, -c driver
           Use the given card driver. The default is auto-detected.

       --info, -i
           Print information about OpenSC, such as version and enabled components.

       --list-drivers, -D
           List all installed card drivers.

       --list-files, -f
           Recursively list all files stored on card.

       --list-readers, -l
           List all configured readers.

       --name, -n
           Print the name of the inserted card (driver).

       --reader num, -r num
           Use the given reader number. The default is 0, the first reader in the system.

       --send-apdu apdu, -s apdu
           Sends an arbitrary APDU to the card in the format AA:BB:CC:DD:EE:FF....

       --serial
           Print the card serial number (normally the ICCSN). Output is in hex byte format

       --verbose, -v
           Causes opensc-tool to be more verbose. Specify this flag several times to enable debug output in the opensc library.

       --wait, -w
           Wait for a card to be inserted.

SEE ALSO
       opensc-explorer(1)



opensc                                                                                            10/08/2014                                                                                   OPENSC-TOOL(1)
