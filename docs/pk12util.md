PK12UTIL(1)                                                                                   NSS Security Tools                                                                                  PK12UTIL(1)



NAME
       pk12util - Export and import keys and certificate to or from a PKCS #12 file and the NSS database

SYNOPSIS
       pk12util [-i p12File|-l p12File|-o p12File] [-d [sql:]directory] [-h tokenname] [-P dbprefix] [-r] [-v] [-k slotPasswordFile|-K slotPassword] [-w p12filePasswordFile|-W p12filePassword]

STATUS
       This documentation is still work in progress. Please contribute to the initial review in Mozilla NSS bug 836477[1]

DESCRIPTION
       The PKCS #12 utility, pk12util, enables sharing certificates among any server that supports PKCS #12. The tool can import certificates and keys from PKCS #12 files into security databases, export
       certificates, and list certificates and keys.

OPTIONS AND ARGUMENTS
       Options

       -i p12file
           Import keys and certificates from a PKCS #12 file into a security database.

       -l p12file
           List the keys and certificates in PKCS #12 file.

       -o p12file
           Export keys and certificates from the security database to a PKCS #12 file.

       Arguments

       -c keyCipher
           Specify the key encryption algorithm.

       -C certCipher
           Specify the certiticate encryption algorithm.

       -d [sql:]directory
           Specify the database directory into which to import to or export from certificates and keys.

           pk12util supports two types of databases: the legacy security databases (cert8.db, key3.db, and secmod.db) and new SQLite databases (cert9.db, key4.db, and pkcs11.txt). If the prefix sql: is not
           used, then the tool assumes that the given databases are in the old format.

       -h tokenname
           Specify the name of the token to import into or export from.

       -k slotPasswordFile
           Specify the text file containing the slot's password.

       -K slotPassword
           Specify the slot's password.

       -m | --key-len keyLength
           Specify the desired length of the symmetric key to be used to encrypt the private key.

       --cert-key-len certKeyLength
           Specify the desired length of the symmetric key to be used to encrypt the certificates and other meta-data.

       -n certname
           Specify the nickname of the cert and private key to export.

           The nickname can also be a PKCS #11 URI. For example, if you have a certificate named "my-server-cert" on the internal certificate store, it can be unambiguously specified as
           "pkcs11:token=NSS%20Certificate%20DB;object=my-server-cert". For details about the format, see RFC 7512.

       -P prefix
           Specify the prefix used on the certificate and key databases. This option is provided as a special case. Changing the names of the certificate and key databases is not recommended.

       -r
           Dumps all of the data in raw (binary) form. This must be saved as a DER file. The default is to return information in a pretty-print ASCII format, which displays the information about the
           certificates and public keys in the p12 file.

       -v
           Enable debug logging when importing.

       -w p12filePasswordFile
           Specify the text file containing the pkcs #12 file password.

       -W p12filePassword
           Specify the pkcs #12 file password.

RETURN CODES
       ·   0 - No error

       ·   1 - User Cancelled

       ·   2 - Usage error

       ·   6 - NLS init error

       ·   8 - Certificate DB open error

       ·   9 - Key DB open error

       ·   10 - File initialization error

       ·   11 - Unicode conversion error

       ·   12 - Temporary file creation error

       ·   13 - PKCS11 get slot error

       ·   14 - PKCS12 decoder start error

       ·   15 - error read from import file

       ·   16 - pkcs12 decode error

       ·   17 - pkcs12 decoder verify error

       ·   18 - pkcs12 decoder validate bags error

       ·   19 - pkcs12 decoder import bags error

       ·   20 - key db conversion version 3 to version 2 error

       ·   21 - cert db conversion version 7 to version 5 error

       ·   22 - cert and key dbs patch error

       ·   23 - get default cert db error

       ·   24 - find cert by nickname error

       ·   25 - create export context error

       ·   26 - PKCS12 add password itegrity error

       ·   27 - cert and key Safes creation error

       ·   28 - PKCS12 add cert and key error

       ·   29 - PKCS12 encode error

