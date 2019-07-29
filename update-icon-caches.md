UPDATE-ICON-CACHES(8)                                                                   System Manager's Manual                                                                  UPDATE-ICON-CACHES(8)

NAME
       update-icon-caches - Update wrapper script for the icon caches

SYNOPSIS
       update-icon-caches directory [ ... ]

DESCRIPTION
       update-icon-caches is a wrapper script for updating the icon caches in a list of directories.

       In each of the directories passed as arguments, the icon cache is updated if it is already present. It is not created if it does not already exist.

       If the theme index file is not present, the icon cache is removed.

SEE ALSO
       gtk-update-icon-cache(1)

AUTHOR
       This manual page was written by Josselin Mouette <joss@debian.org>, for the Debian GNU/Linux system.

                                                                                             13 July 2007                                                                        UPDATE-ICON-CACHES(8)
