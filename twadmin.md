TWADMIN(8)                                                    System Manager's Manual                                                   TWADMIN(8)

NAME
       twadmin - Tripwire administrative and utility tool

SYNOPSIS
       twadmin { -m F | --create-cfgfile }  options...
            configfile.txt
       twadmin { -m f | --print-cfgfile } [ options... ]
       twadmin { -m P | --create-polfile } [ options... ]
            policyfile.txt
       twadmin { -m p | --print-polfile } [ options... ]
       twadmin { -m R | --remove-encryption } [ options... ]
            file1 [ file2... ]
       twadmin { -m E | --encrypt } [ options... ]
            file1 [ file2... ]
       twadmin { -m e | --examine } [ options... ]
            file1 [ file2... ]
       twadmin { -m G | --generate-keys } options...
       twadmin { -m C | --change-passphrases } options...

DESCRIPTION
       The twadmin utility is used to perform certain administrative functions related to Tripwire files and configuration options.  Specifically,
       twadmin allows encoding, decoding, signing, and verification of Tripwire files, and provides a means to generate and change local and site
       keys.

   Creating a configuration file (--create-cfgfile)
       This command mode designates an existing text file as the new configuration file for Tripwire.  The plain text configuration file must be
       specified on the command line.  Using the site key, the new configuration file is encoded and saved.

   Printing a configuration file (--print-cfgfile)
       This command mode prints the specified encoded and signed configuration file in clear-text form to standard output.

   Replacing a policy file (--create-polfile)
       This command mode designates an existing text file as the new policy file for Tripwire.  The plain text policy file must be specified on
       the command line.  Using the site key, the new policy file is encoded and saved.

   Printing a policy file (--print-polfile)
       This command mode prints the specified encoded and signed policy file in clear-text form to standard output.

   Removing encryption from a file (--remove-encryption)
       This command mode allows the user to remove signing from signed configuration, policy, database, or report files.  Multiple files may be
       specified on the command line. The user will need to enter the appropriate local or site keyfile, or both if a combination of files is to
       be verified. Even with the cryptographic signing removed, these files will be in a binary encoded (non-human-readable) form.

   Encrypting a file (--encrypt)
       This command mode allows the user to sign configuration, policy, database files, or reports.  Multiple files may be specified on the com‐
       mand line.  The files will be signed using either the site or local key, as appropriate for the type of file.  To automate the process, the
       passphrase for the key files can be included on the command line.

   Examining the signing status of a file (--examine)
       This command allows the user to examine the listed files and print a report of their signing status.  This report displays the filename,
       file type, whether or not a file is signed, and what key (if any) is used to sign it.

   Generating keys (--generate-keys)
       This command mode generates site and/or local key files with names specified by the user.

   Changing passphrases (--change-passphrases)
       This command reencrypts the private part of the site and/or local key files using the key filenames and passphrases specified by the user.

OPTIONS
   Creating a configuration file:
           -m F            --create-cfgfile
           -v              --verbose
           -s              --silent, --quiet
           -c cfgfile      --cfgfile cfgfile
           -S sitekey      --site-keyfile sitekey
           -Q passphrase   --site-passphrase passphrase
           -e              --no-encryption
           configfile.txt

       -m F, --create-cfgfile
              Mode selector.

       -v, --verbose
              Verbose output mode.  Mutually exclusive with (-s).

       -s, --silent, --quiet
              Silent output mode.  Mutually exclusive with (-v).

       -c cfgfile, --cfgfile cfgfile
              Specify the destination of the encoded (and optionally signed) configuration file.

       -S sitekey, --site-keyfile sitekey
              Use the specified site key file to encode and sign the new configuration file.  Exactly one of (-S) or (-e) must be specified.

       -Q passphrase, --site-passphrase passphrase
              Specifies passphrase to be used with site key for configuration file encoding and signing.  Valid only in conjunction with (-S).

       -e, --no-encryption
              Do not sign the configuration file being stored.  The configuration file will still be compressed, and will not be human-readable.
              Mutually exclusive with (-Q) and (-S).

       configfile.txt
              Specifies the text configuration file that will become the new configuration file.

__________________________________________________________________________________________________________________________________________________

   Printing a configuration file:
           -m f           --print-cfgfile
           -v             --verbose
           -s             --silent, --quiet
           -c cfgfile     --cfgfile cfgfile

       -m f, --print-cfgfile
              Mode selector.

       -v, --verbose
              Verbose output mode.  Mutually exclusive with (-s).

       -s, --silent, --quiet
              Silent output mode.  Mutually exclusive with (-v).

       -c cfgfile, --cfgfile cfgfile
              Print the specified configuration file.

