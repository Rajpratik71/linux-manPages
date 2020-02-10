SYMCRYPTRUN(1)                                                                            GNU Privacy Guard 2.1                                                                            SYMCRYPTRUN(1)

NAME
       symcryptrun - Call a simple symmetric encryption tool

SYNOPSIS
       symcryptrun --class class --program program --keyfile keyfile [--decrypt|--encrypt] [inputfile]

DESCRIPTION
       Sometimes  simple  encryption tools are already in use for a long time and there might be a desire to integrate them into the GnuPG framework.  The protocols and encryption methods might be non-
       standard or not even properly documented, so that a full-fledged encryption tool with an interface like gpg is not doable.  symcryptrun provides a solution: It operates by calling  the  external
       encryption/decryption module and provides a passphrase for a key using the standard pinentry based mechanism through gpg-agent.

       Note, that symcryptrun is only available if GnuPG has been configured with '--enable-symcryptrun' at build time.

       For encryption, the plain text must be provided on STDIN or as the argument inputfile, and the ciphertext will be output to STDOUT.  For decryption vice versa.

       CLASS describes the calling conventions of the external tool.  Currently it must be given as 'confucius'.  PROGRAM is the full filename of that external tool.

       For  the  class  'confucius' the option --keyfile is required; keyfile is the name of a file containing the secret key, which may be protected by a passphrase.  For detailed calling conventions,
       see the source code.

       Note, that gpg-agent must be running before starting symcryptrun.

       The following additional options may be used:

       -v

       --verbose
              Output additional information while running.

       -q

       --quiet
              Try to be as quiet as possible.

       --homedir dir
              Set the name of the home directory to dir. If this option is not used, the home directory defaults to ‘~/.gnupg’.  It is only recognized when given on the command line.  It also overrides
              any home directory stated through the environment variable ‘GNUPGHOME’ or (on Windows systems) by means of the Registry entry HKCU\Software\GNU\GnuPG:HomeDir.

              On  Windows  systems  it  is  possible  to  install  GnuPG as a portable application.  In this case only this command line option is considered, all other ways to set a home directory are
              ignored.

              To install GnuPG as a portable application under Windows, create an empty file name ‘gpgconf.ctl’ in the same directory as the tool ‘gpgconf.exe’.  The root of the  installation  is  than
              that  directory; or, if ‘gpgconf.exe’ has been installed directly below a directory named ‘bin’, its parent directory.  You also need to make sure that the following directories exist and
              are writable: ‘ROOT/home’ for the GnuPG home and ‘ROOT/var/cache/gnupg2’ for internal cache files.

       --log-file file
              Append all logging output to file.  Default is to write logging information to STDERR.

              The possible exit status codes of symcryptrun are:

       0
                      Success.

       1
                      Some error occured.

       2
                      No valid passphrase was provided.

       3
                      The operation was canceled by the user.

SEE ALSO
       gpg(1), gpgsm(1), gpg-agent(1),

       The full documentation for this tool is maintained as a Texinfo manual.  If GnuPG and the info program are properly installed at your site, the command

         info gnupg

       should give you access to the complete manual including a menu structure and an index.

GnuPG 2.1.11                                                                                    2016-01-21                                                                                 SYMCRYPTRUN(1)
