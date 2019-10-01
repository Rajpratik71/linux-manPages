
ipa-server-upgrade(1)                                                                          IPA Manual Pages                                                                         ipa-server-upgrade(1)



NAME
       ipa-server-upgrade - upgrade IPA server

SYNOPSIS
       ipa-server-upgrade [options]

DESCRIPTION
       ipa-server-upgrade is used to upgrade IPA server when the IPA packages are being updated. It is not intended to be executed by end-users.

       ipa-server-upgrade will:

           * update LDAP schema
           * process all files with the extension .update in /usr/share/ipa/updates (including update plugins).
           * upgrade local configurations of IPA services


OPTIONS
       --skip-version-check
              Skip version check. WARNING: this option may break your system

       --force
              Force upgrade (alias for --skip-version-check)

       --version
              Show IPA version

       -h, --help
              Show help message and exit

       -v, --verbose
              Print debugging information

       -q, --quiet
              Output only errors

       --log-file=FILE
              Log to given file



       EXIT STATUS
              0 if the command was successful

              1 if an error occurred



IPA                                                                                             April 02 2015                                                                           ipa-server-upgrade(1)
