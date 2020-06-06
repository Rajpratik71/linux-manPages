GTK-UPDATE-ICON-C(1)                                                                         [FIXME: manual]                                                                         GTK-UPDATE-ICON-C(1)

NAME
       gtk-update-icon-cache - Icon theme caching utility

SYNOPSIS
       gtk-update-icon-cache [--force] [--ignore-theme-index] [--index-only | --include-image-data] [--source NAME] [--quiet] [--validate] {iconpath}

DESCRIPTION
       gtk-update-icon-cache creates mmap()able cache files for icon themes.

       It expects to be given the path to a icon theme directory containing an index.theme, e.g.  /usr/share/icons/hicolor, and writes a icon-theme.cache containing cached information about the icons
       in the directory tree below the given directory.

       GTK+ can use the cache files created by gtk-update-icon-cache to avoid a lot of system call and disk seek overhead when the application starts. Since the format of the cache files allows them to
       be mmap()ed shared between multiple applications, the overall memory consumption is reduced as well.

OPTIONS
       --force, -f
           Overwrite an existing cache file even if it appears to be uptodate.

       --ignore-theme-index, -t
           Don't check for the existence of 'index.theme' in the icon theme directory. Without this option, gtk-update-icon-cache refuses to create an icon cache in a directory which does not appear to
           be the toplevel directory of an icon theme.

       --index-only, -i
           Don't include image data in the cache.

       --include-image-data
           Include image data in the cache.

       --source, -c
           Output a C header file declaring a constant name with the contents of the icon cache.

       --quiet, -q
           Turn off verbose output.

       --validate, -v
           Validate existing icon cache.

BUGS
       None known yet.

[FIXME: source]                                                                                 08/02/2017                                                                           GTK-UPDATE-ICON-C(1)
