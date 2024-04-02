KETCHUP(1)                                                    General Commands Manual                                                   KETCHUP(1)

NAME
       ketchup - Utility to update the kernel source

SYNOPSIS
       ketchup [options] <ver>

DESCRIPTION
       This tool synchronises a local kernel tree with a desired kernel version and patch set from a kernel.org mirror. The default requires a GPG
       key on your keyring, to verify the identity of the patches and source archives. Entire kernel images are not downloaded  unless  necessary,
       so bandwidth is saved.  Patches are applied and removed as necessary to attain the requested version.

OPTIONS
       -a --archive (~/.ketchup)

              cache directory

       -d --directory (.)

              directory to update

       -f --full-tarball

              if unpacking a tarball, download the latest

       -g --gpg-path (/usr/bin/gpg)

              path for GnuPG

       -G --no-gpg

              disable GPG signature verification

       -k --kernel-url (http://www.kernel.org/pub/linux/kernel)

              base url for kernel.org mirror

       -l --list-trees

              list supported trees

       -m --show-makefile

              output version in makefile <arg>

       -n --dry-run

              don't download or apply patches

       -o --only-dl

              don't apply patches

       -p --show-previous

              output version previous to <arg>

       -q --quiet

              reduce output

       -r --rename-directory

              rename updated directory to linux-<v>

       -s --show-latest

              output the latest version of <arg>

       -u --show-url

              output URL for <arg>

       -w --wget (/usr/bin/wget)

              command to use for wget

CONFIGURATION
       Ketchup will read files named .ketchuprc in $HOME and in the target kernel directory, with the kernel directory taking precedence.

       A .ketchuprc file uses the Python syntax and may set the following variables:

       default_tree

              The default_tree option specifies the kernel version to work with if one is not given on the command line.

       precommand

              The precommand option specifies a command to run before synchronising the kernel tree to the required version.

       postcommand

              The postcommand option specifies a command to run after synchronising the kernel tree to the required version.

AUTHOR
       ketchup was written by Matt Mackall <mpm@selenic.com>.

       This manual page was written by Baruch Even <baruch@debian.org>, for the Debian project (but may be used by others). Description text taken
       from a former packaging attempt of Jack Wasey <debian@jackwasey.com>.

                                                                 February 16, 2010                                                      KETCHUP(1)
