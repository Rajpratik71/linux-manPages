DH_INSTALLINITRAMFS(1)                                               Debhelper                                              DH_INSTALLINITRAMFS(1)

NAME
       dh_installinitramfs - install initramfs hooks and setup maintscripts

SYNOPSIS
       dh_installinitramfs [debhelper options] [-n]

DESCRIPTION
       dh_installinitramfs is a debhelper program that is responsible for installing Debian package provided initramfs hooks.

       If dh_installinitramfs installs or (in compat 12 or later) detects one or more initramfs hooks in the package, then it also automatically
       generates the postinst and postrm commands needed to interface with the Debian initramfs system.  These commands are inserted into the
       maintainer scripts by dh_installdeb(1).

FILES
       debian/package.initramfs-hook
           Assumed to be an initramfs hook that will be installed into usr/share/initramfs-tools/hooks/package in the package build directory. See
           HOOK SCRIPTS in initramfs-tools(8) for more information about initramfs hooks.

OPTIONS
       -n, --no-scripts
           Do not modify postinst/postrm scripts.

NOTES
       Note that this command is not idempotent. dh_prep(1) should be called between invocations of this command. Otherwise, it may cause multiple
       instances of the same text to be added to maintainer scripts.

SEE ALSO
       debhelper(7) update-initramfs(8) initramfs-tools(8)

       This program is a part of debhelper.

11.3.2ubuntu1ppa-xenial2                                            2018-07-25                                              DH_INSTALLINITRAMFS(1)
