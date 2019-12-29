RPMSIGN(8)                              System Manager's Manual                             RPMSIGN(8)

NAME
       rpmsign - RPM Package Signing

SYNOPSIS
   SIGNING PACKAGES:
       rpm --addsign|--resign [rpmsign-options] PACKAGE_FILE ...

       rpm --delsign PACKAGE_FILE ...

   rpmsign-options
       [--fskpath KEY] [--signfiles]

DESCRIPTION
       Both  of the --addsign and --resign options generate and insert new signatures for each package
       PACKAGE_FILE given, replacing any existing signatures. There are  two  options  for  historical
       reasons, there is no difference in behavior currently.

       rpm --delsign PACKAGE_FILE ...

       Delete all signatures from each package PACKAGE_FILE given.

   SIGN OPTIONS
       --fskpath KEY
              Used with --signfiles, use file signing key Key.

       --signfiles
              Sign  package  files. The macro %_binary_filedigest_algorithm must be set to a supported
              algorithm before building the  package.  The  supported  algorithms  are  SHA1,  SHA256,
              SHA384,  and  SHA512,  which  are represented as 2, 8, 9, and 10 respectively.  The file
              signing key (RSA private key) must be set before signing the package, it can be  config‐
              ured on the command line with --fskpath or the macro %_file_signing_key.

   USING GPG TO SIGN PACKAGES
       In  order  to  sign packages using GPG, rpm must be configured to run GPG and be able to find a
       key ring with the appropriate keys. By default, rpm uses the same conventions as  GPG  to  find
       key rings, namely the $GNUPGHOME environment variable.  If your key rings are not located where
       GPG expects them to be, you will need to configure the macro %_gpg_path to be the  location  of
       the  GPG  key  rings  to use.  If you want to be able to sign packages you create yourself, you
       also need to create your own public and secret key pair (see the GPG  manual).  You  will  also
       need to configure the rpm macros

       %_gpg_name
              The name of the "user" whose key you wish to use to sign your packages.

       For  example, to be able to use GPG to sign packages as the user "John Doe <jdoe@foo.com>" from
       the key rings located in /etc/rpm/.gpg using the executable /usr/bin/gpg you would include

       %_gpg_path /etc/rpm/.gpg
       %_gpg_name John Doe <jdoe@foo.com>
       %__gpg /usr/bin/gpg

       in a macro configuration file. Use /etc/rpm/macros for  per-system  configuration  and  ~/.rpm‐
       macros for per-user configuration. Typically it's sufficient to set just %_gpg_name.

SEE ALSO
       popt(3),
       rpm(8),
       rpmdb(8),
       rpmkeys(8),
       rpm2cpio(8),
       rpmbuild(8),
       rpmspec(8),

       rpmsign  --help  -  as rpm supports customizing the options via popt aliases it's impossible to
       guarantee that what's described in the manual matches what's available.

       http://www.rpm.org/ <URL:http://www.rpm.org/>

AUTHORS
       Marc Ewing <marc@redhat.com>
       Jeff Johnson <jbj@redhat.com>
       Erik Troan <ewt@redhat.com>
       Panu Matilainen <pmatilai@redhat.com>
       Fionnuala Gunter <fin@linux.vnet.ibm.com>

                                             Red Hat, Inc                                   RPMSIGN(8)
