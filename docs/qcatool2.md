QCATOOL(1)                                                                           Qt Cryptographic Architecture (QCA)                                                                           QCATOOL(1)



NAME
       qcatool - command line tool for the Qt Cryptographic Architecture


DESCRIPTION
       qcatool is a command line tool for performing various cryptographic operations with the Qt Cryptographic Architecture (QCA). qcatool can also be used for testing and debugging QCA.


USAGE
       qcatool has a range of options and commands. You only ever get to use one command, but you may use several, one or no options.


OPTIONS
       As noted above, these are all optional, and may be combined.

       --pass=PASSWORD
              Specify the password to use. This is probably a bad idea except for testing, because anyone can read the arguments to a command line application.

       --newpass=PASSWORD
              Specify  the  new  password  to use for password change with the key changepass and keybundle changepass commands.  This is probably a bad idea except for testing, because anyone can read the
              arguments to a command line application.

       --nonroots=CERTIFICATES
              Specify additional certificates, not trusted, but which may be used in the trust path if appropriate trust can be established.

       --roots=CERTIFICATES
              Specify additional certificates which can be used as trusted (root) certificates.

       --nosys
              Disable use of the standard root certificates that are provided by the operating system.

       --noprompt
              Disable prompting for passwords/passphrases. If you do not provide the passphrase on the command line (with --pass or --newpass) this will cause qcatool  to  abort  the  command  if  a  pass‐
              word/passphrase is required.

       --ordered
              If  outputting certificate information fields (Distinguished Name and Subject Alternative Name), show them in same the order that they are present in the certificate rather than in a friendly
              sorted order.

       --debug
              Enable additional output to aid debugging.

       --log-file=FILENAME
              Log to the specified file.

       --log-level=LEVEL
              Log at the specified level. The log level can be between 0 (none) and 8 (most).

       --nobundle
              When S/MIME signing, do not bundle the signer's certificate chain inside the signature.  This results in a smaller signature output, but requires the recipient to have all  of  the  necessary
              certificates in order to verify it.


COMMANDS
       help, --help, -h
              Output usage (help) information.

       version, --version, -v
              Output version information.

       plugins
              List available plugins. Use the --debug option to get more information on plugins which are found and which ones actually loaded.

       config save [provider]
              Save provider configuration. Use this to have the provider's default configuration written to persistent storage, which you can then edit by hand.

       config edit [provider]
              Edit provider configuration. The changes are written to persistent storage.

       key make rsa|dsa [bits]
              Create a key pair

       key changepass [K]
              Add/change/remove passphrase of a key

       cert makereq [K]
              Create certificate request (CSR)

       cert makeself [K]
              Create self-signed certificate

       cert makereqadv [K]
              Advanced version of 'makereq'

       cert makeselfadv [K]
              Advanced version of 'makeself'

       cert validate [C]
              Validate certificate

       keybundle make [K] [C]
              Create a keybundle

       keybundle extract [X]
              Extract certificate(s) and key

       keybundle changepass [X]
              Change passphrase of a keybundle

       keystore list-stores
              List all available keystores

       keystore list [storeName]
              List content of a keystore

       keystore monitor
              Monitor for keystore availability

       keystore export [E]
              Export a keystore entry's content

       keystore exportref [E]
              Export a keystore entry reference

       keystore addkb [storeName] [cert.p12]
              Add a keybundle into a keystore

       keystore addpgp [storeName] [key.asc]
              Add a PGP key into a keystore

       keystore remove [E]
              Remove an object from a keystore

       show cert [C]
              Examine a certificate

       show req [req.pem]
              Examine a certificate request (CSR)

       show crl [crl.pem]
              Examine a certificate revocation list

       show kb [X]
              Examine a keybundle

       show pgp [P|S]
              Examine a PGP key

       message sign pgp|pgpdetach|smime [X|S]
              Sign a message

       message encrypt pgp|smime [C|P]
              Encrypt a message

       message signencrypt [S] [P]
              PGP sign & encrypt a message

       message verify pgp|smime
              Verify a message

       message decrypt pgp|smime ((X) ...)
              Decrypt a message (S/MIME needs X)

       message exportcerts
              Export certs from S/MIME message


ARGUMENTS
       The arguments to the commands are as follows.

       K = private key.

       C = certificate.

       X = key bundle.

       P = PGP public key.

       S = PGP secret key.

       E = generic entry.

       These must be identified by either a filename or a keystore reference ("store:obj").


AUTHOR
       qcatool was written by Justin Karneges as part of QCA. This manual page was written by Brad Hards.




qcatool 1.0.0                                                                                    August 2007                                                                                       QCATOOL(1)
