DEBMANY(1)                                                         User Commands                                                        DEBMANY(1)

NAME
       debmany  -  select  manpages  or  documentation files from installed packages, packages from the repository or .deb-files for viewing using
       "man", "sensible-pager" or an alternative viewer.

SYNOPSIS
       debmany --help
       debmany [-v[v]] [-k|-g|-x] [-m manpageviewer] [-o otherviewer] [-L limit] [-l lang1[,...]] package|package.deb
       debmany [-v[v]] [-k|-g|-x] [-m manpageviewer] [-o otherviewer] [-L limit] [-l lang1[,...]] -z [package|package.deb]

DESCRIPTION
       Select a manpage or files in /usr/share/doc from a Debian package for viewing with "man", "sensible-pager" or an  alternative  viewer.  The
       list  of  files  is  displayed in a dialog. Supported locations for Debian packages are: local .deb-file, a package in the repository or an
       installed package.

       --help display a short usage guide and exit

       -k     Display the manpage using your preferred viewer (must support .gz files) if you use KDE - this is the short form  of  -m  'kfmclient
              exec man:%s'. "kfmclient" is a part of the package "konqueror" (at least in Debian Etch).

       -g     Display the manpage using your preferred viewer (must support .gz files) if you use GNOME - this is the short form of -m 'gnome-open
              man:%s'. "gnome-open" is a part of the package "libgnome2-0" (at least in Debian Etch).

       -x     Display the manpage using your preferred viewer (must support .gz files) if you use KDE/GNOME/Xfce - this is the short  form  of  -m
              'xdg-open man:%s'. "xdg-open" is a part of the package "xdg-utils" (at least in Debian Etch).

       -m manpageviewer
              Optionally  set  a  manpage viewer. The viewer must support .gz files. You must define the complete request. "%s" gets replaced with
              the path to the manpage. If "%s" is missing " %s" is appended to the manpageviewer. The manpageviewer must be enclosed with "" or ''
              -  see  examples.  If you use a graphical viewer you must ensure that you have access to your desktop (if necessary: sux or ssh with
              X-forwarding)

       -o otherviewer
              Optionally set a viewer for other files (/usr/share/doc).

       -L limit
              If a file which must be downloaded exceeds this limit, you are asked if the download should start. Without  unit  the  value  is  in
              bytes. You can append K, M, G or T to the value to change the unit.

       -l lang1[,...]
              English  manpages  are displayed always. If you want more languages you can specify them here. Provide a comma separated list of the
              folder names in the manpage folders (/usr/share/man) - e.g. de,fr or "zh*" if you want to see all Chinese manpages  (Simplified  and
              Traditional Chinese as well). It is safe always to use "*" at the end of your language.  Character set versions automatically gener‐
              ated during installation are not available for selection.

       -z     Zenity (a graphical dialog) is used to select the files and if necessary to enter the package name. You  must  have  the  rights  to
              start X programs. This option combined with the parameters -k, -g, -x or -m and -o make it possible to use debmany without console.

       The  manpages are temporarily extracted to a temporary directory under /tmp (or /var/tmp, if /tmp is not a directory). You can override the
       path if you set and export the environment variable TMPDIR or set it as a temporary variable.

       You need to have the Debian package "whiptail" (preferred) or "dialog" as well as "curl" installed.

EXAMPLES
       debmany coreutils
              Show all manpages from the installed Debian package "coreutils" using man.

       debmany 3dchess
              Show all manpages from the package "3dchess" using man. Since it is not already installed the package is accessed from  the  reposi‐
              tory - even downloading is done if needed.

       debmany test.deb
              Show all manpages from the local Debian package "./test.deb" using man.

       debmany -k sc
              Use your preferred man-viewer (for KDE users).

       debmany -g sc
              Use your preferred man-viewer (for GNOME users).

       debmany -x sc
              Use your preferred man-viewer (for KDE/GNOME/XFCE users).

       debmany -z -k
              Uses "zenity" to select files and to enter the package name.

       TMPDIR=~/tmp debmany -m 'konqueror man:%s' sc
              Use ~/tmp as temporary folder and Konqueror as viewer.

       alias debmany='debmany -l de -L 5M -k'; debmany -m man -l "zh*" foo
              Set an alias with your preferred options and override them if needed.

       vi /usr/local/bin/ask # after saving: chmod 755 ask
              #!/bin/dash
              read -p "program to use: " pgm
              eval $pgm "$1"

              debmany -o ask
              Every time you select other files from a package you will be asked which program to use.

AUTHOR
       Written by Michael Arlt.

LICENSE
       This   is   free   software.    You   may   redistribute   copies   of   it   under   the   terms   of   the  GNU  General  Public  License
       <http://www.gnu.org/licenses/gpl.html>.  There is NO WARRANTY, to the extent permitted by law.

Michael Arlt                                                            1.3                                                             DEBMANY(1)
