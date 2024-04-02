DH_INSTALLXFONTS(1)                                                  Debhelper                                                 DH_INSTALLXFONTS(1)

NAME
       dh_installxfonts - register X fonts

SYNOPSIS
       dh_installxfonts [debhelper options]

DESCRIPTION
       dh_installxfonts is a debhelper program that is responsible for registering X fonts, so their corresponding fonts.dir, fonts.alias, and
       fonts.scale be rebuilt properly at install time.

       Before calling this program, you should have installed any X fonts provided by your package into the appropriate location in the package
       build directory, and if you have fonts.alias or fonts.scale files, you should install them into the correct location under etc/X11/fonts in
       your package build directory.

       Your package should depend on xfonts-utils so that the update-fonts-* commands are available. (This program adds that dependency to
       ${misc:Depends}.)

       This program automatically generates the postinst and postrm commands needed to register X fonts. These commands are inserted into the
       maintainer scripts by dh_installdeb. See dh_installdeb(1) for an explanation of how this works.

NOTES
       See update-fonts-alias(8), update-fonts-scale(8), and update-fonts-dir(8) for more information about X font installation.

       See Debian policy, section 11.8.5. for details about doing fonts the Debian way.

SEE ALSO
       debhelper(7)

       This program is a part of debhelper.

AUTHOR
       Joey Hess <joeyh@debian.org>

11.3.2ubuntu1ppa-xenial2                                            2018-07-25                                                 DH_INSTALLXFONTS(1)
