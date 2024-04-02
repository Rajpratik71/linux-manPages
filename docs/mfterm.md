
mfterm(1)                                                          mfterm Manual                                                         mfterm(1)

NAME
       mfterm - The Mifare Terminal

SYNOPSIS
       mfterm [-v] [-h] [-t tagfile] [-k keyfile] [-d dictionary]

DESCRIPTION
       mfterm is a terminal interface for working with Mifare tags.

       The  program is used as an interactive shell to read and write Mifare tags using libnfc and a libnfc compatible reader or to simply manipu‐
       late Mifare data dumps from files. See the COMMANDS section below for a description of the commands available.

       In mfterm, there are a number of global state variables. One for tag data, one for keys and some others. Data is read and  loaded  to  this
       memory and written and saved from the same. The contents of the tag data variable is displayed using the print command. The keys in the key
       variable are displayed using the keys command. Both tag and key variables are 4k, but only the first 1k is used for 1k tags.

       Please see the README and INSTALL files for further information.

OPTIONS
       These are the command line options of mfterm.

       -h, --help
            Displays a help message.

       -v, --version
            Display version information.

       -t tagfile, --tag=tagfile
            Load a tag from the specified file. Before starting the terminal.

       -k keyfile, --keys=keyfile
            Load keys from the specified file. Before starting the terminal.

       -d dictionary, --dict=dictionary
            Load dictionary from the specified file. Before starting the terminal.

COMMANDS
       These are the commands available from the mfterm prompt.

   Tag Commands:

       print [1k|4k]
              Print the current tag data. The data is formatted to show sectors and blocks in hexadecimal. Optionally specify tag size (default is
              1k).

       read [A|B]
              Read  a  tag.  A  libnfc  compatible  reader must be connected and a tag present. The keys in the key state variable will be used to
              authenticate each sector. Optionally specify witch key to use for reading (default is A).

       write [A|B]
              Write a tag. A libnfc compatible reader must be connected and a tag present. The keys in the key state  variable  will  be  used  to
              authenticate each sector. Optionally specify witch key to use for reading (default is A).

       load   Load tag data from a file. The file should be a raw binary file containing exactly 4k. If the tag data represents a 1k tag, the data
              should be padded.

       save   Save tag data to a file. A raw binary dump of the data will be written. If the tag is a 1k tag, the data will be padded with  zeroes
              to 4k size.

       clear  Clear the current tag data in memory.

       print keys [1k|4k]
              Extract the key information from the tag loaded into memory and display it. This is not the same as the keys command. The later will
              print the keys stored in the keys variable, this prints keys from the tag.

       print ac
              Print the access conditions for each block. Possible values are A, B, A|B or '-'. Their meanings are, in turn, that the A  or  B  or
              both A and B keys or neither key can be used. The columns R, W, I, D represents read, write, increment and decrement. They apply for
              all non trailer blocks. For the trailer blocks the columns AR, AW, ACR, ACW, BR, BW apply. They are permissions for; reading the  A-
              key, writing the A-key, reading the access control bits, writing the access control bits, reading the B-key and writing the B-key.

       set block offset = xx xx xx
              Write some values to the tag variable in memory. Specify data as hexadecimal bytes separated by spaces.

   Key Management Commands:

       keys [1k|4k]
              Print  the  keys currently loaded. Optionally specify if keys for the full 4k tag should be displayed or just the ones for the first
              1k. Default is 1k.

       keys load file
              Load keys from a file into memory. The key file is a regular binary tag dump, but only the key fields are used. That means that  any
              tag dump can be loaded as keys.

       keys save file
              Save  the  current  keys  in  memory  to  a file. The keys will be saved as a normal binary tag dump with all values except the keys
              cleared.

       keys import
              Import keys from the current tag.

       keys clear
              Clear the keys in memory.

       keys set A|B sector key
              Set a specific key explicitly. Specify the key in hex, if it is an A- or B-key and what sector to set the key for.

       keys test
              Try to authenticate with the keys. Use this command to test a set of keys with a specific tag.

   Pirate Card Commands:

       These commands will only work on the back door:ed pirate cards (aka Chinese magic cards) with writable first block.

       read unlocked
              Read the card without using keys and disregard access control bits.

       write unlocked
              Write to a back door:ed 1k tag. This will write block 0 and possibly modify the UID.

   Dictionary Attack Commands:

       dict load file
              Load a dictionary key file. This is a regular text file with one key written in hex per line.  Loading  multiple  dictionaries  will
              merge their contents and remove duplicates.

       dict clear
              Clear the key dictionary in memory.

       dict attack
              Find  keys  of  a  physical tag by trying all keys in the loaded dictionary. If any keys are found the current keys variable will be
              updated.

       dict   Print the contents of the key dictionary currently loaded.

   Contents Specification Commands:

       spec load file
              Load a specification file.

       spec clear
              Unload the specification.

       spec   Print the specification.

   MAC Commands:

       These are commands for creating and validating DES MACs (message authentication codes) to sign the contents of specific blocks.

       mac key [key]
              Get or set MAC key.

       mac compute #block
              Compute the MAC for a specified block.

       mac update #block
              Compute the MAC for a specified block, truncate it and write it back into the current tag data.

       mac validate [1k|4k]
              Validates MACs for every block of the tag.

   General commands:

       quit Exit the program.

       help Show a list of available commands and a short description of each.

NOTE
       The mac and spec command groups are experimental. They

SEE ALSO
       nfc-list(1)

LICENSE
       Copyright (C) 2011-2016 Anders Sundman <anders@4zm.org>

       License GPLv3+: GNU GPL version 3 or later. This is free software: you are free to change and redistribute it. There is NO WARRANTY, to the
       extent permitted by law.

AUTHOR
       Anders Sundman <anders@4zm.org>

1.0.7                                                               14 Sep 2016                                                          mfterm(1)