EXAMPLES
       Importing Keys and Certificates

       The most basic usage of pk12util for importing a certificate or key is the PKCS #12 input file (-i) and some way to specify the security database being accessed (either -d for a directory or -h for
       a token).

       pk12util -i p12File [-h tokenname] [-v] [-d [sql:]directory] [-P dbprefix] [-k slotPasswordFile|-K slotPassword] [-w p12filePasswordFile|-W p12filePassword]

       For example:

           # pk12util -i /tmp/cert-files/users.p12 -d sql:/home/my/sharednssdb

           Enter a password which will be used to encrypt your keys.
           The password should be at least 8 characters long,
           and should contain at least one non-alphabetic character.

           Enter new password:
           Re-enter password:
           Enter password for PKCS12 file:
           pk12util: PKCS12 IMPORT SUCCESSFUL

       Exporting Keys and Certificates

       Using the pk12util command to export certificates and keys requires both the name of the certificate to extract from the database (-n) and the PKCS #12-formatted output file to write to. There are
       optional parameters that can be used to encrypt the file to protect the certificate material.

       pk12util -o p12File -n certname [-c keyCipher] [-C certCipher] [-m|--key_len keyLen] [-n|--cert_key_len certKeyLen] [-d [sql:]directory] [-P dbprefix] [-k slotPasswordFile|-K slotPassword] [-w
       p12filePasswordFile|-W p12filePassword]

       For example:

           # pk12util -o certs.p12 -n Server-Cert -d sql:/home/my/sharednssdb
           Enter password for PKCS12 file:
           Re-enter password:

       Listing Keys and Certificates

       The information in a .p12 file are not human-readable. The certificates and keys in the file can be printed (listed) in a human-readable pretty-print format that shows information for every
       certificate and any public keys in the .p12 file.

       pk12util -l p12File [-h tokenname] [-r] [-d [sql:]directory] [-P dbprefix] [-k slotPasswordFile|-K slotPassword] [-w p12filePasswordFile|-W p12filePassword]

       For example, this prints the default ASCII output:

           # pk12util -l certs.p12

           Enter password for PKCS12 file:
           Key(shrouded):
               Friendly Name: Thawte Freemail Member's Thawte Consulting (Pty) Ltd. ID

               Encryption algorithm: PKCS #12 V2 PBE With SHA-1 And 3KEY Triple DES-CBC
                   Parameters:
                       Salt:
                           45:2e:6a:a0:03:4d:7b:a1:63:3c:15:ea:67:37:62:1f
                       Iteration Count: 1 (0x1)
           Certificate:
               Data:
                   Version: 3 (0x2)
                   Serial Number: 13 (0xd)
                   Signature Algorithm: PKCS #1 SHA-1 With RSA Encryption
                   Issuer: "E=personal-freemail@thawte.com,CN=Thawte Personal Freemail C
                       A,OU=Certification Services Division,O=Thawte Consulting,L=Cape T
                       own,ST=Western Cape,C=ZA"


       Alternatively, the -r prints the certificates and then exports them into separate DER binary files. This allows the certificates to be fed to another application that supports .p12 files. Each
       certificate is written to a sequentially-number file, beginning with file0001.der and continuing through file000N.der, incrementing the number for every certificate:

           pk12util -l test.p12 -r
           Enter password for PKCS12 file:
           Key(shrouded):
               Friendly Name: Thawte Freemail Member's Thawte Consulting (Pty) Ltd. ID

               Encryption algorithm: PKCS #12 V2 PBE With SHA-1 And 3KEY Triple DES-CBC
                   Parameters:
                       Salt:
                           45:2e:6a:a0:03:4d:7b:a1:63:3c:15:ea:67:37:62:1f
                       Iteration Count: 1 (0x1)
           Certificate    Friendly Name: Thawte Personal Freemail Issuing CA - Thawte Consulting

           Certificate    Friendly Name: Thawte Freemail Member's Thawte Consulting (Pty) Ltd. ID


PASSWORD ENCRYPTION
       PKCS #12 provides for not only the protection of the private keys but also the certificate and meta-data associated with the keys. Password-based encryption is used to protect private keys on export
       to a PKCS #12 file and, optionally, the associated certificates. If no algorithm is specified, the tool defaults to using PKCS #12 SHA-1 and 3-key triple DES for private key encryption. When not in
       FIPS mode, PKCS #12 SHA-1 and 40-bit RC4 is used for certificate encryption. When in FIPS mode, there is no certificate encryption. If certificate encryption is not wanted, specify "NONE" as the
       argument of the -C option.

       The private key is always protected with strong encryption by default.

       Several types of ciphers are supported.

       PKCS #5 password-based encryption

           ·   PBES2 with AES-CBC-Pad as underlying encryption scheme ("AES-128-CBC", "AES-192-CBC", and "AES-256-CBC")

       PKCS #12 password-based encryption

           ·   SHA-1 and 128-bit RC4 ("PKCS #12 V2 PBE With SHA-1 And 128 Bit RC4" or "RC4")

           ·   SHA-1 and 40-bit RC4 ("PKCS #12 V2 PBE With SHA-1 And 40 Bit RC4") (used by default for certificate encryption in non-FIPS mode)

           ·   SHA-1 and 3-key triple-DES ("PKCS #12 V2 PBE With SHA-1 And 3KEY Triple DES-CBC" or "DES-EDE3-CBC")

           ·   SHA-1 and 128-bit RC2 ("PKCS #12 V2 PBE With SHA-1 And 128 Bit RC2 CBC" or "RC2-CBC")

           ·   SHA-1 and 40-bit RC2 ("PKCS #12 V2 PBE With SHA-1 And 40 Bit RC2 CBC")

       With PKCS #12, the crypto provider may be the soft token module or an external hardware module. If the cryptographic module does not support the requested algorithm, then the next best fit will be
       selected (usually the default). If no suitable replacement for the desired algorithm can be found, the tool returns the error no security module can perform the requested operation.

