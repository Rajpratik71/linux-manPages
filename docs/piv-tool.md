PIV-TOOL(1)                                                                                      OpenSC Tools                                                                                     PIV-TOOL(1)



NAME
       piv-tool - smart card utility for HSPD-12 PIV cards

SYNOPSIS
       piv-tool [OPTIONS]


       The piv-tool utility can be used from the command line to perform miscellaneous smart card operations on a HSPD-12 PIV smart card as defined in NIST 800-73-3. It is intened for use with test cards
       only. It can be used to load objects, and generate key pairs, as well as send arbitrary APDU commands to a card after having authenticated to the card using the card key provided by the card vendor.

OPTIONS
       --serial
           Print the card serial number derived from the CHUID object, if any. Output is in hex byte format.

       --name, -n
           Print the name of the inserted card (driver)

       --admin argument, -A argument
           Authenticate to the card using a 2DES or 3DES key. The argument of the form

                {A|M}:ref:alg

           is required, were A uses "EXTERNAL AUTHENTICATION" and M uses "MUTUAL AUTHENTICATION".  ref is normally 9B, and alg is 03 for 3DES. The key is provided by the card vendor, and the environment
           variable PIV_EXT_AUTH_KEY must point to a text file containing the key in the format: XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX

       --genkey argument, -G argument
           Generate a key pair on the card and output the public key. The argument of th form

               ref:alg

           is required, where ref is 9A, 9C, 9D or 9E and alg is 06, 07, 11 or 14 for RSA 1024, RSA 2048, ECC 256 or ECC 384 respectively.

       --object ContainerID, -O ContainerID
           Load an object on to the card. The ContainerID is as defined in NIST 800-73-n without leading 0x. Example: CHUID object is 3000

       --cert ref, -s ref
           Load a certificate on to the card.  ref is 9A, 9C, 9D or 9E

       --compresscert ref, -Z ref
           Load a certificate that has been gziped on to the card.  ref is 9A, 9C, 9D or 9E

       --out file, -o file
           Output file for any operation that produces output.

       --in file, -i file
           Input file for any operation that requires an input file.

       --key-slots-discovery file
           Print properties of the key slots. Needs 'admin' authentication.

       --send-apdu apdu, -s apdu
           Sends an arbitrary APDU to the card in the format AA:BB:CC:DD:EE:FF.... This option may be repeated.

       --reader num, -r num
           Use the given reader number. The default is 0, the first reader in the system.

       --card-driver driver, -c driver
           Use the given card driver. The default is auto-detected.

       --wait, -w
           Wait for a card to be inserted

       --verbose, -v
           Causes piv-tool to be more verbose. Specify this flag several times to enable debug output in the opensc library.

SEE ALSO
       opensc-tool(1)



opensc                                                                                            10/08/2014                                                                                      PIV-TOOL(1)
