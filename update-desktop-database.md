UPDATE-DESKTOP-DATABASE(1)                                                               General Commands Manual                                                               UPDATE-DESKTOP-DATABASE(1)

NAME
       update-desktop-database - Build cache database of MIME types handled by desktop files

SYNOPSIS
       update-desktop-database [-q|--quiet] [-v|--verbose] [DIRECTORY...]

DESCRIPTION
       The update-desktop-database program is a tool to build a cache database of the MIME types handled by desktop files.

       The  cache database contains the list of MIME types that can be handled by desktop files, as well as, for each MIME type, a list of desktop files that can handle this MIME type. This cache data‐
       base ease the work of applications that need to find an application that can open a document of a specific MIME type: those applications will not have to parse all the desktop files existing  on
       the system, and can instead parse this cache database.

       If no DIRECTORY is specified as argument, the desktop files that will be processed are the ones installed in $XDG_DATA_DIRS/applications.

       If both the --quiet and --verbose options are used, then --verbose will be ignored.

OPTIONS
       The following options are supported:

       -q, --quiet
              Do not display any information about processing and updating progress.

       -v, --verbose
              Display more information about processing and updating progress.

NOTES
       If an invalid MIME type is met, it will be ignored and the creation of the cache database will continue.

       The  format  of  the  cache  database is a simple desktop entry format, with a MIME Cache group, containing one key per MIME type. The key name is the MIME type, and the key value is the list of
       desktop file that can handle this MIME type.

       The order of the desktop files found for a MIME type is not significant.  Therefore, an external mechanism must be used to determine what is the preferred desktop file for a MIME type.

EXAMPLE
       Here is a simple example of a cache database:

               [MIME Cache]
               application/x-shellscript=gedit.desktop;
               text/plain=gedit.desktop;gvim.desktop;
               video/webm=totem.desktop;

       This cache database is created with three desktop files, each containing a MimeType key:

               gedit.desktop: MimeType=text/plain;application/x-shellscript;
               gvim.desktop: MimeType=text/plain;
               totem.desktop: MimeType=video/webm;

FILES
       $XDG_DATA_DIRS/applications/mimeinfo.cache

              This file is the cache database created by update-desktop-database.

BUGS
       If you find bugs in the update-desktop-database program, please report these on https://bugs.freedesktop.org.

                                                                                             FREEDESKTOP.ORG                                                                   UPDATE-DESKTOP-DATABASE(1)
