DEBSUMS(8)                                                    System Manager's Manual                                                   DEBSUMS(8)

NAME
       debsums_init - Initialize md5sums files for packages lacking them

SYNOPSIS
       debsums_init

DESCRIPTION
       debsums_init  will  look  for packages that did not install their md5sums files. Then, it will generate those md5sums files from the binary
       packages downloaded via APT if available.

       This initialization process is needed since there are many packages which do not ship md5sums file in their binary packages.  If you enable
       auto-gen option while installing debsum package, you need to run this debsums_init command only once after you install the debsums package.

       debsums_init needs to be invoked as superuser.

       You  may  wish to clear local package cache prior to running debsums_init command to make sure you are creating from the untainted packages
       by executing:

            apt-get clean

AUTHOR
       Osamu Aoki <osamu@debian.org>

DEBIAN                                                           Debian Utilities                                                       DEBSUMS(8)
