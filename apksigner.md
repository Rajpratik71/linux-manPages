APKSIGNER(1)                                   7.0.0_r1                                  APKSIGNER(1)

NAME
       apksigner - sign and verify Android APKs

SYNOPSIS
       A  command  line tool for signing Android APK files and for checking whether signatures of APK
       files will verify on Android devices:

       apksigner [options] apk

       apksigner --version

       apksigner --help

       apk is an existing file to sign or verify.

DESCRIPTION
       apksig is a project which aims to simplify APK signing and checking whether  APK's  signatures
       should verify on Android.  apksig supports JAR signing (used by Android since day one) and APK
       Signature Scheme v2 (supported since Android Nougat, API Level 24).

       The key feature of apksig is that it knows about differences  in  APK  signature  verification
       logic  between  different  versions  of the Android platform.  apksig can thus check whether a
       signed APK is expected to verify on all Android platform versions supported by the APK.   When
       signing  an APK, apksig will choose the most appropriate cryptographic algorithms based on the
       Android platform versions supported by the APK being signed.

COMMANDS
       sign

       :This signs the provided APK, stripping out any pre-existing signatures.  Signing is performed
       using one or more signers, each represented by an asymmetric key pair and a corresponding cer‐
       tificate.  Typically, an APK is signed by just one signer.  For each signer, you need to  pro‐
       vide the signer's private key and certificate.

       verify  :This checks whether the provided APK will verify on Android.  By default, this checks
       whether the APK will verify on all Android platform versions supported by the APK (as declared
       using  minSdkVersion  in AndroidManifest.xml).  Use --min-sdk-version and/or --max-sdk-version
       to verify the APK against a custom range of API Levels.

       version :Show this tool's version number and exit

       help :Show this usage page and exit

