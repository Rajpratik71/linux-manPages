APPSTREAMCLI(1)                 appstream-cli                 APPSTREAMCLI(1)

NAME
       appstreamcli - Handle AppStream metadata and the AppStream index

SYNOPSIS
       appstreamcli [COMMAND]

DESCRIPTION
       This manual page documents briefly the appstreamcli command.

       appstreamcli is a small helper tool to work with AppStream metadata
       and access the AppStream component index from the command-line. The
       AppStream component index contains a list of all available software
       components for your distribution, matched to their package names. It
       is generated using AppStream XML or Debian DEP-11 data, which is
       provided by your distributor.

       For more information about the AppStream project and the other
       components which are part of it, take a look at the AppStream pages at
       Freedesktop.org[1].

OPTIONS
       status
           Display various information about the installed metadata and the
           metadata cache.

       get ID
           Get a component by it's identifier.

       s, search TERM
           Search the AppStream component database for a given search term.

       what-provides TYPE TERM
           Return components which provide a given item. An item type can be
           specified using the TYPE parameter, a value to search for has to
           be supplied using the TERM parameter.

           Examples:

           Get components which handle the "text/xml" mimetype.

           appstreamcli what-provides mimetype "text/xml"

           Get component which provides the "libfoo.so.2" library.

           appstreamcli what-provides lib libfoo.so.2

       refresh, refresh-cache
           Trigger a database refresh, if necessary. In case you want to
           force the database to be rebuilt, supply the --force flag.

           This command must be executed with root permission.

       dump ID
           Dump the XML description of a component with the given ID.

       validate FILES
           Validate AppStream XML metadata for compliance with the
           specification.

           Both XML metadata types, upstream and distro XML, are handled. The
           filetype which should be validated is determined automatically.

           The --pedantic flag triggers a more pedantic validation of the
           file, including minor and style issues in the report.

       validate-tree DIRECTORY
           Validate AppStream XML metadata found in a file-tree.

           This performs a standard validation of all found metadata, but
           also checks for additional errors, like the presence of .desktop
           files and validity of other additional metadata.

       install ID
           Install a software component by its ID.

           This resolves the AppStream component ID to the package name which
           provides it and then calls the distribution's package manager to
           install the software.

           This feature is experimental.

       put FILE
           Install a metadata file into the right directory on the current
           machine.

       new-template TYPE FILE
           Create a metainfo file template to be used by software projects.
           The --from-desktop option can be used to use a .desktop file as
           template for generating the example file.

           The generated files contain example entries which need to be filed
           in with the actual desired values by the project author.

           The first TYPE parameter is the name of an AppStream component
           type. For a complete list check out the documentation[2] or the
           help output of appstreamcli for this subcommand.

       --details
           Print out more information about a found component.

       --no-color
           Don't print colored output.

       --no-net
           Do not access the network when validating metadata.

           The same effect can be achieved by setting the AS_VALIDATE_NONET
           environment variable before running appstreamcli.

       --version
           Display the version number of appstreamcli

SEE ALSO
       pkcon (1).

AUTHOR
       This manual page was written by Matthias Klumpp
       <matthias@tenstral.net>.

COPYRIGHT
       Copyright © 2012-2016 Matthias Klumpp

NOTES
        1. Freedesktop.org
           http://www.freedesktop.org/wiki/Distributions/AppStream/

        2. the documentation
           https://www.freedesktop.org/software/appstream/docs/chap-Metadata.html

AppStream                                                     APPSTREAMCLI(1)