NSS DATABASE TYPES
       NSS originally used BerkeleyDB databases to store security information. The last versions of these legacy databases are:

       ·   cert8.db for certificates

       ·   key3.db for keys

       ·   secmod.db for PKCS #11 module information

       BerkeleyDB has performance limitations, though, which prevent it from being easily used by multiple applications simultaneously. NSS has some flexibility that allows applications to use their own,
       independent database engine while keeping a shared database and working around the access issues. Still, NSS requires more flexibility to provide a truly shared security database.

       In 2009, NSS introduced a new set of databases that are SQLite databases rather than BerkleyDB. These new databases provide more accessibility and performance:

       ·   cert9.db for certificates

       ·   key4.db for keys

       ·   pkcs11.txt, which is listing of all of the PKCS #11 modules contained in a new subdirectory in the security databases directory

       Because the SQLite databases are designed to be shared, these are the shared database type. The shared database type is preferred; the legacy format is included for backward compatibility.

       By default, the tools (certutil, pk12util, modutil) assume that the given security databases follow the more common legacy type. Using the SQLite databases must be manually specified by using the
       sql: prefix with the given security directory. For example:

           # pk12util -i /tmp/cert-files/users.p12 -d sql:/home/my/sharednssdb

       To set the shared database type as the default type for the tools, set the NSS_DEFAULT_DB_TYPE environment variable to sql:

           export NSS_DEFAULT_DB_TYPE="sql"

       This line can be set added to the ~/.bashrc file to make the change permanent.

       Most applications do not use the shared database by default, but they can be configured to use them. For example, this how-to article covers how to configure Firefox and Thunderbird to use the new
       shared NSS databases:

       ·   https://wiki.mozilla.org/NSS_Shared_DB_Howto

       For an engineering draft on the changes in the shared NSS databases, see the NSS project wiki:

       ·   https://wiki.mozilla.org/NSS_Shared_DB

COMPATIBILITY NOTES
       The exporting behavior of pk12util has changed over time, while importing files exported with older versions of NSS is still supported.

       Until the 3.30 release, pk12util used the UTF-16 encoding for the PKCS #5 password-based encryption schemes, while the recommendation is to encode passwords in UTF-8 if the used encryption scheme is
       defined outside of the PKCS #12 standard.

       Until the 3.31 release, even when "AES-128-CBC" or "AES-192-CBC" is given from the command line, pk12util always used 256-bit AES as the underlying encryption scheme.

       For historical reasons, pk12util accepts password-based encryption schemes not listed in this document. However, those schemes are not officially supported and may have issues in interoperability
       with other tools.

SEE ALSO
       certutil (1)

       modutil (1)

       The NSS wiki has information on the new database design and how to configure applications to use it.

       ·   https://wiki.mozilla.org/NSS_Shared_DB_Howto

       ·   https://wiki.mozilla.org/NSS_Shared_DB

ADDITIONAL RESOURCES
       For information about NSS and other tools related to NSS (like JSS), check out the NSS project wiki at http://www.mozilla.org/projects/security/pki/nss/. The NSS site relates directly to NSS code
       changes and releases.

       Mailing lists: https://lists.mozilla.org/listinfo/dev-tech-crypto

       IRC: Freenode at #dogtag-pki

AUTHORS
       The NSS tools were written and maintained by developers with Netscape, Red Hat, Sun, Oracle, Mozilla, and Google.

       Authors: Elio Maldonado <emaldona@redhat.com>, Deon Lackey <dlackey@redhat.com>.

LICENSE
       Licensed under the Mozilla Public License, v. 2.0. If a copy of the MPL was not distributed with this file, You can obtain one at http://mozilla.org/MPL/2.0/.

NOTES
        1. Mozilla NSS bug 836477
           https://bugzilla.mozilla.org/show_bug.cgi?id=836477



nss-tools 3.44.0                                                                                 Nov 13 2013                                                                                      PK12UTIL(1)
