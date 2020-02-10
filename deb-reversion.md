DEB-REVERSION(1)                                                                             [FIXME: manual]                                                                             DEB-REVERSION(1)

NAME
       deb-reversion - simple script to change the version of a .deb file

SYNOPSIS
       deb-reversion [options] .deb-file [log message...]

DESCRIPTION
       deb-reversion unpacks the specified .deb file, changes the version number in the relevant locations, appends a Debian changelog entry with the specified contents, and creates a new .deb file
       with the updated version.

       By default, the tool creates a new version number suitable for local changes, such that the new package will be greater than the current one, but lesser than any future, official Debian
       packages. With -v version, the version number can be specified directly. On the other hand, the -c simply calculates the new version number but does not generate a new package.

       When building a .deb file, root privileges are required in order to have the correct permissions and ownerships in the resulting .deb file. This can be achieved either by running deb-reversion
       as root or running under fakeroot(1), as 'fakeroot deb-reversion foo.deb'.

       With -k hook, a hook script may be specified, which is run on the unpacked binary packages just before it is repacked. If you want to write changelog entries from within the hook, use 'dch -a --
       your message'. (Alternatively, do not give a changelog entry on the deb-reversion command line and dch will be called automatically.) The hook command must be placed in quotes if it has more
       than one word; it is called via sh -c.

OPTIONS
       -v new-version, --new-version new-version
           Specifies the version number to be used for the new version. Passed to dch(1).

       -o old-version, --old-version old-version
           Specifies the version number to be used as the old version instead of the version stored in the .deb's control file.

       -c, --calculate-only
           Only calculate and display the new version number which would be used; do not build a new .deb file. Cannot be used in conjunction with -v.

       -s string, --string string
           Instead of using 'LOCAL.' as the version string to append to the old version number, use string instead.

       -k hook-command, --hook hook-command
           A hook command to run after unpacking the old .deb file and modifying the changelog, and before packing up the new .deb file. Must be in quotes if it is more than one (shell) word. Only one
           hook command may be specified; if you want to perform more than this, you could specify 'bash' as the hook command, and you will then be given a shell to work in.

       -D, --debug
           Pass --debug to dpkg-deb(1).

       -b, --force-bad-version
           Pass --force-bad-version to dch(1)

       -h, --help
           Display usage information.

       -V, --version
           Display version information.

SEE ALSO
       dch(1), dpkg-deb(1), fakeroot(1)

DISCLAIMER
       deb-reversion is a tool intended to help porters with modifying packages for other architectures, and to augment deb-repack, which creates modified packages with identical version numbers as the
       official packages. Chaos will ensue! With deb-reversion, a proper version number can be selected, which does not obstruct the next official release but can be specifically pinned with APT or
       held with dpkg.

       Please take note that deb-reversion does not come without problems. While it works fine in most cases, it may just not in yours. Especially, please consider that it changes binary packages
       (only!) and hence can break strict versioned dependencies between binary packages generated from the same source.

       You are using this tool at your own risk and I shall not shed a tear if your gerbil goes up in flames, your microwave attacks the stereo, or the angry slamming of your fist spills your coffee
       into the keyboard, which sets off a chain reaction resulting in a vast amount of money transferred from your account to mine.

AUTHOR
       deb-reversion is Copyright 2004-5 by martin f. krafft <madduck@debian.org> and modifications are Copyright 2006 by Julian Gilbey <jdg@debian.org>.

       Permission is granted to copy, distribute and/or modify this document under the terms of the Artistic License: http://www.opensource.org/licenses/artistic-license.php. On Debian systems, the
       complete text of the Artistic License can be found in /usr/share/common-licenses/Artistic.

       This manual page was written by martin f. krafft <madduck@debian.org> and modified by Julian Gilbey <jdg@debian.org>.

NOTES
        1. http://www.opensource.org/licenses/artistic-license.php

[FIXME: source]                                                                                Feb 13, 2006                                                                              DEB-REVERSION(1)
