ocsptool(1)                                                        User Commands                                                       ocsptool(1)

NAME
       ocsptool - GnuTLS OCSP tool

SYNOPSIS
       ocsptool [-flags] [-flag [value]] [--option-name[[=| ]value]]

       All arguments must be options.

DESCRIPTION
       Ocsptool is a program that can parse and print information about OCSP requests/responses, generate requests and verify responses.

OPTIONS
       -d number, --debug=number
              Enable debugging.  This option takes an integer number as its argument.  The value of number is constrained to being:
                  in the range  0 through 9999

              Specifies the debug level.

       -V, --verbose
              More verbose output.  This option may appear an unlimited number of times.

       --infile=file
              Input file.

       --outfile=string
              Output file.

       --ask [=server name|url]
              Ask an OCSP/HTTP server on a certificate validity.  This option must appear in combination with the following options: load-cert,
              load-issuer.

              Connects to the specified HTTP OCSP server and queries on the validity of the loaded certificate.

       -e, --verify-response
              Verify response.

       -i, --request-info
              Print information on a OCSP request.

       -j, --response-info
              Print information on a OCSP response.

       -q, --generate-request
              Generate an OCSP request.

       --nonce, - Fl -no-nonce
              Use (or not) a nonce to OCSP request.  The no-nonce form will disable the option.

       --load-issuer=file
              Read issuer certificate from file.

       --load-cert=file
              Read certificate to check from file.

       --load-trust=file
              Read OCSP trust anchors from file.  This option must not appear in combination with any of the following options: load-signer.

       --load-signer=file
              Read OCSP response signer from file.  This option must not appear in combination with any of the following options: load-trust.

       --inder, - Fl -no-inder
              Use DER format for input certificates and private keys.  The no-inder form will disable the option.

       -Q file, --load-request=file
              Read DER encoded OCSP request from file.

       -S file, --load-response=file
              Read DER encoded OCSP response from file.

       -h, --help
              Display usage information and exit.

       -!, --more-help
              Pass the extended usage information through a pager.

       -v [{v|c|n --version [{v|c|n}]}]
              Output version of program and exit.  The default mode is `v', a simple version.  The `c' mode will print copyright information and
              `n' will print the full copyright notice.

EXAMPLES
       Print information about an OCSP request

       To parse an OCSP request and print information about the content, the -i or --request-info parameter may be used as follows.  The -Q param‐
       eter specify the name of the file containing the OCSP request, and it should contain the OCSP request in binary DER format.

           $ ocsptool -i -Q ocsp-request.der

       The input file may also be sent to standard input like this:

           $ cat ocsp-request.der | ocsptool --request-info

       Print information about an OCSP response

       Similar to parsing OCSP requests, OCSP responses can be parsed using the -j or --response-info as follows.

           $ ocsptool -j -Q ocsp-response.der
           $ cat ocsp-response.der | ocsptool --response-info

       Generate an OCSP request

       The -q or --generate-request parameters are used to generate an OCSP request.  By default the OCSP request is written to standard output in
       binary DER format, but can be stored in a file using --outfile.  To generate an OCSP request the issuer of the certificate to check needs
       to be specified with --load-issuer and the certificate to check with --load-cert.  By default PEM format is used for these files, although
       --inder can be used to specify that the input files are in DER format.

           $ ocsptool -q --load-issuer issuer.pem --load-cert client.pem            --outfile ocsp-request.der

       When generating OCSP requests, the tool will add an OCSP extension containing a nonce.  This behaviour can be disabled by specifying
       --no-nonce.

       Verify signature in OCSP response

       To verify the signature in an OCSP response the -e or --verify-response parameter is used.  The tool will read an OCSP response in DER for‐
       mat from standard input, or from the file specified by --load-response.  The OCSP response is verified against a set of trust anchors,
       which are specified using --load-trust.  The trust anchors are concatenated certificates in PEM format.  The certificate that signed the
       OCSP response needs to be in the set of trust anchors, or the issuer of the signer certificate needs to be in the set of trust anchors and
       the OCSP Extended Key Usage bit has to be asserted in the signer certificate.

           $ ocsptool -e --load-trust issuer.pem            --load-response ocsp-response.der

       The tool will print status of verification.

       Verify signature in OCSP response against given certificate

       It is possible to override the normal trust logic if you know that a certain certificate is supposed to have signed the OCSP response, and
       you want to use it to check the signature.  This is achieved using --load-signer instead of --load-trust.  This will load one certificate
       and it will be used to verify the signature in the OCSP response.  It will not check the Extended Key Usage bit.

           $ ocsptool -e --load-signer ocsp-signer.pem            --load-response ocsp-response.der

       This approach is normally only relevant in two situations.  The first is when the OCSP response does not contain a copy of the signer cer‐
       tificate, so the --load-trust code would fail.  The second is if you want to avoid the indirect mode where the OCSP response signer cer‐
       tificate is signed by a trust anchor.

       Real-world example

       Here is an example of how to generate an OCSP request for a certificate and to verify the response.  For illustration we'll use the
       blog.josefsson.org host, which (as of writing) uses a certificate from CACert.  First we'll use gnutls-cli to get a copy of the server cer‐
       tificate chain.  The server is not required to send this information, but this particular one is configured to do so.

           $ echo | gnutls-cli -p 443 blog.josefsson.org --print-cert > chain.pem

       Use a text editor on chain.pem to create three files for each separate certificates, called cert.pem for the first certificate for the
       domain itself, secondly issuer.pem for the intermediate certificate and root.pem for the final root certificate.

       The domain certificate normally contains a pointer to where the OCSP responder is located, in the Authority Information Access Information
       extension.  For example, from certtool -i < cert.pem there is this information:

           Authority Information Access Information (not critical):
           Access Method: 1.3.6.1.5.5.7.48.1 (id-ad-ocsp)
           Access Location URI: http://ocsp.CAcert.org/

       This means the CA support OCSP queries over HTTP.  We are now ready to create a OCSP request for the certificate.

           $ ocsptool --ask ocsp.CAcert.org --load-issuer issuer.pem            --load-cert cert.pem --outfile ocsp-response.der

       The request is sent via HTTP to the OCSP server address specified. If the address is ommited ocsptool will use the address stored in the
       certificate.

EXIT STATUS
       One of the following exit values will be returned:

       0  (EXIT_SUCCESS)
              Successful program execution.

       1  (EXIT_FAILURE)
              The operation failed or the command syntax was not valid.

       70  (EX_SOFTWARE)
              libopts had an internal operational error.  Please report it to autogen-users@lists.sourceforge.net.  Thank you.

SEE ALSO
           certtool (1)

AUTHORS
       Nikos Mavrogiannopoulos, Simon Josefsson and others; see /usr/share/doc/gnutls/AUTHORS for a complete list.

COPYRIGHT
       Copyright (C) 2000-2016 Free Software Foundation, and others all rights reserved.  This program is released under the terms of the GNU Gen‐
       eral Public License, version 3 or later.

BUGS
       Please send bug reports to: bugs@gnutls.org

NOTES
       This manual page was AutoGen-erated from the ocsptool option definitions.

3.4.10                                                              2019-05-28                                                         ocsptool(1)
