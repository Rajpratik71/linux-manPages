GPGV2(1)                                                                                      GNU Privacy Guard                                                                                      GPGV2(1)



NAME
       gpgv2 - Verify OpenPGP signatures

SYNOPSIS
       gpgv2 [options] signed_files




DESCRIPTION
       gpgv2 is an OpenPGP signature verification tool.

       This  program  is actually a stripped-down version of gpg which is only able to check signatures. It is somewhat smaller than the fully-blown gpg and uses a different (and simpler) way to check that
       the public keys used to make the signature are valid. There are no configuration files and only a few options are implemented.

       gpgv2 assumes that all keys in the keyring are trustworthy.  By default it uses a keyring named ‘trustedkeys.gpg’ which is assumed to be in the home directory as defined by GnuPG or set by an option
       or an environment variable. An option may be used to specify another keyring or even multiple keyrings.



RETURN VALUE
       The program returns 0 if everything is fine, 1 if at least one signature was bad, and other error codes for fatal errors.


OPTIONS
       gpgv2 recognizes these options:



       --verbose

       -v     Gives more information during processing. If used twice, the input data is listed in detail.


       --quiet

       -q     Try to be as quiet as possible.


       --keyring file
              Add  file  to  the  list  of keyrings.  If file begins with a tilde and a slash, these are replaced by the HOME directory. If the filename does not contain a slash, it is assumed to be in the
              home-directory ("~/.gnupg" if --homedir is not used).


       --status-fd n
              Write special status strings to the file descriptor n.  See the file DETAILS in the documentation for a listing of them.


       --logger-fd n
              Write log output to file descriptor n and not to stderr.


       --ignore-time-conflict
              GnuPG normally checks that the timestamps associated with keys and signatures have plausible values. However, sometimes a signature seems to be older than the key due to clock problems.  This
              option turns these checks into warnings.


       --homedir dir
              Set the name of the home directory to dir. If this option is not used, the home directory defaults to ‘~/.gnupg’.  It is only recognized when given on the command line.  It also overrides any
              home directory stated through the environment variable ‘GNUPGHOME’ or (on W32 systems) by means of the Registry entry HKCU\Software\GNU\GnuPG:HomeDir.




EXAMPLES
       gpgv2 pgpfile

       gpgv2 sigfile [datafile]
              Verify the signature of the file. The second form is used for detached signatures, where sigfile is the detached signature (either ASCII-armored or binary) and datafile  contains  the  signed
              data;  if  datafile  is  "-"  the  signed data is expected on stdin; if datafile is not given the name of the file holding the signed data is constructed by cutting off the extension (".asc",
              ".sig" or ".sign") from sigfile.



FILES
       ~/.gnupg/trustedkeys.gpg
              The default keyring with the allowed keys.



ENVIRONMENT
       HOME   Used to locate the default home directory.


       GNUPGHOME
              If set directory used instead of "~/.gnupg".



SEE ALSO
       gpg2(1)

       The full documentation for this tool is maintained as a Texinfo manual.  If GnuPG and the info program are properly installed at your site, the command

         info gnupg

       should give you access to the complete manual including a menu structure and an index.







GnuPG 2.0.24                                                                                      2017-05-09                                                                                         GPGV2(1)