__________________________________________________________________________________________________________________________________________________

   Creating a policy file:
           -m P            --create-polfile
           -v              --verbose
           -s              --silent, --quiet
           -c cfgfile      --cfgfile cfgfile
           -p polfile      --polfile polfile
           -S sitekey      --site-keyfile sitekey
           -Q passphrase   --site-passphrase passphrase
           -e              --no-encryption
           policyfile.txt

       -m P, --create-polfile
              Mode selector.

       -v, --verbose
              Verbose output mode. Mutually exclusive with (-s).

       -s, --silent, --quiet
              Silent output mode.  Mutually exclusive with (-v).

       -c cfgfile, --cfgfile cfgfile
              Use the specified configuration file.

       -p polfile, --polfile polfile
              Specify the destination of the encoded (and optionally signed) policy file.

       -S sitekey, --site-keyfile sitekey
              Use the specified site key file.  Mutually exclusive with (-e).

       -Q passphrase, --site-passphrase passphrase
              Specifies passphrase to be used with site key for policy signing.  Mutually exclusive with (-e).

       -e, --no-encryption
              Do not sign the policy file being stored.  The policy file will still be compressed, and will not be human-readable.  Mutually ex‐
              clusive with (-Q) and (-S).

       policyfile.txt
              Specifies the text policy file that will become the new policy file.

__________________________________________________________________________________________________________________________________________________

   Printing a policy file:
           -m p           --print-polfile
           -v             --verbose
           -s             --silent, --quiet
           -c cfgfile     --cfgfile cfgfile
           -p polfile     --polfile polfile
           -S sitekey     --site-keyfile sitekey

       -m p, --print-polfile
              Mode selector.

       -v, --verbose
              Verbose output mode.  Mutually exclusive with (-s).

       -s, --silent, --quiet
              Silent output mode.  Mutually exclusive with (-v).

       -c cfgfile, --cfgfile cfgfile
              Use the specified configuration file.

       -p polfile, --polfile polfile
              Print the specified policy file.

       -S sitekey, --site-keyfile sitekey
              Use the specified site key file.

__________________________________________________________________________________________________________________________________________________

   Removing encryption from a file:
           -m R            --remove-encryption
           -v              --verbose
           -s              --silent, --quiet
           -c cfgfile      --cfgfile cfgfile
           -L localkey     --local-keyfile localkey
           -S sitekey      --site-keyfile sitekey
           -P passphrase   --local-passphrase passphrase
           -Q passphrase   --site-passphrase passphrase
           file1 [ file2... ]

       -m R, --remove-encryption
              Mode selector.

       -v, --verbose
              Verbose output mode.  Mutually exclusive with (-s).

       -s, --silent, --quiet
              Silent output mode.  Mutually exclusive with (-v).

       -c cfgfile, --cfgfile cfgfile
              Use the specified configuration file.

       -L localkey, --local-keyfile localkey
              Specify the local keyfile to use to verify database files and reports.

       -S sitekey, --site-keyfile sitekey
              Specify the site keyfile to use to verify configuration and policy files.

       -P passphrase, --local-passphrase passphrase
              Specify the passphrase to use when verifying with the old local keyfile.

       -Q passphrase, --site-passphrase passphrase
              Specify the passphrase to use when verifying with the old site keyfile.

       file1 [ file2... ]
              List of files from which signing is to be removed.

__________________________________________________________________________________________________________________________________________________

   Encrypting a file:
           -m E            --encrypt
           -v              --verbose
           -s              --silent, --quiet
           -c cfgfile      --cfgfile cfgfile
           -L localkey     --local-keyfile localkey
           -S sitekey      --site-keyfile sitekey
           -P passphrase   --local-passphrase passphrase
           -Q passphrase   --site-passphrase passphrase
           file1 [ file2... ]

       -m E, --encrypt
              Mode selector.

       -v, --verbose
              Verbose output mode.  Mutually exclusive with (-s).

       -s, --silent, --quiet
              Silent output mode.  Mutually exclusive with (-v).

       -c cfgfile, --cfgfile cfgfile
              Use the specified configuration file.

       -L localkey, --local-keyfile localkey
              Specify the local keyfile to use to sign database files and reports.

       -S sitekey, --site-keyfile sitekey
              Specify the site keyfile to use to sign configuration and policy files.

       -P passphrase, --local-passphrase passphrase
              Specify the passphrase to use when signing with the local keyfile.

       -Q passphrase, --site-passphrase passphrase
              Specify the passphrase to use when signing with the site keyfile.

       file1 [ file2... ]
              List of files to sign using the new key(s).

