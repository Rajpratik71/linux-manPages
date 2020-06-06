XDG-MIME(1)                                                                                  xdg-mime Manual                                                                                  XDG-MIME(1)

NAME
       xdg-mime - command line tool for querying information about file type handling and adding descriptions for new file types

SYNOPSIS
       xdg-mime query {filetype | default} ...

       xdg-mime default application mimetype(s)

       xdg-mime install [--mode mode] [--novendor] mimetypes-file

       xdg-mime uninstall [--mode mode] mimetypes-file

       xdg-mime {--help | --manual | --version}

DESCRIPTION
       The xdg-mime program can be used to query information about file types and to add descriptions for new file types.

COMMANDS
       query
           Returns information related to file types.

           The query option is for use inside a desktop session only. It is not recommended to use xdg-mime query as root.

           The following queries are supported:

           query filetype FILE: Returns the file type of FILE in the form of a MIME type.

           query default mimetype: Returns the default application that the desktop environment uses for opening files of type mimetype. The default application is identified by its *.desktop file.

       default
           Ask the desktop environment to make application the default application for opening files of type mimetype. An application can be made the default for several file types by specifying
           multiple mimetypes.

           application is the desktop file id of the application and has the form vendor-name.desktop application must already be installed in the desktop menu before it can be made the default
           handler. The application's desktop file must list support for all the MIME types that it wishes to be the default handler for.

           Requests to make an application a default handler may be subject to system policy or approval by the end-user. xdg-mime query can be used to verify whether an application is the actual
           default handler for a specific file type.

           The default option is for use inside a desktop session only. It is not recommended to use xdg-mime default as root.

       install
           Adds the file type descriptions provided in mimetypes-file to the desktop environment.  mimetypes-file must be a XML file that follows the freedesktop.org Shared MIME-info Database
           specification and that has a mime-info element as its document root. For each new file type one or more icons with name type-subtype must be installed with the xdg-icon-resource command in
           the mimetypes context. For example the filetype application/vnd.oasis.opendocument.text requires an icon named application-vnd.oasis.opendocument.text to be installed (unless the file type
           recommends another icon name).

       uninstall
           Removes the file type descriptions provided in mimetypes-file and previously added with xdg-mime install from the desktop environment.  mimetypes-file must be a XML file that follows the
           freedesktop.org Shared MIME-info Database specification and that has a mime-info element as its document root.

OPTIONS
       --mode mode
           mode can be user or system. In user mode the file is (un)installed for the current user only. In system mode the file is (un)installed for all users on the system. Usually only root is
           allowed to install in system mode.

           The default is to use system mode when called by root and to use user mode when called by a non-root user.

       --novendor
           Normally, xdg-mime checks to ensure that the mimetypes-file to be installed has a proper vendor prefix. This option can be used to disable that check.

           A vendor prefix consists of alpha characters ([a-zA-Z]) and is terminated with a dash ("-"). Companies and organizations are encouraged to use a word or phrase, preferably the organizations
           name, for which they hold a trademark as their vendor prefix. The purpose of the vendor prefix is to prevent name conflicts.

       --help
           Show command synopsis.

       --manual
           Show this manual page.

       --version
           Show the xdg-utils version information.

ENVIRONMENT VARIABLES
       xdg-mime honours the following environment variables:

       XDG_UTILS_DEBUG_LEVEL
           Setting this environment variable to a non-zero numerical value makes xdg-mime do more verbose reporting on stderr. Setting a higher value increases the verbosity.

       XDG_UTILS_INSTALL_MODE
           This environment variable can be used by the user or administrator to override the installation mode. Valid values are user and system.

EXIT CODES
       An exit code of 0 indicates success while a non-zero exit code indicates failure. The following failure codes can be returned:

       1
           Error in command line syntax.

       2
           One of the files passed on the command line did not exist.

       3
           A required tool could not be found.

       4
           The action failed.

       5
           No permission to read one of the files passed on the command line.

SEE ALSO
       xdg-icon-resource(1), xdg-desktop-menu(1), Shared MIME database specification[1], MIME applications associations specification[2]

EXAMPLES
           xdg-mime query filetype /tmp/foobar.png

       Prints the MIME type of the file /tmp/foobar.png, in this case image/png

           xdg-mime query default image/png

       Prints the .desktop filename of the application which is registered to open PNG files.

           xdg-mime install shinythings-shiny.xml

       Adds a file type description for "shiny"-files. "shinythings-" is used as the vendor prefix. The file type description could look as follows.

           shinythings-shiny.xml:

           <?xml version="1.0"?>
           <mime-info xmlns='http://www.freedesktop.org/standards/shared-mime-info'>
             <mime-type type="text/x-shiny">
               <comment>Shiny new file type</comment>
               <glob pattern="*.shiny"/>
               <glob pattern="*.shi"/>
             </mime-type>
           </mime-info>

       An icon for this new file type must also be installed, for example with:

           xdg-icon-resource install --context mimetypes --size 64 shiny-file-icon.png text-x-shiny

AUTHORS
       Kevin Krammer
           Author.

       Jeremy White
           Author.

COPYRIGHT
       Copyright © 2006

NOTES
        1. Shared MIME database specification
           http://www.freedesktop.org/wiki/Specifications/shared-mime-info-spec/

        2. MIME applications associations specification
           http://www.freedesktop.org/wiki/Specifications/mime-apps-spec/

xdg-utils 1.0                                                                                   05/21/2018                                                                                    XDG-MIME(1)
