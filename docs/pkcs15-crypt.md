PKCS15-CRYPT(1)                                                                                  OpenSC Tools                                                                                 PKCS15-CRYPT(1)



NAME
       pkcs15-crypt - perform crypto operations using PKCS#15 smart cards

SYNOPSIS
       pkcs15-crypt [OPTIONS]

DESCRIPTION
       The pkcs15-crypt utility can be used from the command line to perform cryptographic operations such as computing digital signatures or decrypting data, using keys stored on a PKCS#15 compliant smart
       card.

OPTIONS
       --aid aid
           Specify the AID of the on-card PKCS#15 application to bind to. The aid must be in hexadecimal form.

       --decipher, -c
           Decrypt the contents of the file specified by the --input option. The result of the decryption operation is written to the file specified by the --output option. If this option is not given, the
           decrypted data is printed to standard output, displaying non-printable characters using their hex notation xNN (see also --raw).

       --input file, -i file
           Specifies the input file to use.

       --key id, -k id
           Selects the ID of the key to use.

       --output file, -o file
           Any output will be sent to the specified file.

       --pin pin, -p pin
           When the cryptographic operation requires a PIN to access the key, pkcs15-crypt will prompt the user for the PIN on the terminal. Using this option allows you to specify the PIN on the command
           line.

           Note that on most operating systems, the command line of a process can be displayed by any user using the ps(1) command. It is therefore a security risk to specify secret information such as
           PINs on the command line. If you specify '-' as PIN, it will be read from STDIN.

       --pkcs1
           By default, pkcs15-crypt assumes that input data has been padded to the correct length (i.e. when computing an RSA signature using a 1024 bit key, the input must be padded to 128 bytes to match
           the modulus length). When giving the --pkcs1 option, however, pkcs15-crypt will perform the required padding using the algorithm outlined in the PKCS #1 standard version 1.5.

       --raw, -R
           Outputs raw 8 bit data.

       --reader N, -r N
           Selects the N-th smart card reader configured by the system. If unspecified, pkcs15-crypt will use the first reader found.

       --sha-1
           This option tells pkcs15-crypt that the input file is the result of an SHA1 hash operation, rather than an MD5 hash. Again, the data must be in binary representation.

       --sign, -s
           Perform digital signature operation on the data read from a file specified using the --input option. By default, the contents of the file are assumed to be the result of an MD5 hash operation.
           Note that pkcs15-crypt expects the data in binary representation, not ASCII.

           The digital signature is stored, in binary representation, in the file specified by the --output option. If this option is not given, the signature is printed on standard output, displaying
           non-printable characters using their hex notation xNN (see also --raw).

       --verbose, -v
           Causes pkcs15-crypt to be more verbose. Specify this flag several times to enable debug output in the OpenSC library.

SEE ALSO
       pkcs15-init(1), pkcs15-tool(1)



opensc                                                                                            10/08/2014                                                                                  PKCS15-CRYPT(1)
