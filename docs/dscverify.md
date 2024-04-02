DSCVERIFY(1)                                                  General Commands Manual                                                 DSCVERIFY(1)

NAME
       dscverify - verify the validity of a Debian package

SYNOPSIS
       dscverify [--keyring keyring] ... changes_or_dsc_filename ...

DESCRIPTION
       dscverify  checks  that  the  GPG  signatures  on  the  given .changes or .dsc files are good signatures made by keys in the current Debian
       keyrings, found in the debian-keyring and debian-maintainers packages.  (Additional keyrings can be specified using  the  --keyring  option
       any  number  of times.)  It then checks that the other files listed in the .changes or .dsc files have the correct sizes and checksums (MD5
       plus SHA1 and SHA256 if the latter are present).  The exit status is 0 if there are no problems and non-zero otherwise.

OPTIONS
       --keyring keyring
              Add keyring to the list of keyrings to be used.

       --no-default-keyrings
              Do not use the default set of keyrings.

       --no-conf, --noconf
              Do not read any configuration files.  This can only be used as the first option given on the command-line.

       --nosigcheck, --no-sig-check, -u
              Skip the signature verification step. That is, only verify the sizes and checksums of the files  listed  in  the  .changes  or  .dsc
              files.

       --verbose
              Do not suppress GPG output.

       --help, -h
              Display a help message and exit successfully.

       --version
              Display version and copyright information and exit successfully.

CONFIGURATION VARIABLES
       The  two  configuration  files  /etc/devscripts.conf and ~/.devscripts are sourced by a shell in that order to set configuration variables.
       Environment variable settings are ignored for this purpose.  If the first command line option given is --noconf or  --no-conf,  then  these
       files will not be read.  The currently recognised variable is:

       DSCVERIFY_KEYRINGS
              This is a colon-separated list of extra keyrings to use in addition to any specified on the command line.

KEYRING
       Please  note  that  the keyring provided by the debian-keyring package can be slightly out of date. The latest version can be obtained with
       rsync, as documented in the README that comes with debian-keyring.  If you sync the keyring to a non-standard location (see below), you can
       use the possibilities to specify extra keyrings, by either using the above mentioned configuration option or the --keyring option.

       Below is an example for an alias:

       alias dscverify='dscverify --keyring ~/.gnupg/pubring.gpg'

STANDARD KEYRING LOCATIONS
       By default dscverify searches for the debian-keyring in the following locations:

       - ~/.gnupg/trustedkeys.gpg

       - /org/keyring.debian.org/keyrings/debian-keyring.gpg

       - /usr/share/keyrings/debian-keyring.gpg

       - /usr/share/keyrings/debian-maintainers.gpg

SEE ALSO
       gpg(1), gpg2(1), devscripts.conf(5)

AUTHOR
       dscverify was written by Roderick Schertler <roderick@argon.org> and posted on the debian-devel@lists.debian.org mailing list, with several
       modifications by Julian Gilbey <jdg@debian.org>.

DEBIAN                                                           Debian Utilities                                                     DSCVERIFY(1)
