GCONF-EDITOR(1)                                               General Commands Manual                                              GCONF-EDITOR(1)

NAME
       gconf-editor - an editor for the GConf configuration system

SYNOPSIS
       gconf-editor

DESCRIPTION
       GConf-Editor  is  a  tool  used for editing the GConf configuration database.  It might be useful when the proper configuration utility for
       some software provides no way of changing some option.

USAGE
       The main window consists of a tree showing the GConf configuration database hierarchy, a list of the keys available, and documentation  for
       the selected key.

       Key  values  can  be  changed by either changing them directly in the list, or right clicking on them and selecting Edit key.  Changes take
       immediate effect in running programs.  New keys can be added by right clicking in the list and selecting New key.

       Bookmarks may be set for quick lookup of a key later.

NOTES
       This tool allows you to directly edit your configuration database.  This is not the recommended way of setting  desktop  preferences.   Use
       this tool at your own risk.

AUTHOR
       Anders Carlsson <andersca@gnu.org>.
       This manual page was written by Göran Weinholt for the Debian project, but may be used by others.

REPORTING BUGS
       Please report bugs at http://bugzilla.gnome.org/.

SEE ALSO
       gconfd-2(1), gconftool-2(1).

       http://www.gnome.org/projects/gconf/

                                                                   12 June 2003                                                    GCONF-EDITOR(1)
