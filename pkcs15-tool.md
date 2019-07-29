PKCS15-TOOL(1)                                                                                   OpenSC Tools                                                                                  PKCS15-TOOL(1)



NAME
       pkcs15-tool - utility for manipulating PKCS #15 data structures on smart cards and similar security tokens

SYNOPSIS
       pkcs15-tool [OPTIONS]

DESCRIPTION
       The pkcs15-tool utility is used to manipulate the PKCS #15 data structures on smart cards and similar security tokens. Users can list and read PINs, keys and certificates stored on the token. User
       PIN authentication is performed for those operations that require it.

OPTIONS
       --aid aid
           Specify in a hexadecimal form the AID of the on-card PKCS#15 application to bind to.

       --auth-id pin, -a pin
           Specifies the auth id of the PIN to use for the operation. This is useful with the --change-pin operation.

       --change-pin
           Changes a PIN or PUK stored on the token. User authentication is required for this operation.

       --dump, -D
           Dump card objects.

       --learn-card, -L
           Cache PKCS #15 token data to the local filesystem. Subsequent operations are performed on the cached data where possible. If the cache becomes out-of-sync with the token state (eg. new key is
           generated and stored on the token), the cache should be updated or operations may show stale results.

       --list-applications
           List the on-card PKCS#15 applications

       --list-certificates, -c
           Lists all certificates stored on the token.

       --list-data-objects, -C
           Lists all data objects stored on the token. For some cards the PKCS#15 attributes of the private data objects are protected for reading and need the authentication with the User PIN. In such a
           case the --verify-pin option has to be used.

       --list-keys, -k
           Lists all private keys stored on the token. General information about each private key is listed (eg. key name, id and algorithm). Actual private key values are not displayed. For some cards the
           PKCS#15 attributes of the private keys are protected for reading and need the authentication with the User PIN. In such a case the --verify-pin option has to be used.

       --list-pins
           Lists all PINs stored on the token. General information about each PIN is listed (eg. PIN name). Actual PIN values are not shown.

       --list-public-keys
           Lists all public keys stored on the token, including key name, id, algorithm and length information.

       --no-cache
           Disables token data caching.

       --output filename, -o filename
           Specifies where key output should be written. If filename already exists, it will be overwritten. If this option is not given, keys will be printed to standard output.

       --read-certificate cert, -r cert
           Reads the certificate with the given id.

       --read-data-object cert, -R data
           Reads data object with OID, applicationName or label.

       --read-public-key id
           Reads the public key with id id, allowing the user to extract and store or use the public key.

       --read-ssh-key id
           Reads the public key with id id, writing the output in format suitable for $HOME/.ssh/authorized_keys.

       --reader num
           Forces pkcs15-tool to use reader number num for operations. The default is to use reader number 0, the first reader in the system.

       --unblock-pin, -u
           Unblocks a PIN stored on the token. Knowledge of the Pin Unblock Key (PUK) is required for this operation.

       --verbose, -v
           Causes pkcs15-tool to be more verbose. Specify this flag several times to enable debug output in the OpenSC library.

       --verify-pin
           Verify PIN after card binding and before issuing any command (without 'auth-id' the first non-SO, non-Unblock PIN will be verified)

SEE ALSO
       pkcs15-init(1), pkcs15-crypt(1)



opensc                                                                                            10/08/2014                                                                                   PKCS15-TOOL(1)
