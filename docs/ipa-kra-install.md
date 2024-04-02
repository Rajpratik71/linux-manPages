ipa-kra-install(1)                                                                             IPA Manual Pages                                                                            ipa-kra-install(1)



NAME
       ipa-kra-install - Install a KRA on a server

SYNOPSIS
   DOMAIN LEVEL 0
       ipa-kra-install [OPTION]... [replica_file]

   DOMAIN LEVEL 1
       ipa-kra-install [OPTION]...

DESCRIPTION
       Adds a KRA as an IPA-managed service. This requires that the IPA server is already installed and configured, including a CA.

       The KRA (Key Recovery Authority) is a component used to securely store secrets such as passwords, symmetric keys and private asymmetric keys.  It is used as the back-end repository for the IPA Pass‐
       word Vault.

       In a domain at domain level 0, ipa-kra-install can be run without replica_file to add KRA to the existing CA, or with replica_file to install the KRA service on the  replica.   ipa-kra-install  will
       contact the CA to determine if a KRA has already been installed on another replica, and if so, will exit indicating that a replica_file is required.

       The  replica_file  is  created  using  the  ipa-replica-prepare utility.  A new replica_file should be generated on the master IPA server after the KRA has been installed and configured, so that the
       replica_file will contain the master KRA configuration and system certificates.

       In a domain at domain level 1, ipa-kra-install can be used to add KRA to the existing CA, or to install the KRA service on a replica, and does not require any replica file.

       KRA can only be removed along with the entire server using ipa-server-install --uninstall.

OPTIONS
       -p DM_PASSWORD, --password=DM_PASSWORD
              Directory Manager (existing master) password

       --no-host-dns
              Do not use DNS for hostname lookup during installation

       -U, --unattended
              An unattended installation that will never prompt for user input

       -v, --verbose
              Enable debug output when more verbose output is needed

       -q, --quiet
              Output only errors

       --log-file=FILE
              Log to the given file

EXIT STATUS
       0 if the command was successful

       1 if an error occurred



IPA                                                                                              May 10 2017                                                                               ipa-kra-install(1)
