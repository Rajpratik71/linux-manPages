ipa-pkinit-manage(1)                                                                           IPA Manual Pages                                                                          ipa-pkinit-manage(1)



NAME
       ipa-pkinit-manage - Enables or disables PKINIT

SYNOPSIS
       ipa-pkinit-manage [options] <enable|disable|status>

DESCRIPTION
       Run the command with the enable option to enable PKINIT.

       Run the command with the disable option to disable PKINIT.

       Run the command with the status to determine the current status of PKINIT.

OPTIONS
       --version
              Show the program's version and exit.

       -h, --help
              Show the help for this program.

       -v, --verbose
              Print debugging information.

       -q, --quiet
              Output only errors.

       --log-file=FILE
              Log to the given file.

EXIT STATUS
       0 if the command was successful

       1 if an error occurred



IPA                                                                                              Jun 05 2017                                                                             ipa-pkinit-manage(1)
