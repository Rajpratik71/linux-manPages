ipa-server-certinstall(1)                                                                      IPA Manual Pages                                                                     ipa-server-certinstall(1)



NAME
       ipa-server-certinstall - Install new SSL server certificates

SYNOPSIS
       ipa-server-certinstall [OPTION]... FILE...

DESCRIPTION
       Replace the current Directory server SSL certificate, Apache server SSL certificate and/or Kerberos KDC certificate with the certificate in the specified files. The files are accepted in PEM and DER
       certificate, PKCS#7 certificate chain, PKCS#8 and raw private key and PKCS#12 formats.

       PKCS#12 is a file format used to safely transport SSL certificates and public/private keypairs.

       They may be generated and managed using the NSS pk12util command or the OpenSSL pkcs12 command.

       The service(s) are not automatically restarted. In order to use the newly installed certificate(s) you will need to manually restart the Directory, Apache and/or Krb5kdc servers.


OPTIONS
       -d, --dirsrv
              Install the certificate on the Directory Server

       -w, --http
              Install the certificate in the Apache Web Server

       -k, --kdc
              Install the certificate in the Kerberos KDC

       --pin=PIN
              The password to unlock the private key

       --cert-name=NAME
              Name of the certificate to install

       --dirman-password=DIRMAN_PASSWORD
              Directory Manager password

EXIT STATUS
       0 if the installation was successful

       1 if an error occurred



IPA                                                                                              Mar 14 2008                                                                        ipa-server-certinstall(1)
