OPENPGP-TOOL(1)                                                                                  OpenSC Tools                                                                                 OPENPGP-TOOL(1)



NAME
       openpgp-tool - utility for accessing visible data OpenPGP smart cards and compatible tokens

SYNOPSIS
       openpgp-tool [OPTIONS]

DESCRIPTION
       The openpgp-tool utility is used for accessing data from the OpenPGP v1.1 and v2.0 smart cards and compatible tokens like e.g. GPF CryptoStick v1.x, which might not be present in PKCS#15 objects but
       available in custom files on the card. The data can be printed on screen or used by other programs via environment variables.

OPTIONS
       --exec prog, -x prog
           Execute the given program with data in environment variables.

       --help, -h
           Print help message on screen.

       --raw
           Print values in raw format, as they are stored on the card.

       --pretty
           Print values in pretty format.

       --user-info, -U
           Show card holder information.

       --reader num, -r num
           Use the given reader. The default is the first reader with a card.

       --verify pintype
           Verify PIN (CHV1, CHV2 or CHV3).

       --pin string
           The PIN text to verify.

       --gen-key ID, -G ID
           Generate key. Specify key ID (1, 2 or 3) to generate.

       --key-length bitlength, -L bitlength
           Length (default 2048 bit) of the key to be generated.

       --version, -V
           Print the version of the utility and exit.

       --verbose, -v
           Verbose operation. Use several times to enable debug output.

       --wait, -w
           Wait for a card to be inserted.

AUTHORS
       openpgp-tool utility was written by Peter Marschall <peter@adpm.de>.



opensc                                                                                            10/08/2014                                                                                  OPENPGP-TOOL(1)
