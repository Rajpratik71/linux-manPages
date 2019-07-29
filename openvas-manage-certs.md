OPENVAS-MANAGE-CERTS(1)                 User manual for the Open Vulnerability Assessment System (OpenVAS)                 OPENVAS-MANAGE-CERTS(1)

NAME
       openvas-manage-certs - manage certificate infrastructure for an OpenVAS installation

SYNOPSIS
       openvas-manage-certs [OPTION]...

DESCRIPTION
       openvas-manage-certs  manages  the  certificate infrastructure for an OpenVAS installation.  The certificate infrastructure enables OpenVAS
       daemons to communicate in a secure manner and is used for authentication and authorization before establishing TLS connections between  the
       daemons.

       The  OpenVAS  certificate infrastructure consists of a certificate authority (CA) which is trusted by all OpenVAS daemons.  This CA is then
       used to sign certificates used by the various daemons.  The certificates can be divided into two use cases:

       ·  Server certificates, primarily used for authentication

       ·  Client certificates, primarily used for authorization

       openvas-manage-certs can perform an automatic creation of a default certificate infrastructure for a standard OpenVAS installation.  It can
       also verify an existing infrastructure and perform various certificate related tasks to support the setup of a more complex infrastructure.

OPTIONS
   Certificate infrastructure management
       -a     Automatically set up default infrastructure for OpenVAS

       -V     Verify existing OpenVAS certificate infrastructure

       -C     Create a certificate authority (CA)

       -R     Create a certificate request for a CA

       -r     Create a certificate request for a CA and sign it

       -C     Create a certificate authority (CA)

       -I     Install a CA certificate

       -c     Create a certificate request and sign it

       -i     Install a certificate

       -S     Sign a certificate request

       -f     Force overwriting of existing files

   Certificate options
       -E     Create a server certificate.  This sets the appropriate key usage constraints for a server certificate.

       -L     Create a client certificate.  This sets the appropriate key usage constraints for a client certificate.

       -A     Skip  CA  generation in automatic mode.  This automatically (re-)generates server and client certificates, but keeps the CA certifi‐
              cate.

   Configuration
       -e file Read configuration from file (see below for configuration details)

   Output control
       -d     Print debug output

       -v     Print verbose messages

       -q     Be quiet, only print error messages

   Other options
       -h     Print help

EXIT STATUS
       0      The requested operation was successfully performed.

       1      An error occurred, the requested operation could not be performed.

ENVIRONMENT
       All certificate generation options can be set either through the configuration file or through environment variables like the following:

       OPENVAS_CERTIFICATE_LIFETIME
              Days until the certificate will expire

       OPENVAS_CERTIFICATE_HOSTNAME
              Name to use for the certificate

       OPENVAS_CERTIFICATE_SIGNALG
              Hash algorithm to use for signing

       OPENVAS_CERTIFICATE_KEYSIZE
              Size in bits of the generated key

       OPENVAS_CERTIFICATE_SECPARAM
              GnuTLS security level [low|medium|high|ultra]

       OPENVAS_CERT_DIR
              Directory where keys and certificates are stored before installation

       OPENVAS_CERT_PREFIX
              Prefix for certificate filename (e.g. "server")

       For a complete list of options, please refer to the example configuration file included in the documentation.

SEE ALSO
       openvassd(8), openvasmd(8), gsad(8)

The OpenVAS Project                                                 2015-09-21                                             OPENVAS-MANAGE-CERTS(1)
