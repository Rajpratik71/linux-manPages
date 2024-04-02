ipa-crlgen-manage(1)                                                                           IPA Manual Pages                                                                          ipa-crlgen-manage(1)



NAME
       ipa-crlgen-manage - Enables or disables CRL generation

SYNOPSIS
       ipa-crlgen-manage [options] <enable|disable|status>

DESCRIPTION
       Run  the  command  with  the enable option to enable CRL generation on the local host. This requires that the IPA server is already installed and configured, including a CA. The command will restart
       Dogtag and Apache.

       Run the command with the disable option to disable CRL generation on the local host. The command will restart Dogtag and Apache.

       Run the command with the status option to determine the current status of CRL generation. If the local host is configured for CRL generation, the command also prints the last CRL generation date and
       number.

       Important:  the  administrator must ensure that there is only one IPA server generating CRLs. In order to transfer the CRL generation from one server to another, please run ipa-crlgen-manage disable
       on the current CRL generation master, followed by ipa-crlgen-manage enable on the new CRL generation master.

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

       2 if the local host is not an IPA server



IPA                                                                                              Feb 12 2019                                                                             ipa-crlgen-manage(1)
