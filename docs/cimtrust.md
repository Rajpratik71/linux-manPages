cimtrust(8)                                                                                System Manager's Manual                                                                                cimtrust(8)



NAME
       cimtrust - Add, remove or list X509 certificates in a PEM format trust store.

SYNOPSIS
       cimtrust -a [ -U certuser ] -f file -T ( a | e | s )

       cimtrust -r -i issuer ( -n serialnumber | -S subject )

       cimtrust -l [ -i issuer [ -n serialnumber | -S subject ] ]

       cimtrust --help

       cimtrust --version


   Remarks
       The cimtrust command requires that the cimserver is running. This command operates on a truststore on the local system only.


DESCRIPTION
       The  add  option  of the cimtrust command adds an X509 certificate file of a specified type  to the truststore. The certuser specifies the username to be associated with the certificate in the file.
       If no certuser is specified, the certificate may not be used to authenticate a user.

       The remove option of the cimtrust command removes the X509 certificate(s) matching the specified issuer and either serialnumber or subject from the truststore.

       The list option of the cimtrust command lists the X509 certificates in the truststore. The list can be filtered by issuer and either serialnumber or subject.

       Certificates in the trust store may be revoked by adding a Certificate Revocation List to the CRL store. For more information on CRL operations see the cimcrl(8) command.

   Options
       cimtrust recognizes the following options:

              -a             Adds a certificate to the  truststore. If the specified file does not contain a valid X509 certificate an error message is returned and no action is taken. If the X509 certifi‐
                             cate already exists in the truststore, an error message is returned.

              -r             Removes  certificate(s)  from  the  truststore.  If  the  truststore contains multiple certificates matching the specified issuer and subject, all the matching certificates are
                             removed. If no certificate exists for the specified issuer and either serialnumber or subject , an error message is returned and no action is taken.

              -l             Displays the X509 certificates in the truststore.

              -f file        Specifies a PEM format file containing an X509 certificate.

              -U certuser    Specifies a username to be associated with the specified certificate.  The username specified should be a valid system user on the target system.

              -i issuer      Specifies the issuer name of the certificate.

              -n serialnumber
                             Specifies the serial number of the certificate.

              -S subject     Specifies the subject name of the certificate.

              -T ( a | e | s )
                             Specifies the type of a certificate. The type must be one of the following:

                             authority (a): root/intermediate authority certificates. Certificates of this type are added to the trusted certificate store.  The certuser is optional for authority  certifi‐
                             cates.  If no certuser is specified, the certificate may not be used to authenticate a user.

                             authority  issued  end-entity  (e):  Certificates of this type are not added to the trusted certificate store. The certuser is required for authority issued end-entity certifi‐
                             cates.

                             Self-signed identity certificate (s): Certificates of this type are added to the trusted certificate store. The certuser is required for self-signed identity certificates.

              --help         Displays the command help message.

              --version      Displays the CIM Server version.

EXIT STATUS
       When an error occurs, an error message is written to the standard error stream and a non-zero exit status value is returned. The following exit status values are defined:

              0      Success

              1      General error

              2      Connection failed

              3      Connection timed out

              4      Certificate already exists

              5      Certificate does not exist

              6      Invalid system user

EXAMPLES
       Add the X509 self-signed identity certificate in the cert.pem file and associate it to certuser guest. This certificate will be added to the trusted certificate store:

       cimtrust -a -U guest -f cert.pem -T s

       Add the X509 authority root CA certificate in the ca.pem file with no certuser association. This certificate will be added to the trusted certificate store but may not  be  used  to  authenticate  a
       user:

       cimtrust -a -f ca.pem -T a

       Add the X509 authority issued end-entity certificate in the user.pem file and associate it to certuser pegasus. This certificate may be used to authenticate user pegasus but will not be added to the
       trusted certificate store:

       cimtrust -a -f user.pem -U pegasus -T e

       Remove the certificate matching the specified issuer and serialnumber from the trust store:

       cimtrust -r -i "/C=US/ST=California/L=Cupertino/O=Smart & Secure/OU=Secure Software Division/CN=dev.admin.ss.com" -n 01

       Remove the certificate(s) matching the specified issuer and subject from the trust store:

       cimtrust -r -i "/C=US/ST=California/L=Cupertino/O=Smart & Secure/OU=Secure Software  Division/CN=dev.admin.ss.com"  -S  "/C=US/ST=California/L=Cupertino/O=Smart  &  Secure/OU=Secure  Software  Divi‐
       sion/CN=dev.admin.ss.com"

       List all the X509 certificates in the trust store:

       cimtrust -l


SEE ALSO
       cimserver(8), cimcrl(8), cimconfig(8).



                                                                                                                                                                                                  cimtrust(8)
