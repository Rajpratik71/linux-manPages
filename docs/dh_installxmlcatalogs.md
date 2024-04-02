DH_INSTALLXMLCATALOGS(1)                                                                       Debhelper                                                                      DH_INSTALLXMLCATALOGS(1)

NAME
       dh_installxmlcatalogs - install and register XML catalog files

SYNOPSIS
       dh_installxmlcatalogs [debhelper options] [-n]

DESCRIPTION
       dh_installxmlcatalogs is a debhelper program that installs and registers XML catalog files.  It complies with the Debian XML/SGML policy.

       The file debian/package.xmlcatalogs lists the local XML catalog files to be installed per package as well as the XML entities in those local XML catalog files that are to be registered in the
       XML catalog system.

       The local XML catalog file entries in that file should be of the form "local;source;dest", where the verbatim "local" indicates this is an entry for a local XML catalog file, "source"
       indicates where the local XML catalog resides in the source tree, and "dest" indicates the destination location for the local XML catalog under the package build area.  "dest" should start
       with /usr/share/xml/.

       The entries for the XML entities to be registered in the package XML catalog file should be of the form "package;type;id;catalog", where the verbatim "package" indicates this is an entry for
       an XML entity to be registered in the package XML catalog file, "type" indicates the XML entity type (public, system, uri), "id" indicates the XML entity id, and "catalog" indicates the local
       XML catalog file.

       The entries for the XML entities to be registered in the root XML catalog file should be of the form "root;type;id", where the verbatim "root" indicates this is an entry for an XML entity to
       be registered in the root XML catalog file, "type" indicates the XML entity type (public, system, uri), and "id" indicates the XML entity id.

       If an entry for is to be registered identically in the root catalog and the package catalog file, you can use the form "root-and-package;type;id;catalog", where the verbatim
       "root-and-package" indicates this is an entry for an XML entity to be registered in both the root and package XML catalog files, "type" indicates the XML entity type (public, system, uri),
       "id" indicates the XML entity id, and "catalog" indicates the local XML catalog file.

       XML entity types are described in update-xmlcatalog(8).  Using the "root" or "package" commands, a type of "public" will general "delegatePublic" statements in the applicable catalog file.
       Generally you will want to use the types "public" for any formal public identifiers, and "system" for any files on the local filesystem or URLs.  "uri" is only used for non-local files which
       are not part of the external document subset, e.g., they are not used for entities or DTDs.

       dh_installxmlcatalogs automatically adds maintainer script snippets for the registration and unregistration of the listed XML entities in the XML catalog system (unless -n is used).  A
       dependency on the xml-core package will be added to "${misc:Depends}", so be sure to use that variable in the file debian/control.  See dh_installdeb(1) for an explanation of Debhelper
       maintainer script snippets.

OPTIONS
       -n, --noscripts
           Do not modify postinst/postrm/prerm scripts.

NOTES
       Note that this command is not idempotent. "dh_clean -k" should be called between invocations of this command. Otherwise, it may cause multiple instances of the same text to be added to
       maintainer scripts.

SEE ALSO
       debhelper(7)

       /usr/share/doc/xml-core/

AUTHOR
       Ardo van Rangelrooij <ardo@debian.org>

       Adam Di Carlo <aph@debian.org>

perl v5.26.0                                                                                  2016-11-07                                                                      DH_INSTALLXMLCATALOGS(1)
