GENKEY(1)                                                                                   Cryptography Utilities                                                                                  GENKEY(1)



NAME
       genkey - generate SSL certificates and certificate requests

SYNOPSIS
       genkey [--test] [--days count] [[--genreq] | [--makeca] | [--nss] | [--renew] | [--cacert]] {hostname}

DESCRIPTION
       genkey is an interactive command-line tool which can be used to generate SSL certificates or Certificate Signing Requests (CSR). Generated certificates are stored in the directory
       /etc/pki/tls/certs/, and the corresponding private key in /etc/pki/tls/private/.

       When using mod_nss the private key is stored in the nss database. Consult the nss.conf file in /etc/httpd/conf.d/ for the location of the database.

       genkey will prompt for the size of key desired; whether or not to generate a CSR; whether or not an encrypted private key is desired; the certificate subject DN details.

       genkey generates random data for the private key using the truerand library and also by prompting the user for entry of random text.

       nss indicates that mod_nss database should be used to store keys and certificates.

OPTIONS
       --makeca
           Generate a Certificate Authority keypair and certificate.

       --genreq
           Generate a Certificate Signing Request for an existing private key, which can be submitted to a CA (for example, for renewal).

       --renew
           Used with --genreq to indicate a renewal, the existing keypair will be used. Certs and keys must reside in the nss database, therefore --nss is also required. Pem file based cert renewal is not
           currently supported.

       --cacert
           The certificate renewal is for a CA, needed for openssl certs only.

       --days count
           When generating a self-signed certificate, specify that the number of days for which the certificate is valid be count rather than the default value of 30.

       --test
           For test purposes only; omit the slow process of generating random data.

EXAMPLES
       The following example will create a self-signed certificate and private key for the hostname www.example.com:

                   # genkey --days 120 www.example.com


       The following example will create a self-signed certificate and private key for the hostname www.nssexample.com which will be stored in cert and key in the nss database. If no nickname is given the
       tool will extract it from mod_nss's nss configuration file.

                   # genkey --days --nss 120 www.nssexample.com


       The following example will generate a certificate signing request for a new mod_nss style cert specified by its nickname, Server-Cert:

                   # genkey --genreq --nss --days 120 Server-Cert


       The following example will generate a certificate signing request for the renewal of an existing mod_nss cert specified by its nickname, Server-Cert:

                   # genkey --genreq --renew --nss --days 120 Server-Cert



FILES
       /etc/pki/tls/openssl.cnf

SEE ALSO
       certwatch(1), keyrand(1)



crypto-utils 2.4.1                                                                               9 June 2014                                                                                        GENKEY(1)
