pn53x-tamashell(1)                                            General Commands Manual                                           pn53x-tamashell(1)

NAME
       pn53x-tamashell - PN53x TAMA communication demonstration shell

SYNOPSIS
       pn53x-tamashell [script]

DESCRIPTION
       pn53x-tamashell  is a simple interactive tool to send so called TAMA commands and receive the answers.  TAMA refers to the command set sup‐
       ported by the PN53x family.  Messages are binary and the  shell  expects  hexadecimal  notation.   TAMA  commands  and  responses  prefixes
       (0xD4/0xD5), CRC and any framing above are handled transparently.

       You can use the shell interactively (with readline support) or you can write your own script file consisting in commands and comments (any‐
       thing that starts with ";", "#" or "//").  Spaces are ignored and can be used for readability.

       Shebang is supported, simply start your script with:
        #!/usr/bin/env pn53x-tamashell

COMMANDS
       p N to introduce a pause of N milliseconds.

       q or Ctrl-d to quit.

EXAMPLES
       GetFirmware command is D4 02, so one has just to send the command "02":

        $ pn53x-tamashell
        Connected to NFC reader: SCM Micro/SCL3711-NFC&RW - PN533 v2.7 (0x07)
        > 02
        Tx: 02
        Rx: 33  02  07  07
        > 40
        Tx: 40
        Rx: Command Not Acceptable
        > q
        Bye!

       Same thing, with a script:

        $ pn53x-tamashell << EOF
        // This is a comment
        02 // GetFirmware
        40 // Command with missing arguments
        EOF

        Connected to NFC reader: SCM Micro/SCL3711-NFC&RW - PN533 v2.7 (0x07)
        > // This is a comment
        > 02 // GetFirmware
        Tx: 02
        Rx: 33  02  07  07
        > 40 // Command with missing arguments
        Tx: 40
        Rx: Command Not Acceptable
        > Bye!

OPTIONS
       script Script file with tama commands

BUGS
       Please report any bugs on the libnfc issue tracker at:
       http://code.google.com/p/libnfc/issues

LICENCE
       libnfc is licensed under the GNU Lesser General Public License (LGPL), version 3.
       libnfc-utils and libnfc-examples are covered by the the BSD 2-Clause license.

       This manual page is licensed under the terms of the GNU GPL (version 2 or later).

                                                                September 15, 2010                                              pn53x-tamashell(1)
