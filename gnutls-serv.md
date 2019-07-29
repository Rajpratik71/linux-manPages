gnutls-serv(1)                                                     User Commands                                                    gnutls-serv(1)

NAME
       gnutls-serv - GnuTLS server

SYNOPSIS
       gnutls-serv [-flags] [-flag [value]] [--option-name[[=| ]value]]

       All arguments must be options.

DESCRIPTION
       Server program that listens to incoming TLS connections.

OPTIONS
       -d number, --debug=number
              Enable debugging.  This option takes an integer number as its argument.  The value of number is constrained to being:
                  in the range  0 through 9999

              Specifies the debug level.

       --noticket
              Don't accept session tickets.

       -g, --generate
              Generate Diffie-Hellman parameters.

       -q, --quiet
              Suppress some messages.

       --nodb Do not use a resumption database.

       --http Act as an HTTP server.

       --echo Act as an Echo server.

       -u, --udp
              Use DTLS (datagram TLS) over UDP.

       --mtu=number
              Set MTU for datagram TLS.  This option takes an integer number as its argument.  The value of number is constrained to being:
                  in the range  0 through 17000

       --srtp-profiles=string
              Offer SRTP profiles.

       -a, --disable-client-cert
              Do not request a client certificate.

       -r, --require-client-cert
              Require a client certificate.

       --verify-client-cert
              If a client certificate is sent then verify it..

              Do not require, but if a client certificate is sent then verify it and close the connection if invalid.

       -b, --heartbeat
              Activate heartbeat support.

              Regularly ping client via heartbeat extension messages

       --x509fmtder
              Use DER format for certificates to read from.

       --priority=string
              Priorities string.

              TLS algorithms and protocols to enable. You can use predefined sets of ciphersuites such as PERFORMANCE, NORMAL, SECURE128,
              SECURE256. The default is NORMAL.

              Check  the  GnuTLS  manual  on  section  “Priority strings” for more information on allowed keywords

       --dhparams=file
              DH params file to use.

       --x509cafile=string
              Certificate file or PKCS #11 URL to use.

       --x509crlfile=file
              CRL file to use.

       --pgpkeyfile=file
              PGP Key file to use.

       --pgpkeyring=file
              PGP Key ring file to use.

       --pgpcertfile=file
              PGP Public Key (certificate) file to use.

       --x509keyfile=string
              X.509 key file or PKCS #11 URL to use.

       --x509certfile=string
              X.509 Certificate file or PKCS #11 URL to use.

       --x509dsakeyfile=string
              Alternative X.509 key file or PKCS #11 URL to use.

       --x509dsacertfile=string
              Alternative X.509 Certificate file or PKCS #11 URL to use.

       --x509ecckeyfile=string
              Alternative X.509 key file or PKCS #11 URL to use.

       --x509ecccertfile=string
              Alternative X.509 Certificate file or PKCS #11 URL to use.

       --pgpsubkey=string
              PGP subkey to use (hex or auto).

       --srppasswd=file
              SRP password file to use.

       --srppasswdconf=file
              SRP password configuration file to use.

       --pskpasswd=file
              PSK password file to use.

       --pskhint=string
              PSK identity hint to use.

       --ocsp-response=file
              The OCSP response to send to client.

              If the client requested an OCSP response, return data from this file to the client.

       -p number, --port=number
              The port to connect to.  This option takes an integer number as its argument.

       -l, --list
              Print a list of the supported algorithms and modes.

              Print a list of the supported algorithms and modes. If a priority string is given then only the enabled ciphersuites are shown.

       --provider=file
              Specify the PKCS #11 provider library.

              This will override the default options in /etc/gnutls/pkcs11.conf

       -h, --help
              Display usage information and exit.

       -!, --more-help
              Pass the extended usage information through a pager.

       -v [{v|c|n --version [{v|c|n}]}]
              Output version of program and exit.  The default mode is `v', a simple version.  The `c' mode will print copyright information and
              `n' will print the full copyright notice.

EXAMPLES
       Running your own TLS server based on GnuTLS can be useful when debugging clients and/or GnuTLS itself.  This section describes how to use
       gnutls-serv as a simple HTTPS server.

       The most basic server can be started as:

           gnutls-serv --http --priority "NORMAL:+ANON-ECDH:+ANON-DH"

       It will only support anonymous ciphersuites, which many TLS clients refuse to use.

       The next step is to add support for X.509.  First we generate a CA:

           $ certtool --generate-privkey > x509-ca-key.pem
           $ echo 'cn = GnuTLS test CA' > ca.tmpl
           $ echo 'ca' >> ca.tmpl
           $ echo 'cert_signing_key' >> ca.tmpl
           $ certtool --generate-self-signed --load-privkey x509-ca-key.pem   --template ca.tmpl --outfile x509-ca.pem

       Then generate a server certificate.  Remember to change the dns_name value to the name of your server host, or skip that command to avoid
       the field.

           $ certtool --generate-privkey > x509-server-key.pem
           $ echo 'organization = GnuTLS test server' > server.tmpl
           $ echo 'cn = test.gnutls.org' >> server.tmpl
           $ echo 'tls_www_server' >> server.tmpl
           $ echo 'encryption_key' >> server.tmpl
           $ echo 'signing_key' >> server.tmpl
           $ echo 'dns_name = test.gnutls.org' >> server.tmpl
           $ certtool --generate-certificate --load-privkey x509-server-key.pem   --load-ca-certificate x509-ca.pem --load-ca-privkey x509-ca-key.pem   --template server.tmpl --outfile x509-server.pem

       For use in the client, you may want to generate a client certificate as well.

           $ certtool --generate-privkey > x509-client-key.pem
           $ echo 'cn = GnuTLS test client' > client.tmpl
           $ echo 'tls_www_client' >> client.tmpl
           $ echo 'encryption_key' >> client.tmpl
           $ echo 'signing_key' >> client.tmpl
           $ certtool --generate-certificate --load-privkey x509-client-key.pem   --load-ca-certificate x509-ca.pem --load-ca-privkey x509-ca-key.pem   --template client.tmpl --outfile x509-client.pem

       To be able to import the client key/certificate into some applications, you will need to convert them into a PKCS#12 structure.  This also
       encrypts the security sensitive key with a password.

           $ certtool --to-p12 --load-ca-certificate x509-ca.pem   --load-privkey x509-client-key.pem --load-certificate x509-client.pem   --outder --outfile x509-client.p12

       For icing, we'll create a proxy certificate for the client too.

           $ certtool --generate-privkey > x509-proxy-key.pem
           $ echo 'cn = GnuTLS test client proxy' > proxy.tmpl
           $ certtool --generate-proxy --load-privkey x509-proxy-key.pem   --load-ca-certificate x509-client.pem --load-ca-privkey x509-client-key.pem   --load-certificate x509-client.pem --template proxy.tmpl   --outfile x509-proxy.pem

       Then start the server again:

           $ gnutls-serv --http             --x509cafile x509-ca.pem             --x509keyfile x509-server-key.pem             --x509certfile x509-server.pem

       Try connecting to the server using your web browser.  Note that the server listens to port 5556 by default.

       While you are at it, to allow connections using DSA, you can also create a DSA key and certificate for the server.  These credentials will
       be used in the final example below.

           $ certtool --generate-privkey --dsa > x509-server-key-dsa.pem
           $ certtool --generate-certificate --load-privkey x509-server-key-dsa.pem   --load-ca-certificate x509-ca.pem --load-ca-privkey x509-ca-key.pem   --template server.tmpl --outfile x509-server-dsa.pem

       The next step is to create OpenPGP credentials for the server.

           gpg --gen-key

       Make a note of the OpenPGP key identifier of the newly generated key, here it was 5D1D14D8.  You will need to export the key for GnuTLS to
       be able to use it.

           gpg -a --export 5D1D14D8 > openpgp-server.txt
           gpg --export 5D1D14D8 > openpgp-server.bin
           gpg --export-secret-keys 5D1D14D8 > openpgp-server-key.bin
           gpg -a --export-secret-keys 5D1D14D8 > openpgp-server-key.txt

       Let's start the server with support for OpenPGP credentials:

           gnutls-serv --http --priority NORMAL:+CTYPE-OPENPGP             --pgpkeyfile openpgp-server-key.txt             --pgpcertfile openpgp-server.txt

       The next step is to add support for SRP authentication. This requires an SRP password file created with srptool.  To start the server with
       SRP support:

           gnutls-serv --http --priority NORMAL:+SRP-RSA:+SRP             --srppasswdconf srp-tpasswd.conf             --srppasswd srp-passwd.txt

       Let's also start a server with support for PSK. This would require a password file created with psktool.

           gnutls-serv --http --priority NORMAL:+ECDHE-PSK:+PSK             --pskpasswd psk-passwd.txt

       Finally, we start the server with all the earlier parameters and you get this command:

           gnutls-serv --http --priority NORMAL:+PSK:+SRP:+CTYPE-OPENPGP             --x509cafile x509-ca.pem             --x509keyfile x509-server-key.pem             --x509certfile x509-server.pem             --x509dsakeyfile x509-server-key-dsa.pem             --x509dsacertfile x509-server-dsa.pem             --pgpkeyfile openpgp-server-key.txt             --pgpcertfile openpgp-server.txt             --srppasswdconf srp-tpasswd.conf             --srppasswd srp-passwd.txt             --pskpasswd psk-passwd.txt

EXIT STATUS
       One of the following exit values will be returned:

       0  (EXIT_SUCCESS)
              Successful program execution.

       1  (EXIT_FAILURE)
              The operation failed or the command syntax was not valid.

       70  (EX_SOFTWARE)
              libopts had an internal operational error.  Please report it to autogen-users@lists.sourceforge.net.  Thank you.

SEE ALSO
       gnutls-cli-debug(1), gnutls-cli(1)

AUTHORS
       Nikos Mavrogiannopoulos, Simon Josefsson and others; see /usr/share/doc/gnutls/AUTHORS for a complete list.

COPYRIGHT
       Copyright (C) 2000-2016 Free Software Foundation, and others all rights reserved.  This program is released under the terms of the GNU Gen‐
       eral Public License, version 3 or later.

BUGS
       Please send bug reports to: bugs@gnutls.org

NOTES
       This manual page was AutoGen-erated from the gnutls-serv option definitions.

3.4.10                                                              2019-05-28                                                      gnutls-serv(1)
