gnutls-cli-debug(1)                                                User Commands                                               gnutls-cli-debug(1)

NAME
       gnutls-cli-debug - GnuTLS debug client

SYNOPSIS
       gnutls-cli-debug [-flags] [-flag [value]] [--option-name[[=| ]value]]

       Operands and options may be intermixed.  They will be reordered.

DESCRIPTION
       TLS  debug  client.  It  sets  up  multiple TLS connections to a server and queries its capabilities. It was created to assist in debugging
       GnuTLS, but it might be useful to extract a TLS server's capabilities.  It connects to a TLS server, performs tests and print the  server's
       capabilities.  If  called  with  the  `-v' parameter more checks will be performed.  Can be used to check for servers with special needs or
       bugs.

OPTIONS
       -d number, --debug=number
              Enable debugging.  This option takes an integer number as its argument.  The value of number is constrained to being:
                  in the range  0 through 9999

              Specifies the debug level.

       -V, --verbose
              More verbose output.  This option may appear an unlimited number of times.

       -p number, --port=number
              The port to connect to.  This option takes an integer number as its argument.  The value of number is constrained to being:
                  in the range  0 through 65536

       --app-proto
              This is an alias for the --starttls-proto option.

       --starttls-proto=string
              The application protocol to be used to obtain the server's certificate (https, ftp, smtp, imap, ldap, xmpp).

              Specify the application layer protocol for STARTTLS. If the protocol is supported, gnutls-cli will proceed to the TLS negotiation.

       -h, --help
              Display usage information and exit.

       -!, --more-help
              Pass the extended usage information through a pager.

       -v [{v|c|n --version [{v|c|n}]}]
              Output version of program and exit.  The default mode is `v', a simple version.  The `c' mode will print copyright information and
              `n' will print the full copyright notice.

EXAMPLES
           $ ../src/gnutls-cli-debug localhost
           GnuTLS debug client 3.5.0
           Checking localhost:443
                                        for SSL 3.0 (RFC6101) support... yes
                                   whether we need to disable TLS 1.2... no
                                   whether we need to disable TLS 1.1... no
                                   whether we need to disable TLS 1.0... no
                                   whether %NO_EXTENSIONS is required... no
                                          whether %COMPAT is required... no
                                        for TLS 1.0 (RFC2246) support... yes
                                        for TLS 1.1 (RFC4346) support... yes
                                        for TLS 1.2 (RFC5246) support... yes
                                             fallback from TLS 1.6 to... TLS1.2
                                   for RFC7507 inappropriate fallback... yes
                                                for HTTPS server name... Local
                                          for certificate chain order... sorted
                             for safe renegotiation (RFC5746) support... yes
                                for Safe renegotiation support (SCSV)... no
                               for encrypt-then-MAC (RFC7366) support... no
                              for ext master secret (RFC7627) support... no
                                      for heartbeat (RFC6520) support... no
                                  for version rollback bug in RSA PMS... dunno
                             for version rollback bug in Client Hello... no
                       whether the server ignores the RSA PMS version... yes
           whether small records (512 bytes) are tolerated on handshake... yes
               whether cipher suites not in SSL 3.0 spec are accepted... yes
           whether a bogus TLS record version in the client hello is accepted... yes
                    whether the server understands TLS closure alerts... partially
                       whether the server supports session resumption... yes
                                 for anonymous authentication support... no
                                 for ephemeral Diffie-Hellman support... no
                              for ephemeral EC Diffie-Hellman support... yes
                               ephemeral EC Diffie-Hellman group info... SECP256R1
                             for AES-128-GCM cipher (RFC5288) support... yes
                             for AES-128-CCM cipher (RFC6655) support... no
                           for AES-128-CCM-8 cipher (RFC6655) support... no
                             for AES-128-CBC cipher (RFC3268) support... yes
                        for CAMELLIA-128-GCM cipher (RFC6367) support... no
                        for CAMELLIA-128-CBC cipher (RFC5932) support... no
                                for 3DES-CBC cipher (RFC2246) support... yes
                             for ARCFOUR 128 cipher (RFC2246) support... yes
                                                  for MD5 MAC support... yes
                                                 for SHA1 MAC support... yes
                                               for SHA256 MAC support... yes
                                         for ZLIB compression support... no
                                for max record size (RFC6066) support... no
                           for OCSP status response (RFC6066) support... no
                         for OpenPGP authentication (RFC6091) support... no

EXIT STATUS
       One of the following exit values will be returned:

       0  (EXIT_SUCCESS)
              Successful program execution.

       1  (EXIT_FAILURE)
              The operation failed or the command syntax was not valid.

       70  (EX_SOFTWARE)
              libopts had an internal operational error.  Please report it to autogen-users@lists.sourceforge.net.  Thank you.

SEE ALSO
       gnutls-cli(1), gnutls-serv(1)

AUTHORS
       Nikos Mavrogiannopoulos, Simon Josefsson and others; see /usr/share/doc/gnutls/AUTHORS for a complete list.

COPYRIGHT
       Copyright (C) 2000-2016 Free Software Foundation, and others all rights reserved.  This program is released under the terms of the GNU Gen‐
       eral Public License, version 3 or later.

BUGS
       Please send bug reports to: bugs@gnutls.org

NOTES
       This manual page was AutoGen-erated from the gnutls-cli-debug option definitions.

3.4.10                                                              2019-05-28                                                 gnutls-cli-debug(1)
