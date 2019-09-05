SC-HSM-TOOL(1)                                                                                   OpenSC Tools                                                                                  SC-HSM-TOOL(1)



NAME
       sc-hsm-tool - smart card utility for SmartCard-HSM

SYNOPSIS
       sc-hsm-tool [OPTIONS]


       The sc-hsm-tool utility can be used from the command line to perform extended maintenance tasks not available via PKCS#11 or other tools in the OpenSC package. It can be used to query the status of
       a SmartCard-HSM, initialize a device, generate and import Device Key Encryption Key (DKEK) shares and to wrap and unwrap keys.

OPTIONS
       --initialize, -X
           Initialize token, removing all existing keys, certificates and files.

           Use --so-pin to define SO-PIN for first initialization or to verify in subsequent initializations.

           Use --pin to define the initial user pin value.

           Use --pin-retry to define the maximum number of wrong user PIN presentations.

           Use with --dkek-shares to enable key wrap / unwrap.

       --create-dkek-share filename, -C filename
           Create a DKEK share encrypted under a user supplied password and saved to the file given as parameter.

           Use --password to provide a password for encryption rather than prompting for one.

       --import-dkek-share filename, -I filename
           Prompt for user password, read and decrypt DKEK share and import into SmartCard-HSM.

           Use --password to provide a password for decryption rather than prompting for one.

       --wrap-key filename, -W filename
           Wrap the key referenced in --key-reference and save with it together with the key description and certificate to the given file.

           Use --pin to provide the user PIN on the command line.

       --unwrap-key filename, -U filename
           Read wrapped key, description and certificate from file and import into SmartCard-HSM under the key reference given in --key-reference.

           Determine the key reference using the output of pkcs15-tool -D.

           Use --pin to provide a user PIN on the command line.

           Use --force to remove any key, key description or certificate in the way.

       --dkek-shares number-of-shares, -s number-of-shares
           Define the number of DKEK shares to use for recreating the DKEK.

           This is an optional parameter. Using --initialize without --dkek-shares will disable the DKEK completely.

           Using --dkek-shares with 0 shares requests the SmartCard-HSM to generate a random DKEK. Keys wrapped with this DKEK can only be unwrapped in the same SmartCard-HSM.

           After using --initialize with one or more DKEK shares, the SmartCard-HSM will remain in the initialized state until all DKEK shares have been imported. During this phase no new keys can be
           generated or imported.

       --so-pin value
           Define SO-PIN for initialization.

       --pin value
           Define user PIN for initialization, wrap or unwrap operation.

       --pin-retry value
           Define number of PIN retries for user PIN during initialization. Default is 3.

       --password value
           Define password for DKEK share encryption.

       --force
           Force removal of existing key, description and certificate.

       --reader num, -r num
           Use the given reader number. The default is 0, the first reader in the system.

       --wait, -w
           Wait for a card to be inserted

       --verbose, -v
           Causes sc-hsm-tool to be more verbose. Specify this flag several times to enable debug output in the opensc library.

EXAMPLES
       Create a DKEK share:

       sc-hsm-tool --create-dkek-share dkek-share-1.pbe

       Initialize SmartCard-HSM to use a single DKEK share

       sc-hsm-tool --initialize --so-pin 3537363231383830 --pin 648219 --dkek-shares 1

       Import DKEK share

       sc-hsm-tool --import-dkek-share dkek-share-1.pbe

       Wrap referenced key, description and certificate

       sc-hsm-tool --wrap-key wrap-key.bin --key-reference 1 --pin 648219

       Unwrap key into same or in different SmartCard-HSM with the same DKEK

       sc-hsm-tool --unwrap-key wrap-key.bin --key-reference 10 --pin 648219 --force

SEE ALSO
       opensc-tool(1)



opensc                                                                                            10/08/2014                                                                                   SC-HSM-TOOL(1)
