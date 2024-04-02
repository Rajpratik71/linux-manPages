PKCS11-TOOL(1)                                                                                   OpenSC Tools                                                                                  PKCS11-TOOL(1)



NAME
       pkcs11-tool - utility for managing and using PKCS #11 security tokens

SYNOPSIS
       pkcs11-tool [OPTIONS]

DESCRIPTION
       The pkcs11-tool utility is used to manage the data objects on smart cards and similar PKCS #11 security tokens. Users can list and read PINs, keys and certificates stored on the token. User PIN
       authentication is performed for those operations that require it.

OPTIONS
       --attr-from path
           Extract information from path (DER-encoded certificate file) and create the corresponding attributes when writing an object to the token. Example: the certificate subject name is used to create
           the CKA_SUBJECT attribute.

       --change-pin, -c
           Change the user PIN on the token

       --hash, -h
           Hash some data.

       --id id, -d id
           Specify the id of the object to operate on.

       --init-pin
           Initializes the user PIN. This option differs from --change-pin in that it sets the user PIN for the first time. Once set, the user PIN can be changed using --change-pin.

       --init-token
           Initialize a token: set the token label as well as a Security Officer PIN (the label must be specified using --label).

       --input-file path, -i path
           Specify the path to a file for input.

       --keypairgen, -k
           Generate a new key pair (public and private pair.)

       --label name, -a name
           Specify the name of the object to operate on (or the token label when --init-token is used).

       --list-mechanisms, -M
           Display a list of mechanisms supported by the token.

       --list-objects, -O
           Display a list of objects.

       --list-slots, -L
           Display a list of available slots on the token.

       --login, -l
           Authenticate to the token before performing other operations. This option is not needed if a PIN is provided on the command line.

       --mechanism mechanism, -m mechanism
           Use the specified mechanism for token operations. See -M for a list of mechanisms supported by your token.

       --module mod
           Specify a PKCS#11 module (or library) to load.

       --moz-cert path, -z path
           Test a Mozilla-like keypair generation and certificate request. Specify the path to the certificate file.

       --output-file path, -o path
           Specify the path to a file for output.

       --pin pin, -p pin
           Use the given pin for token operations. WARNING: Be careful using this option as other users may be able to read the command line from the system or if it is embedded in a script.

           This option will also set the --login option.

       --set-id id, -e id
           Set the CKA_ID of the object.

       --show-info, -I
           Display general token information.

       --sign, -s
           Sign some data.

       --slot id
           Specify the id of the slot to use.

       --slot-description description
           Specify the description of the slot to use.

       --slot-index index
           Specify the index of the slot to use.

       --token-label label
           Specify the label of token. Will be used the first slot, that has the inserted token with this label.

       --so-pin pin
           Use the given pin as the Security Officer PIN for some token operations (token initialization, user PIN initialization, etc). The same warning as --pin also applies here.

       --test, -t
           Perform some tests on the token. This option is most useful when used with either --login or --pin.

       --type type, -y type
           Specify the type of object to operate on. Examples are cert, privkey and pubkey.

       --verbose, -v
           Cause pkcs11-tool to be more verbose.

           NB! This does not affect OpenSC debugging level! To set OpenSC PKCS#11 module into debug mode, set the OPENSC_DEBUG environment variable to a non-zero number.

       --write-object id, -w path
           Write a key or certificate object to the token.  path points to the DER-encoded certificate or key file.



opensc                                                                                            10/08/2014                                                                                   PKCS11-TOOL(1)
