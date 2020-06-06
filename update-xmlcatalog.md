UPDATE-XMLCATALOG(8)                                                                             xml-core                                                                            UPDATE-XMLCATALOG(8)

NAME
       update-xmlcatalog - maintain XML catalog files

SYNOPSIS
       update-xmlcatalog --add --root --package package --type type --id id

       update-xmlcatalog --del --root --package package --type type --id id

       update-xmlcatalog --add --package package --local local --type type --id id

       update-xmlcatalog --del --package package --local local --type type --id id

       update-xmlcatalog --add --local local --file file --type type --id id

       update-xmlcatalog --del --local local --file file --type type --id id

       update-xmlcatalog --help

DESCRIPTION
       update-xmlcatalog add entries to and removes entries from the root XML catalog file, a package XML catalog file or a local XML catalog file.

OPTIONS
       --add
           Adds the entry to the root XML catalog file, a package XML catalog file or a local XML catalog file.  If the XML catalog file does not exist yet, it is automatically created.

       --del
           Deletes the entry from the root XML catalog file, the package XML catalog file or the local XML catalog file.  A resulting empty XML catalog is not automatically deleted from the filesystem.

       --file file
           Indicates a local filename.

       --id id
           Indicates the XML catalog file entry identifier.

       --local local
           Indicates a local XML catalog file.

       --package package
           Indicates a package XML catalog file.

       --root
           Indicates the root XML catalog file.

       --type type
           Indicates the XML catalog file entry type (public, system, uri).

       --help
           Displays the usage information.

NOTES
       update-xmlcatalog is the de-facto standard tool to be used to maintain XML catalog files on a Debian system, similar to that update-catalog(8) is the standard tool to be used to main SGML
       catalog files on a Debian system.  A Debian XML Policy document to this effect is currently under development.

       update-xmlcatalog and xmlcatalog(1) are incompatible.  The former has an internal database of all the entries in all the XML catalog files it maintains and regenerates the indicated XML catalog
       file completely from scratch upon an update.  The latter updates the indicated XML catalog file directly.  This means that any change made to an XML catalog file using xmlcatalog(1) is
       overwritten the next time that XML catalog file is updated using update-xmlcatalog.

SEE ALSO
       /usr/share/doc/xml-core/README.Debian

AUTHOR
       Ardo van Rangelrooij <ardo@debian.org>

perl v5.14.2                                                                                    2008-10-14                                                                           UPDATE-XMLCATALOG(8)
