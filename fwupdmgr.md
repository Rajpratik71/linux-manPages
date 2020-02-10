FWUPDMGR(1)                                                                                                                                                                                   FWUPDMGR(1)

NAME
       fwupdmgr - fwupd client tool

SYNOPSIS
       fwupdmgr [ options ] [ COMMAND ]

DESCRIPTION
       This manual page documents briefly the fwupdmgr command.

       fwupdmgr allows an administrator to update firmware.

OPTIONS
       This program follows the usual GNU command line syntax, with long options starting with two dashes (`-').  A summary of options is included below.

                 --help
              Show summary of options.

                 --verbose
              Show extra debugging information.

                 --allow-reinstall
              Allow re-installing existing firmware versions.

                 --allow-older
              Allow downgrading firmware versions.

                 --offline
              Schedule installation for next reboot when possible.

                 --force
              Override plugin warning.

COMMANDS
       This program takes commands with a variable number of arguments.

                 get-details
              Gets details about a firmware file.

                 get-devices
              Get the list of hardware that supports firmware updates.

                 get-updates
              Gets the list of updates for connected hardware.

                 update
              Updates all firmware to latest versions available.

                 install
              Install a firmware file on this hardware.

                 install-prepared
              Install prepared updates now.

                 clear-results
              Clears the results from the last update.

                 dump-rom
              Dump the ROM checksum.

                 monitor
              Monitor the daemon for events.

                 unlock
              Unlocks the devicefor firmware access.

                 verify
              Gets the cryptographic hash of the dumped firmware.

                 verify-update
              Update the stored metadata with current ROM contents.

                 refresh
              Refresh metadata from remote server.

                 get-results
              Gets the results from the last update.

AUTHOR
       This manual page was written by Richard Hughes <richard@hughsie.com>.

                                                                                             26 February,2015                                                                                 FWUPDMGR(1)
