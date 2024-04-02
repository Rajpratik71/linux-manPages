NSS-POLICY-CHECK(1)                                                                           NSS Security Tools                                                                          NSS-POLICY-CHECK(1)



NAME
       nss-policy-check - nss-policy-check policy-file

SYNOPSIS
       nss-policy-check

DESCRIPTION
       nss-policy-check verifies crypto-policy configuration that controls certain crypto algorithms are allowed/disallowed to use in the NSS library.

       The crypto-policy configuration can be stored in either a system-wide configuration file, specified with the POLICY_PATH and POLICY_FILE build options, or in the pkcs11.txt in NSS database.

USAGE AND EXAMPLES
       To check the global crypto-policy configuration in /etc/crypto-policies/back-ends/nss.config:

           $ nss-policy-check /etc/crypto-policies/back-ends/nss.config
           NSS-POLICY-INFO: LOADED-SUCCESSFULLY
           NSS-POLICY-INFO: PRIME256V1 is enabled for KX
           NSS-POLICY-INFO: PRIME256V1 is enabled for CERT-SIGNATURE
           NSS-POLICY-INFO: SECP256R1 is enabled for KX
           NSS-POLICY-INFO: SECP256R1 is enabled for CERT-SIGNATURE
           NSS-POLICY-INFO: SECP384R1 is enabled for KX
           NSS-POLICY-INFO: SECP384R1 is enabled for CERT-SIGNATURE
           ...
           NSS-POLICY-INFO: NUMBER-OF-SSL-ALG-KX: 13
           NSS-POLICY-INFO: NUMBER-OF-SSL-ALG: 9
           NSS-POLICY-INFO: NUMBER-OF-CERT-SIG: 9
           ...
           NSS-POLICY-INFO: ciphersuite TLS_AES_128_GCM_SHA256 is enabled
           NSS-POLICY-INFO: ciphersuite TLS_CHACHA20_POLY1305_SHA256 is enabled
           NSS-POLICY-INFO: ciphersuite TLS_AES_256_GCM_SHA384 is enabled
           ...
           NSS-POLICY-INFO: NUMBER-OF-CIPHERSUITES: 24
           NSS-POLICY-INFO: NUMBER-OF-TLS-VERSIONS: 3
           NSS-POLICY-INFO: NUMBER-OF-DTLS-VERSIONS: 2


       If there is a failure or warning, it will be prefixed with NSS-POLICY-FAIL or NSS-POLICY_WARN.

       nss-policy-check exits with 2 if any failure is found, 1 if any warning is found, or 0 if no errors are found.

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



nss-tools 3.44.0                                                                                 Nov 13 2013                                                                              NSS-POLICY-CHECK(1)