__________________________________________________________________________________________________________________________________________________

   Examining the encryption status of a file:
           -m e           --examine
           -v             --verbose
           -s             --silent, --quiet
           -c cfgfile     --cfgfile cfgfile
           -L localkey    --local-keyfile localkey
           -S sitekey     --site-keyfile sitekey
           file1 [ file2... ]

       -m e, --examine
              Mode selector.

       -v, --verbose
              Verbose output mode.  Mutually exclusive with (-s).

       -s, --silent, --quiet
              Silent output mode.  Mutually exclusive with (-v).

       -c cfgfile, --cfgfile cfgfile
              Use the specified configuration file.

       -L localkey, --local-keyfile localkey
              Specifies the key to use as a local key.

       -S sitekey, --site-keyfile sitekey
              Specifies the key to use as a site key.

       file1 [ file2... ]
              List of files to examine.

__________________________________________________________________________________________________________________________________________________

   Generating keys:
           -m G            --generate-keys
           -v              --verbose
           -s              --silent, --quiet
           -L localkey     --local-keyfile localkey
           -S sitekey      --site-keyfile sitekey
           -P passphrase   --local-passphrase passphrase
           -Q passphrase   --site-passphrase passphrase

       -m G, --generate-keys
              Mode selector.

       -v, --verbose
              Verbose output mode.  Mutually exclusive with (-s).

       -s, --silent, --quiet
              Silent output mode.  Mutually exclusive with (-v).

       -L localkey, --local-keyfile localkey
              Generate the local key into the specified file.  At least one of (-L) or (-S) must be specified.

       -S sitekey, --site-keyfile sitekey
              Generate the site key into the specified file.  At least one of (-S) or (-L) must be specified.

       -P passphrase, --local-passphrase passphrase
              Specify local passphrase to be used when generating the local key.

       -Q passphrase, --site-passphrase passphrase
              Specify site passphrase to be used when generating the site key.

__________________________________________________________________________________________________________________________________________________

   Changing passphrases:
           -m C            --change-passphrases

           -v              --verbose
           -s              --silent, --quiet
           -L localkey     --local-keyfile localkey

           -S sitekey      --site-keyfile sitekey
           -P passphrase   --local-passphrase passphrase
           -Q passphrase   --site-passphrase passphrase

                           --local-passphrase-old passphraseOld
                           --site-passphrase-old passphraseOld

       -m C, --change-passphrases
              Mode selector.

       -v, --verbose
              Verbose output mode.  Mutually exclusive with (-s).

       -s, --silent, --quiet
              Silent output mode.  Mutually exclusive with (-v).

       -L localkey, --local-keyfile localkey
              Change passphrase used to encrypt the private key in the specified localkey file.  At least one of (-L) or (-S) must be specified.

       -S sitekey, --site-keyfile sitekey
              Change passphrase used to encrypt the private key in the specified sitekey file.  At least one of (-L) or (-S) must be specified.

       -P passphrase, --local-passphrase passphrase
              Specify passphrase used to encrypt the private key in the specified localkey file.

       -Q passphrase, --site-passphrase passphrase
              Specify passphrase used to encrypt the private key in the specified sitekey file.

       --local-passphrase-old passphraseOld
              Specify passphrase used to decrypt the private key in the specified localkey file.

       --site-passphrase-old passphraseOld
              Specify passphrase used to decrypt the private key in the specified sitekey file.

VERSION INFORMATION
       This man page describes twadmin version 2.4.

AUTHORS
       Tripwire, Inc.

COPYING PERMISSIONS
       Permission is granted to make and distribute verbatim copies of this man page provided the copyright notice and this permission notice are
       preserved on all copies.

       Permission is granted to copy and distribute modified versions of this man page under the conditions for verbatim copying, provided that
       the entire resulting derived work is distributed under the terms of a permission notice identical to this one.

       Permission is granted to copy and distribute translations of this man page into another language, under the above conditions for modified
       versions, except that this permission notice may be stated in a translation approved by Tripwire, Inc.

       Copyright 2000 Tripwire, Inc. Tripwire is a registered trademark of Tripwire, Inc. in the United States and other countries. All rights re‐
       served.

SEE ALSO
       twintro(8), tripwire(8), twprint(8), siggen(8), twconfig(4), twpolicy(4), twfiles(5)

                                                                    1 July 2000                                                         TWADMIN(8)
