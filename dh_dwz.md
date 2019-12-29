DH_DWZ(1)                                      Debhelper                                     DH_DWZ(1)

NAME
       dh_dwz - optimize DWARF debug information in ELF binaries via dwz

SYNOPSIS
       dh_dwz [debhelper options] [-Xitem] [-- params]

DESCRIPTION
       dh_dwz is a debhelper program that will optimize the (uncompressed) size of the DWARF debug
       information in ELF binaries.  It does so by running dwz(1) on all the ELF binaries in the
       package.

OPTIONS
       --dwz-multifile, --no-dwz-multifile
           Whether dwz(1) should generate a multifile from the ELF binaries in the same package.  When
           enabled, if a package ships at least 2 ELF binaries, dh_dwz will instruct dwz(1) to
           generate a multifile for the package.

           By default, dh_dwz will attempt to create a multifile but will continue without if dwz(1)
           does create one (but succeeds anyway).  This commonly happens when the debug files do not
           contain debug symbols (e.g. a missing -g to the compiler) or when the debug symbols are
           compressed (see Debian bug #931891).  If --dwz-multifile is passed, then dh_dwz will abort
           with an error if dwz(1) does not create a multifile.

           Note this options may not work if a package contains more ELF binaries than can fit on a
           single command line.  If this becomes a problem, please pass --no-dwz-multifile to work
           around the issue.

           The generated multifile will be compressed with objcopy --compress-debug-sections.

           Note for udeb packages: dh_dwz will never generate multifiles for udeb packages.  It will
           still use dwz to reduce the file size of debug files if it finds any.

       -Xitem, --exclude=item
           Exclude files that contain item anywhere in their filename from being stripped. You may use
           this option multiple times to build up a list of things to exclude.

       -- params
           Pass params to dwz(1) when it processes ELF binaries.  This is mostly useful for setting
           memory related parameters (e.g. -l and -L).

NOTES
       If the DEB_BUILD_OPTIONS environment variable contains nostrip, nothing will be stripped, in
       accordance with Debian policy (section 10.1 "Binaries").

       While this tool technically does not remove debug information from binaries, it is still
       skipped when the DEB_BUILD_OPTIONS environment variable contains nostrip.  This is because
       nostrip is often used to optimize build times (e.g. for "build and test"-cycles) rather than
       optimizing for size.

SEE ALSO
       debhelper(7)

       This program is a part of debhelper.

AUTHOR
       Niels Thykier <niels@thykier.net>

12.6.1ubuntu2                                 2019-09-17                                     DH_DWZ(1)