OPTIONS
       -v, --verbose: Verbose output mode

       -h, --help: Show help about this command and exit

       -Werr: Treat warnings as errors

   sign
       Sign the provided APK

       --out :File into which to output the signed APK.  By default,  the  APK  is  signed  in-place,
       overwriting the input file.

       --min-sdk-version  :Lowest  API Level on which this APK's signatures will be verified.  By de‐
       fault, the value from AndroidManifest.xml is used.  The higher the value, the stronger securi‐
       ty parameters are used when signing.

       --max-sdk-version  :Highest API Level on which this APK's signatures will be verified.  By de‐
       fault, the highest possible value is used.

       --v1-signing-enabled :Whether to enable signing using  JAR  signing  scheme  (aka  v1  signing
       scheme,  the one used in Android since day one).  By default, signing using this scheme is en‐
       abled based on min and max SDK version (see --min-sdk-version and --max-sdk-version).

       --v2-signing-enabled :Whether to enable signing using APK Signature Scheme v2 (aka v2  signing
       scheme,  the  one introduced in Android Nougat, API Level 24).  By default, signing using this
       scheme is enabled based on min and max SDK version (see --min-sdk-version  and  --max-sdk-ver‐
       sion).

   per-signer options
       These options specify the configuration of a particular signer.  To delimit options of differ‐
       ent signers, use --next-signer.

       --next-signer :Delimits options of two different signers.  There is no need to use this option
       when only one signer is used.

       --v1-signer-name  :Basename for files comprising the JAR signature scheme (aka v1 scheme) sig‐
       nature of this signer.  By default, KeyStore key alias or basename of key file is used.

   per-signer signing key & certificate options
       There are two ways to provide the signer's private key and certificate: (1) Java KeyStore (see
       --ks),  or  (2)  private  key file in PKCS #8 format and certificate file in X.509 format (see
       --key and --cert).

       --ks :Load private key and certificate chain from the Java KeyStore initialized from the spec‐
       ified  file.   NONE  means  no file is needed by KeyStore, which is the case for some PKCS #11
       KeyStores.

       --ks-key-alias :Alias under which the private key and certificate are stored in the  KeyStore.
       This must be specified if the KeyStore contains multiple keys.

       --ks-pass :KeyStore password (see --ks).  The following formats are supported:

       · pass: password provided inline

       · env: password provided in the named environment variable

       · file: password provided in the named file, as a single line

       · stdin password provided on standard input, as a single line

       A  password is required to open a KeyStore.  By default, the tool will prompt for password via
       console or standard input.  When the same file (including standard input) is used for  provid‐
       ing  multiple  passwords,  the passwords are read from the file one line at a time.  Passwords
       are read in the order in which signers are specified and, within each signer,  KeyStore  pass‐
       word is read before the key password is read.

       --key-pass  :Password  with which the private key is protected.  By default it is assumed that
       KeyStore keys are protected using the same password as their KeyStore  (see  --ks-pass).   The
       following formats are supported:

       · pass: password provided inline

       · env: password provided in the named environment variable

       · file: password provided in the named file, as a single line stdin password provided on stan‐
         dard input, as a single line

       By default, if the key is password-protected, the tool will prompt for password via console or
       standard  input.  When the same file (including standard input) is used for providing multiple
       passwords, the passwords are read from the file one line at a time.  Passwords are read in the
       order in which signers are specified and, within each signer, KeyStore password is read before
       the key password is read.

       --pass-encoding

       Additional character encoding  (e.g.,  ibm437  or  utf-8)  to  try  for  passwords  containing
       non-ASCII  characters.  KeyStores created by keytool are often encrypted not using the Unicode
       form of the password but rather using the form produced by encoding  the  password  using  the
       console's  character  encoding.   apksigner by default tries to decrypt using several forms of
       the password: the Unicode form, the form encoded using the JVM default charset, and, on Java 8
       and  older,  the form encoded using the console's charset.  On Java 9, apksigner cannot detect
       the console's charset and may need to be provided with --pass-encoding when a non-ASCII  pass‐
       word  is used.  --pass-encoding may also need to be provided for a KeyStore created by keytool
       on a different OS or in a different locale.

       --ks-type :Type/algorithm of KeyStore to use.  By default, the default type is used.

       --ks-provider-name :Name of the JCA Provider from which to request  the  KeyStore  implementa‐
       tion.  By default, the highest priority provider is used.  See --ks-provider-class for the al‐
       ternative way to specify a provider.

       --ks-provider-class :Fully-qualified class name of the JCA Provider from which to request  the
       KeyStore implementation.  By default, the provider is chosen based on --ks-provider-name.

       --ks-provider-arg  :Value  to pass into the constructor of the JCA Provider class specified by
       --ks-provider-class.  The value is passed into the constructor as  java.lang.String.   By  de‐
       fault, the no-arg provider's constructor is used.

       --key  :Load private key from the specified file.  If the key is password-protected, the pass‐
       word will be prompted via standard input unless specified  otherwise  using  --key-pass.   The
       file must be in PKCS #8 DER format.

       --cert  :Load certificate chain from the specified file.  The file must be in X.509 PEM or DER
       format.

   verify
       Check whether the provided APK is expected to verify on Android

       --print-certs
              Show information about the APK's signing certificates

       --min-sdk-version :Lowest API Level on which this APK's signatures will be verified.   By  de‐
       fault, the value from AndroidManifest.xml is used.

       --max-sdk-version  Highest  API Level on which this APK's signatures will be verified.  By de‐
       fault, the highest possible value is used.

EXAMPLES
       apksigner sign --ks release.jks app.apk apksigner verify --verbose app.apk

   sign
       1. Sign an APK using the one and only key in keystore release.jks: $ apksigner sign  --ks  re‐
          lease.jks app.apk

       2. Sign  an  APK  using  a private key and certificate stored as individual files: $ apksigner
          sign --key release.pk8 --cert release.x509.pem app.apk

       3. Sign an APK using two keys: $ apksigner sign --ks release.jks --next-signer --ks  magic.jks
          app.apk

   verify
       1. Check whether the APK's signatures are expected to verify on all Android platforms declared
          as supported by this APK: $ apksigner verify app.apk

       2. Check whether the APK's signatures are expected to verify on  Android  platforms  with  API
          Level 15 and higher: $ apksigner verify --min-sdk-version 15 app.apk

SEE ALSO
       signapk(1) jar(1) zip(1) zipalign(1)

       https://source.android.com/devices/tech/ota/sign_builds.html

AUTHORS
       The Android Open Source Project.

                                           2 December 2016                               APKSIGNER(1)
