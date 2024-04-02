DH_DWZ(1)                                                            Debhelper                                                           DH_DWZ(1)

NAME
       dh_dwz - optimize DWARF debug information in ELF binaries via dwz

SYNOPSIS
       dh_dwz [debhelper options] [-Xitem] [-- params]

DESCRIPTION
       Caveat: This tool is experimental and may disappear or change behaviour without any notice.

       dh_dwz is a debhelper program that will optimize the (uncompressed) size of the DWARF debug information in ELF binaries.  It does so by
       running dwz(1) on all the ELF binaries in the package.

OPTIONS
       --dwz-multifile, --no-dwz-multifile
           Whether dwz(1) should generate a multifile from the ELF binaries in the same package (it does by default).  When enabled, if a package
           ships at least 2 ELF binaries, dh_dwz will instruct dwz(1) to generate a multifile for the package.

           Note this options may not work if a package contains more ELF binaries than can fit on a single command line.  If this becomes a
           problem, please pass --no-dwz-multifile to work around the issue.

           The generated multifile will be compressed with objcopy --compress-debug-sections.

       -Xitem, --exclude=item
           Exclude files that contain item anywhere in their filename from being stripped. You may use this option multiple times to build up a
           list of things to exclude.

       -- params
           Pass params to dwz(1) when it processes ELF binaries.  This is mostly useful for setting memory related parameters (e.g. -l and -L).

NOTES
       If the DEB_BUILD_OPTIONS environment variable contains nostrip, nothing will be stripped, in accordance with Debian policy (section 10.1
       "Binaries").

       While this tool technically does not remove debug information from binaries, it is still skipped when the DEB_BUILD_OPTIONS environment
       variable contains nostrip.  This is because nostrip is often used to optimize build times (e.g. for "build and test"-cycles) rather than
       optimizing for size.

SEE ALSO
       debhelper(7)

       This program is a part of debhelper.

AUTHOR
       Niels Thykier <niels@thykier.net>

11.3.2ubuntu1ppa-xenial2                                            2018-07-25                                                           DH_DWZ(1)
