add-apt-key(8)                          System Manager's Manual                         add-apt-key(8)

NAME
       add-apt-key - Command line tool to add GPG keys to the APT keyring

SYNOPSIS
       add-apt-key [ --help ] [ --verbose ] [ --keyserver name ] keyid

DESCRIPTION
       The  add-apt-key  will request the specified GPG key from a public keyserver and insert it into
       the APT keyring so that archives signed with that key will be trusted.

OPTIONS
       This program follows the usual GNU command line syntax, with long  options  starting  with  two
       dashes (--).

       -h, --help
              Show online help (usage).

       -v, --verbose
              verbose mode will show each command before it is executed.

       -k, --keyserver name
              Select a specific keyserver to use.

       keyid  The GPG key identifier to add.

FILES
       /etc/default/add-apt-key
              Configuration file specifying the public keyserver to use.

EXIT VALUES
       The folling exit values are used:

       0      Adding the keyid was successful.

       1      Invalid script arguments.

       2      GPG keyid cannot be retrieved (or is malformed).

       3      Error in adding keyid to the APT keyring.

SEE ALSO
       gpg(1), apt-key(8)

System Administration Commands                2007-02-02                                add-apt-key(8)
