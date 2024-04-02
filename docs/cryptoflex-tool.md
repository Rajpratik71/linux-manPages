CRYPTOFLEX-TOOL(1)                                                                               OpenSC Tools                                                                              CRYPTOFLEX-TOOL(1)



NAME
       cryptoflex-tool - utility for manipulating Schlumberger Cryptoflex data structures

SYNOPSIS
       cryptoflex-tool [OPTIONS]

DESCRIPTION
       cryptoflex-tool is used to manipulate PKCS data structures on Schlumberger Cryptoflex smart cards. Users can create, list and read PINs and keys stored on the smart card. User PIN authentication is
       performed for those operations that require it.

OPTIONS
       --app-df num, -a num
           Specifies the DF to operate in

       --create-key-files arg, -c arg
           Creates new RSA key files for arg keys

       --create-pin-files id, -P id
           Creates new PIN file for CHVid

       --exponent exp, -e exp
           Specifies the RSA exponent, exp, to use in key generation. The default value is 3.

       --generate-key, -g
           Generate a new RSA key pair

       --key-num num, -k num
           Specifies the key number to operate on. The default is key number 1.

       --list-keys, -l
           Lists all keys stored in a public key file

       --modulus-length length, -m length
           Specifies the modulus length to use in key generation. The default value is 1024.

       --prkey-file id, -p id
           Specifies the private key file id, id, to use

       --pubkey-file id, -u id
           Specifies the public key file id, id, to use

       --read-key
           Reads a public key from the card, allowing the user to extract and store or use the public key

       --reader num, -r num
           Forces cryptoflex-tool to use reader number num for operations. The default is to use reader number 0, the first reader in the system.

       --verbose, -v
           Causes cryptoflex-tool to be more verbose. Specify this flag several times to enable debug output in the opensc library.

       --verify-pin, -V
           Verifies CHV1 before issuing commands

SEE ALSO
       pkcs15-tool(1)



opensc                                                                                            10/08/2014                                                                               CRYPTOFLEX-TOOL(1)
