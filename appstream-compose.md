APPSTREAM-COMPOSE(1)                                                                            User Commands                                                                            APPSTREAM-COMPOSE(1)



NAME
       appstream-compose - Generate AppStream metadata

SYNOPSIS
       appstream-compose [OPTION...]

DESCRIPTION
       This manual page documents briefly the appstream-compose command.

       appstream-compose is a simple app that takes a prefix (default /usr) and a set of application names. It looks for appdata, metainfo, desktop and icon files with that basename in
       $prefix/share/[appdata|metainfo|applications|icons] and generates appstream xml files and icons in (by default) $prefix/share/app-info.

AUTHOR
       This manual page was written by Richard Hughes <richard@hughsie.com>.



User Commands                                                                                                                                                                            APPSTREAM-COMPOSE(1)
