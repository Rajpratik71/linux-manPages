NPA-TOOL(1)                                  OpenSC Tools                                 NPA-TOOL(1)

NAME
       npa-tool - displays information on the German eID card (neuer Personalausweis, nPA).

SYNOPSIS
       npa-tool [OPTIONS]

DESCRIPTION
       The npa-tool utility is used to display information stored on the German eID card (neuer
       Personalausweis, nPA), and to perform some write and verification operations.

OPTIONS
       --help, -h
           Print help and exit.

       --version, -V
           Print version and exit.

       --reader arg, -r arg
           Specify the reader to use. Use -1 as arg to automatically detect the reader to use. By
           default, the first reader with a present card is used.

       --verbose, -v
           Causes npa-tool to be more verbose. Specify this flag several times to be more verbose.

   Password Authenticated Connection Establishment (PACE)
       --pin [STRING], -p [STRING]
           Run PACE with (transport) eID-PIN.

       --puk [STRING], -u [STRING]
           Run PACE with PUK.

       --can [STRING], -c [STRING]
           Run PACE with Card Access Number (CAN).

       --mrz [STRING], -m [STRING]
           Run PACE with Machine Readable Zone (MRZ). Enter the MRZ without newlines.

       --env
           Specify whether to use environment variables PIN, PUK, CAN, MRZ, and NEWPIN. You may want
           to clean your environment before enabling this. (default=off)

   PIN management
       --new-pin [STRING], -N [STRING]
           Install a new PIN.

       --resume, -R
           Resume eID-PIN (uses CAN to activate last retry). (default=off)

       --unblock, -U
           Unblock PIN (uses PUK to activate three more retries). (default=off)

   Terminal Authentication (TA) and Chip Authentication (CA)
       --cv-certificate FILENAME, -C FILENAME
           Specify Card Verifiable (CV) certificate to create a certificate chain. The option can be
           given multiple times, in which case the order is important.

       --cert-desc HEX_STRING
           Certificate description to show for Terminal Authentication.

       --chat HEX_STRING
           Specify the Card Holder Authorization Template (CHAT) to use. If not given, it defaults to
           the terminal's CHAT. Use 7F4C0E060904007F000703010203530103 to trigger EAC on the CAT-C
           (Komfortleser).

       --auxiliary-data HEX_STRING, -A HEX_STRING
           Specify the terminal's auxiliary data. If not given, the default is determined by
           verification of validity, age and community ID.

       --private-key FILENAME, -P FILENAME
           Specify the terminal's private key.

       --cvc-dir DIRECTORY
           Specify where to look for the certificate of the Country Verifying Certification Authority
           (CVCA). If not given, it defaults to /home/fm/.local/etc/eac/cvc.

       --x509-dir DIRECTORY
           Specify where to look for the X.509 certificate. If not given, it defaults to
           /home/fm/.local/etc/eac/x509.

       --disable-ta-checks
           Disable checking the validity period of CV certificates. (default=off)

       --disable-ca-checks
           Disable passive authentication. (default=off)

   Read and write data groups
       --read-dg1
           Read data group 1: Document Type.

       --read-dg2
           Read data group 2: Issuing State.

       --read-dg3
           Read data group 3: Date of Expiry.

       --read-dg4
           Read data group 4: Given Name(s).

       --read-dg5
           Read data group 5: Family Name.

       --read-dg6
           Read data group 6: Religious/Artistic Name.

       --read-dg7
           Read data group 7: Academic Title.

       --read-dg8
           Read data group 8: Date of Birth.

       --read-dg9
           Read data group 9: Place of Birth.

       --read-dg10
           Read data group 10: Nationality.

       --read-dg11
           Read data group 11: Sex.

       --read-dg12
           Read data group 12: Optional Data.

       --read-dg13
           Read data group 13: Birth Name.

       --read-dg14
           Read data group 14.

       --read-dg15
           Read data group 15.

       --read-dg16
           Read data group 16.

       --read-dg17
           Read data group 17: Normal Place of Residence.

       --read-dg18
           Read data group 18: Community ID.

       --read-dg19
           Read data group 19: Residence Permit I.

       --read-dg20
           Read data group 20: Residence Permit II.

       --read-dg21
           Read data group 21: Optional Data.

       --write-dg17 HEX_STRING
           Write data group 17: Normal Place of Residence.

       --write-dg18 HEX_STRING
           Write data group 18: Community ID.

       --write-dg19 HEX_STRING
           Write data group 19: Residence Permit I.

       --write-dg20 HEX_STRING
           Write data group 20: Residence Permit II.

       --write-dg21 HEX_STRING
           Write data group 21: Optional Data.

   Verification of validity, age and community ID
       --verify-validity YYYYMMDD
           Verify chip's validity with a reference date.

       --older-than YYYYMMDD
           Verify age with a reference date.

       --verify-community HEX_STRING
           Verify community ID with a reference ID.

   Special options, not always useful
       --break, -b
           Brute force PIN, CAN or PUK. Use together with options -p, -a, or -u. (default=off)

       --translate FILENAME, -t FILENAME
           Specify the file with APDUs of HEX_STRINGs to send through the secure channel.
           (default=`stdin')

       --tr-03110v201
           Force compliance to BSI TR-03110 version 2.01. (default=off)

       --disable-all-checks
           Disable all checking of fly-by-data. (default=off)

AUTHORS
       npa-tool was written by Frank Morgner <frankmorgner@gmail.com>.

opensc                                        06/10/2019                                  NPA-TOOL(1)
