OPENSC-EXPLORER(1)                                                                               OpenSC Tools                                                                              OPENSC-EXPLORER(1)



NAME
       opensc-explorer - generic interactive utility for accessing smart card and similar security token functions

SYNOPSIS
       opensc-explorer [OPTIONS] [SCRIPT]

DESCRIPTION
       The opensc-explorer utility can be used interactively to perform miscellaneous operations such as exploring the contents of or sending arbitrary APDU commands to a smart card or similar security
       token.

OPTIONS
       The following are the command-line options for opensc-explorer. There are additional interactive commands available once it is running.

       --card-driver driver, -c driver
           Use the given card driver. The default is auto-detected.

       --mf path, -m path
           Select the file referenced by the given path on startup. The default is the path to the standard master file, 3F00. If path is empty (e.g.  opensc-explorer --mf ""), then no file is explicitly
           selected.

       --reader num, -r num
           Use the given reader number. The default is 0, the first reader in the system.

       --verbose, -v
           Causes opensc-explorer to be more verbose. Specify this flag several times to enable debug output in the opensc library.

       --wait, -w
           Wait for a card to be inserted

COMMANDS
       The following commands are supported at opensc-explorer's interactive prompt or in script files passed via the command line parameter SCRIPT.

       apdu hex-data
           Send a custom APDU command hex-data.

       asn1 file-id
           Parse and print the ASN.1 encoded content of the file specified by file-id.

       cat [file-id | sfi:short-id]
           Print the contents of the currently selected EF or the contents of a file specified by file-id or the short file id short-id.

       cd {.. | file-id | aid:DF-name}
           Change to another DF specified by the argument passed. If the argument given is .., then move up one level in the file system hierarchy. If it is file-id, which must be a DF directly beneath the
           current DF, then change to that DF. If it is an application identifier given as aid:DF-name, then jump to the MF of the application denoted by DF-name.

       change CHVpin-ref [[old-pin] new-pin]
           Change a PIN, where pin-ref is the PIN reference.

           Examples:

           change CHV2 00:00:00:00:00:00 "foobar"
               Change PIN CHV2 to the new value foobar, giving the old value 00:00:00:00:00:00.

           change CHV2 "foobar"
               Set PIN CHV2 to the new value foobar.

           change CHV2
               Change PIN CHV2 using the card reader's pinpad.


       create file-id size
           Create a new EF.  file-id specifies the id number and size is the size of the new file.

       debug [level]
           Set OpenSC debug level to level.

           If level is omitted the current debug level will be shown.

       delete file-id
           Remove the EF or DF specified by file-id

       do_get hex-tag [output]
           Copy the internal card's 'tagged' data into the local file.

           The local file is specified by output while the tag of the card's data is specified by hex-tag.

           If output is omitted, the name of the output file will be derived from hex-tag.

       do_put hex-tag input
           Update internal card's 'tagged' data.

           hex-tag is the tag of the card's data.  input is the filename of the source file or the literal data presented as a sequence of hexadecimal values or " enclosed string.

       echo string ...
           Print the strings given.

       erase
           Erase the card, if the card supports it.

       get file-id [output]
           Copy an EF to a local file. The local file is specified by output while the card file is specified by file-id.

           If output is omitted, the name of the output file will be derived from the full card path to file-id.

       info [file-id]
           Display attributes of a file specified by file-id. If file-id is not supplied, the attributes of the current file are printed.

       ls [pattern ...]
           List files in the current DF. If no pattern is given, then all files are listed. If one ore more patterns are given, only files matching at least one pattern are listed.

       find [start-id [end-id]]
           Find all files in the current DF. Files are found by selecting all file identifiers in the range from start-fid to end-fid (by default from 0000 to FFFF).

       mkdir file-id size
           Create a DF.  file-id specifies the id number and size is the size of the new file.

       put file-id input
           Copy a local file to the card. The local file is specified by input while the card file is specified by file-id.

       quit
           Exit the program.

       random count
           Generate random sequence of count bytes.

       rm file-id
           Remove the EF or DF specified by file-id

       unblock CHVpin-ref [puk [new pin]]
           Unblock the PIN denoted by pin-ref using the PUK puk, and set potentially change its value to new pin.

           PUK and PIN values can be a sequence of hexadecimal values, "-enclosed strings, empty (""), or absent. If they are absent, the values are read from the card reader's pin pad.

           Examples:

           unblock CHV2 00:00:00:00:00:00 "foobar"
               Unblock PIN CHV2 using PUK 00:00:00:00:00:00 and set it to the new value foobar.

           unblock CHV2 00:00:00:00:00:00 ""
               Unblock PIN CHV2 using PUK 00:00:00:00:00:00 keeping the old value.

           unblock CHV2 "" "foobar"
               Set new value of PIN CHV2 to foobar.

           unblock CHV2 00:00:00:00:00:00
               Unblock PIN CHV2 using PUK 00:00:00:00:00:00. The new PIN value is prompted by pinpad.

           unblock CHV2 ""
               Set PIN CHV2. The new PIN value is prompted by pinpad.

           unblock CHV2
               Unblock PIN CHV2. The unblock code and new PIN value are prompted by pinpad.


       update_binary file-id offs data
           Binary update of the file specified by file-id with the literal data data starting from offset specified by offs.

           data can be supplied as a sequencer of the hex values or as a " enclosed string.

       update_record file-id rec-nr rec-offs data
           Update record specified by rec-nr of the file specified by file-id with the literal data data starting from offset specified by rec-offs.

           data can be supplied as a sequence of the hex values or as a " enclosed string.

       verify key-type key-id [key]
           Present a PIN or key to the card, where key-type can be one of CHV, KEY, AUT or PRO.  key-id is a number representing the key or PIN reference.  key is the key or PIN to be verified, formatted
           as a colon-separated list of hex values or a " enclosed string.

           If key is omitted, the exact action depends on the card reader's features: if the card readers supports PIN input via a pin pad, then the PIN will be verified using the card reader's pin pad. If
           the card reader does not support PIN input, then the PIN will be asked interactively.

           Examples:

           verify CHV0 31:32:33:34:00:00:00:00
               Verify CHV2 using the hex value 31:32:33:34:00:00:00:00

           verify CHV1 "secret"
               Verify CHV1 using the string value secret.

           verify KEY2
               Verify KEY2, get the value from the card reader's pin pad.


SEE ALSO
       opensc-tool(1)



opensc                                                                                            10/08/2014                                                                               OPENSC-EXPLORER(1)
