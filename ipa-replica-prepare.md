ipa-replica-prepare(1)                                                                         IPA Manual Pages                                                                        ipa-replica-prepare(1)



NAME
       ipa-replica-prepare - Create an IPA replica file

SYNOPSIS
       ipa-replica-prepare [OPTION]... hostname

DESCRIPTION
       Generates a replica file that may be used with ipa-replica-install to create a replica of an IPA server.

       A replica can be created on any IPA master or replica server.

       You  must provide the fully-qualified hostname of the machine you want to install the replica on and a host-specific replica_file will be created. It is host-specific because SSL server certificates
       are generated as part of the process and they are specific to a particular hostname.

       If IPA manages the DNS for your domain, you should either use the --ip-address option or add the forward and reverse records manually using IPA plugins.

       Once the file has been created it will be named replica-hostname. This file can then be moved across the network to the target machine and a new IPA  replica  setup  by  running  ipa-replica-install
       replica-hostname.

   Limitations
       A replica should only be installed on the same or higher version of IPA on the remote system.

       A replica with PKI can only be installed from a replica file prepared on a master with PKI.

OPTIONS
       --dirsrv-cert-file=FILE
              File  containing the Directory Server SSL certificate and private key. The files are accepted in PEM and DER certificate, PKCS#7 certificate chain, PKCS#8 and raw private key and PKCS#12 for‐
              mats. This option may be used multiple times.

       --http-cert-file=FILE
              File containing the Apache Server SSL certificate and private key. The files are accepted in PEM and DER certificate, PKCS#7 certificate chain, PKCS#8 and raw private key and PKCS#12 formats.
              This option may be used multiple times.

       --dirsrv-pin=PIN
              The password to unlock the Directory Server private key

       --http-pin=PIN
              The password to unlock the Apache Server private key

       --dirsrv-cert-name=NAME
              Name of the Directory Server SSL certificate to install

       --http-cert-name=NAME
              Name of the Apache Server SSL certificate to install

       -p DM_PASSWORD, --password=DM_PASSWORD
              Directory Manager (existing master) password

       --ip-address=IP_ADDRESS
              IPv4 or IPv6 address of the replica server. This option can be specified multiple times for each interface of the server (e.g. multihomed and/or dualstacked server), or for each IPv4 and IPv6
              address of the server. The corresponding A or AAAA and PTR records will be added to the DNS if they do not exist already.

       --reverse-zone=REVERSE_ZONE
              The reverse DNS zone to use. This option can be used multiple times to specify multiple reverse zones.

       --no-reverse
              Do not create reverse DNS zone

       --ca=CA_FILE
              Location of CA PKCS#12 file, default /root/cacert.p12

       --debug
              Prints info log messages to the output

EXIT STATUS
       0 if the command was successful

       1 if an error occurred



IPA                                                                                              Mar 14 2008                                                                           ipa-replica-prepare(1)
