gnutls-cli-debug(1)                                                                             User Commands                                                                             gnutls-cli-debug(1)



NAME
       gnutls-cli-debug - GnuTLS debug client

SYNOPSIS
       gnutls-cli-debug [-flags] [-flag [value]] [--option-name[[=| ]value]]

       Operands and options may be intermixed.  They will be reordered.


DESCRIPTION
       TLS  debug  client. It sets up multiple TLS connections to a server and queries its capabilities. It was created to assist in debugging GnuTLS, but it might be useful to extract a TLS server's capa‐
       bilities.  It connects to a TLS server, performs tests and print the server's capabilities. If called with the `-v' parameter more checks will be performed.  Can be used to check  for  servers  with
       special needs or bugs.

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


       --app-proto=string
              The application protocol to be used to obtain the server's certificate (https, ftp, smtp, imap).


       -h, --help
              Display usage information and exit.

       -!, --more-help
              Pass the extended usage information through a pager.

       -v [{v|c|n --version [{v|c|n}]}]
              Output version of program and exit.  The default mode is `v', a simple version.  The `c' mode will print copyright information and `n' will print the full copyright notice.

EXAMPLES
           $ ../src/gnutls-cli-debug localhost
           Resolving 'localhost'...
           Connecting to '127.0.0.1:443'...
           Checking for SSL 3.0 support... yes
           Checking whether %COMPAT is required... no
           Checking for TLS 1.0 support... yes
           Checking for TLS 1.1 support... no
           Checking fallback from TLS 1.1 to... TLS 1.0
           Checking for TLS 1.2 support... no
           Checking whether we need to disable TLS 1.0... N/A
           Checking for Safe renegotiation support... yes
           Checking for Safe renegotiation support (SCSV)... yes
           Checking for HTTPS server name... not checked
           Checking for version rollback bug in RSA PMS... no
           Checking for version rollback bug in Client Hello... no
           Checking whether the server ignores the RSA PMS version... no
           Checking whether the server can accept Hello Extensions... yes
           Checking whether the server can accept small records (512 bytes)... yes
           Checking whether the server can accept cipher suites not in SSL 3.0 spec... yes
           Checking whether the server can accept a bogus TLS record version in the client hello... yes
           Checking for certificate information... N/A
           Checking for trusted CAs... N/A
           Checking whether the server understands TLS closure alerts... partially
           Checking whether the server supports session resumption... yes
           Checking for export-grade ciphersuite support... no
           Checking RSA-export ciphersuite info... N/A
           Checking for anonymous authentication support... no
           Checking anonymous Diffie-Hellman group info... N/A
           Checking for ephemeral Diffie-Hellman support... no
           Checking ephemeral Diffie-Hellman group info... N/A
           Checking for ephemeral EC Diffie-Hellman support... yes
           Checking ephemeral EC Diffie-Hellman group info...
            Curve SECP256R1
           Checking for AES-GCM cipher support... no
           Checking for AES-CBC cipher support... yes
           Checking for CAMELLIA cipher support... no
           Checking for 3DES-CBC cipher support... yes
           Checking for ARCFOUR 128 cipher support... yes
           Checking for ARCFOUR 40 cipher support... no
           Checking for MD5 MAC support... yes
           Checking for SHA1 MAC support... yes
           Checking for SHA256 MAC support... no
           Checking for ZLIB compression support... no
           Checking for max record size... no
           Checking for OpenPGP authentication support... no

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
       Copyright (C) 2000-2018 Free Software Foundation, and others all rights reserved.  This program is released under the terms of the GNU General Public License, version 3 or later.

BUGS
       Please send bug reports to: bugs@gnutls.org

NOTES
       This manual page was AutoGen-erated from the gnutls-cli-debug option definitions.



3.3.29                                                                                           16 Feb 2018                                                                              gnutls-cli-debug(1)
