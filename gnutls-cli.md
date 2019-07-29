gnutls-cli(1)                                                      User Commands                                                     gnutls-cli(1)

NAME
       gnutls-cli - GnuTLS client

SYNOPSIS
       gnutls-cli [-flags] [-flag [value]] [--option-name[[=| ]value]] [hostname]

       Operands and options may be intermixed.  They will be reordered.

DESCRIPTION
       Simple  client  program to set up a TLS connection to some other computer.  It sets up a TLS connection and forwards data from the standard
       input to the secured socket and vice versa.

OPTIONS
       -d number, --debug=number
              Enable debugging.  This option takes an integer number as its argument.  The value of number is constrained to being:
                  in the range  0 through 9999

              Specifies the debug level.

       -V, --verbose
              More verbose output.  This option may appear an unlimited number of times.

       --tofu, - Fl -no-tofu
              Enable trust on first use authentication.  The no-tofu form will disable the option.

              This option will, in addition to certificate authentication, perform authentication based on previously seen public keys, a model
              similar to SSH authentication. Note that when tofu is specified (PKI) and DANE authentication will become advisory to assist the
              public key acceptance process.

       --strict-tofu, - Fl -no-strict-tofu
              Fail to connect if a known certificate has changed.  The no-strict-tofu form will disable the option.

              This option will perform authentication as with option --tofu; however, while --tofu asks whether to trust a changed public key,
              this option will fail in case of public key changes.

       --dane, - Fl -no-dane
              Enable DANE certificate verification (DNSSEC).  The no-dane form will disable the option.

              This option will, in addition to certificate authentication using the trusted CAs, verify the server certificates using on the DANE
              information available via DNSSEC.

       --local-dns, - Fl -no-local-dns
              Use the local DNS server for DNSSEC resolving.  The no-local-dns form will disable the option.

              This option will use the local DNS server for DNSSEC.  This is disabled by default due to many servers not allowing DNSSEC.

       --ca-verification, - Fl -no-ca-verification
              Enable CA certificate verification.  The no-ca-verification form will disable the option.  This option is enabled by default.

              This option can be used to enable or disable CA certificate verification. It is to be used with the --dane or --tofu options.

       --ocsp, - Fl -no-ocsp
              Enable OCSP certificate verification.  The no-ocsp form will disable the option.

              This option will enable verification of the peer's certificate using ocsp

       -r, --resume
              Establish a session and resume.

              Connect, establish a session, reconnect and resume.

       -e, --rehandshake
              Establish a session and rehandshake.

              Connect, establish a session and rehandshake immediately.

       -s, --starttls
              Connect, establish a plain session and start TLS.

              The TLS session will be initiated when EOF or a SIGALRM is received.

       --app-proto
              This is an alias for the --starttls-proto option.

       --starttls-proto=string
              The application protocol to be used to obtain the server's certificate (https, ftp, smtp, imap, ldap, xmpp).  This option must not
              appear in combination with any of the following options: starttls.

              Specify the application layer protocol for STARTTLS. If the protocol is supported, gnutls-cli will proceed to the TLS negotiation.

       -u, --udp
              Use DTLS (datagram TLS) over UDP.

       --mtu=number
              Set MTU for datagram TLS.  This option takes an integer number as its argument.  The value of number is constrained to being:
                  in the range  0 through 17000

       --crlf Send CR LF instead of LF.

       --x509fmtder
              Use DER format for certificates to read from.

       -f, --fingerprint
              Send the openpgp fingerprint, instead of the key.

       --print-cert
              Print peer's certificate in PEM format.

       --save-cert=string
              Save the peer's certificate chain in the specified file in PEM format.

       --save-ocsp=string
              Save the peer's OCSP status response in the provided file.

       --dh-bits=number
              The minimum number of bits allowed for DH.  This option takes an integer number as its argument.

              This option sets the minimum number of bits allowed for a Diffie-Hellman key exchange. You may want to lower the default value if
              the peer sends a weak prime and you get an connection error with unacceptable prime.

       --priority=string
              Priorities string.

              TLS algorithms and protocols to enable. You can use predefined sets of ciphersuites such as PERFORMANCE, NORMAL, PFS, SECURE128,
              SECURE256. The default is NORMAL.

              Check  the  GnuTLS  manual  on  section  “Priority strings” for more information on the allowed keywords

       --x509cafile=string
              Certificate file or PKCS #11 URL to use.

       --x509crlfile=file
              CRL file to use.

       --pgpkeyfile=file
              PGP Key file to use.

       --pgpkeyring=file
              PGP Key ring file to use.

       --pgpcertfile=file
              PGP Public Key (certificate) file to use.  This option must appear in combination with the following options: pgpkeyfile.

       --x509keyfile=string
              X.509 key file or PKCS #11 URL to use.

       --x509certfile=string
              X.509 Certificate file or PKCS #11 URL to use.  This option must appear in combination with the following options: x509keyfile.

       --pgpsubkey=string
              PGP subkey to use (hex or auto).

       --srpusername=string
              SRP username to use.

       --srppasswd=string
              SRP password to use.

       --pskusername=string
              PSK username to use.

       --pskkey=string
              PSK key (in hex) to use.

       -p string, --port=string
              The port or service to connect to.

       --insecure
              Don't abort program if server certificate can't be validated.

       --ranges
              Use length-hiding padding to prevent traffic analysis.

              When possible (e.g., when using CBC ciphersuites), use length-hiding padding to prevent traffic analysis.

       --benchmark-ciphers
              Benchmark individual ciphers.

              By default the benchmarked ciphers will utilize any capabilities of the local CPU to improve performance. To test against the raw
              software implementation set the environment variable GNUTLS_CPUID_OVERRIDE to 0x1.

       --benchmark-tls-kx
              Benchmark TLS key exchange methods.

       --benchmark-tls-ciphers
              Benchmark TLS ciphers.

              By default the benchmarked ciphers will utilize any capabilities of the local CPU to improve performance. To test against the raw
              software implementation set the environment variable GNUTLS_CPUID_OVERRIDE to 0x1.

       -l, --list
              Print a list of the supported algorithms and modes.  This option must not appear in combination with any of the following options:
              port.

              Print a list of the supported algorithms and modes. If a priority string is given then only the enabled ciphersuites are shown.

       --priority-list
              Print a list of the supported priority strings.

              Print a list of the supported priority strings. The ciphersuites corresponding to each priority string can be examined using -l -p.

       --noticket
              Don't allow session tickets.

       --srtp-profiles=string
              Offer SRTP profiles.

       --alpn=string
              Application layer protocol.  This option may appear an unlimited number of times.

              This option will set and enable the Application Layer Protocol Negotiation  (ALPN) in the TLS protocol.

       -b, --heartbeat
              Activate heartbeat support.

       --recordsize=number
              The maximum record size to advertize.  This option takes an integer number as its argument.  The value of number is constrained to
              being:
                  in the range  0 through 4096

       --disable-sni
              Do not send a Server Name Indication (SNI).

       --disable-extensions
              Disable all the TLS extensions.

              This option disables all TLS extensions. Deprecated option. Use the priority string.

       --inline-commands
              Inline commands of the form ^<cmd>^.

              Enable inline commands of the form ^<cmd>^. The inline commands are expected to be in a line by themselves. The available commands
              are: resume and renegotiate.

       --inline-commands-prefix=string
              Change the default delimiter for inline commands..

              Change the default delimiter (^) used for inline commands. The delimiter is expected to be a single US-ASCII character (octets 0 -
              127). This option is only relevant if inline commands are enabled via the inline-commands option

       --provider=file
              Specify the PKCS #11 provider library.

              This will override the default options in /etc/gnutls/pkcs11.conf

       --fips140-mode
              Reports the status of the FIPS140-2 mode in gnutls library.

       -h, --help
              Display usage information and exit.

       -!, --more-help
              Pass the extended usage information through a pager.

       -v [{v|c|n --version [{v|c|n}]}]
              Output version of program and exit.  The default mode is `v', a simple version.  The `c' mode will print copyright information and
              `n' will print the full copyright notice.

EXAMPLES
       Connecting using PSK authentication
       To connect to a server using PSK authentication, you need to enable the choice of PSK by using a cipher priority parameter such as in the
       example below.
           $ ./gnutls-cli -p 5556 localhost --pskusername psk_identity     --pskkey 88f3824b3e5659f52d00e959bacab954b6540344     --priority NORMAL:-KX-ALL:+ECDHE-PSK:+DHE-PSK:+PSK
           Resolving 'localhost'...
           Connecting to '127.0.0.1:5556'...
           - PSK authentication.
           - Version: TLS1.1
           - Key Exchange: PSK
           - Cipher: AES-128-CBC
           - MAC: SHA1
           - Compression: NULL
           - Handshake was completed
           - Simple Client Mode:
       By keeping the --pskusername parameter and removing the --pskkey parameter, it will query only for the password during the handshake.

       Listing ciphersuites in a priority string
       To list the ciphersuites in a priority string:
           $ ./gnutls-cli --priority SECURE192 -l
           Cipher suites for SECURE192
           TLS_ECDHE_ECDSA_AES_256_CBC_SHA384         0xc0, 0x24  TLS1.2
           TLS_ECDHE_ECDSA_AES_256_GCM_SHA384         0xc0, 0x2e  TLS1.2
           TLS_ECDHE_RSA_AES_256_GCM_SHA384           0xc0, 0x30  TLS1.2
           TLS_DHE_RSA_AES_256_CBC_SHA256             0x00, 0x6b  TLS1.2
           TLS_DHE_DSS_AES_256_CBC_SHA256             0x00, 0x6a  TLS1.2
           TLS_RSA_AES_256_CBC_SHA256                 0x00, 0x3d  TLS1.2

           Certificate types: CTYPE-X.509
           Protocols: VERS-TLS1.2, VERS-TLS1.1, VERS-TLS1.0, VERS-SSL3.0, VERS-DTLS1.0
           Compression: COMP-NULL
           Elliptic curves: CURVE-SECP384R1, CURVE-SECP521R1
           PK-signatures: SIGN-RSA-SHA384, SIGN-ECDSA-SHA384, SIGN-RSA-SHA512, SIGN-ECDSA-SHA512

       Connecting using a PKCS #11 token
       To connect to a server using a certificate and a private key present in a PKCS #11 token you need to substitute the PKCS 11 URLs in the
       x509certfile and x509keyfile parameters.

       Those can be found using "p11tool --list-tokens" and then listing all the objects in the needed token, and using the appropriate.
           $ p11tool --list-tokens

           Token 0:
           URL: pkcs11:model=PKCS15;manufacturer=MyMan;serial=1234;token=Test
           Label: Test
           Manufacturer: EnterSafe
           Model: PKCS15
           Serial: 1234

           $ p11tool --login --list-certs "pkcs11:model=PKCS15;manufacturer=MyMan;serial=1234;token=Test"

           Object 0:
           URL: pkcs11:model=PKCS15;manufacturer=MyMan;serial=1234;token=Test;object=client;type=cert
           Type: X.509 Certificate
           Label: client
           ID: 2a:97:0d:58:d1:51:3c:23:07:ae:4e:0d:72:26:03:7d:99:06:02:6a

           $ MYCERT="pkcs11:model=PKCS15;manufacturer=MyMan;serial=1234;token=Test;object=client;type=cert"
           $ MYKEY="pkcs11:model=PKCS15;manufacturer=MyMan;serial=1234;token=Test;object=client;type=private"
           $ export MYCERT MYKEY

           $ gnutls-cli www.example.com --x509keyfile $MYKEY --x509certfile $MYCERT
       Notice that the private key only differs from the certificate in the type.

EXIT STATUS
       One of the following exit values will be returned:

       0  (EXIT_SUCCESS)
              Successful program execution.

       1  (EXIT_FAILURE)
              The operation failed or the command syntax was not valid.

       70  (EX_SOFTWARE)
              libopts had an internal operational error.  Please report it to autogen-users@lists.sourceforge.net.  Thank you.

SEE ALSO
       gnutls-cli-debug(1), gnutls-serv(1)

AUTHORS
       Nikos Mavrogiannopoulos, Simon Josefsson and others; see /usr/share/doc/gnutls/AUTHORS for a complete list.

COPYRIGHT
       Copyright (C) 2000-2016 Free Software Foundation, and others all rights reserved.  This program is released under the terms of the GNU Gen‐
       eral Public License, version 3 or later.

BUGS
       Please send bug reports to: bugs@gnutls.org

NOTES
       This manual page was AutoGen-erated from the gnutls-cli option definitions.

3.4.10                                                              2019-05-28                                                       gnutls-cli(1)
