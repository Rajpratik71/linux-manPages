DH_INSTALLCATALOGS(1)                          Debhelper                         DH_INSTALLCATALOGS(1)

NAME
       dh_installcatalogs - install and register SGML Catalogs

SYNOPSIS
       dh_installcatalogs [debhelper options] [-n]

DESCRIPTION
       dh_installcatalogs is a debhelper program that installs and registers SGML catalogs. It
       complies with the Debian XML/SGML policy.

       Catalogs will be registered in a supercatalog, in /etc/sgml/package.cat.

       This command automatically adds maintainer script snippets for registering and unregistering
       the catalogs and supercatalogs (unless -n is used). These snippets are inserted into the
       maintainer scripts and the triggers file by dh_installdeb; see dh_installdeb(1) for an
       explanation of Debhelper maintainer script snippets.

       A dependency on sgml-base will be added to ${misc:Depends}, so be sure your package uses that
       variable in debian/control.

FILES
       debian/package.sgmlcatalogs
           Lists the catalogs to be installed per package. Each line in that file should be of the
           form "source dest", where source indicates where the catalog resides in the source tree,
           and dest indicates the destination location for the catalog under the package build area.
           dest should start with /usr/share/sgml/.

OPTIONS
       -n, --no-scripts
           Do not modify postinst/postrm/prerm scripts nor add an activation trigger.

NOTES
       Note that this command is not idempotent. dh_prep(1) should be called between invocations of
       this command. Otherwise, it may cause multiple instances of the same text to be added to
       maintainer scripts.

SEE ALSO
       debhelper(7)

       /usr/share/doc/sgml-base-doc/

AUTHOR
       Adam Di Carlo <aph@debian.org>

12.6.1ubuntu2                                 2019-09-17                         DH_INSTALLCATALOGS(1)
