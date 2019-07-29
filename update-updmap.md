UPDATE-UPDMAP(8)                                              System Manager's Manual                                             UPDATE-UPDMAP(8)

NAME
     update-updmap — generate updmap.cfg files for all the system trees

SYNOPSIS
     update-updmap [option ...]

DESCRIPTION
     This manual page documents update-updmap, a program that was written for the Debian distribution.

   Overview
     update-updmap is used to generate updmap(1)'s and updmap-sys(8)'s configurations files /var/lib/texmf/updmap.cfg-TEXLIVEDIST, which is the
     link target of /usr/share/texlive/texmf-dist/web2c/updmap.cfg, and /var/lib/texmf/updmap.cfg-DEBIAN which is the link target of
     /usr/share/texmf/web2c/updmap.cfg, from the files with names ending in ‘.cfg’ located in /var/lib/tex-common/fontmap-cfg/texlive/ and
     /var/lib/tex-common/fontmap-cfg/texmf/, respectively.

     Any TeX package shipping map files in one of the trees /usr/share/texlive/texmf-dist or /usr/share/texmf should also provide files in one of
     the above directories containing the respective lines for updmap.cfg file.

     In order to configure (enable additional entries, disable system provided entries, etc), the normal updmap(1)mechanism should be used. Please
     see the man page details.

OPTIONS
     --check    Executes additional checks that all necessary files are present in the kpathsea database. Don't use this in maintainer scripts.

     --quiet    don't write anything to the standard output during normal operation

     --help     print a summary of the command-line usage of update-updmap and exit

     --version  output version information and exit

     Note that the -v option, which turns on verbose mode, is deprecated.  We are currently in a transition phase where quiet mode is still the
     default (therefore, --quiet has no effect), but update-updmap will be verbose by default as soon as enough packages use --quiet in their
     maintainer scripts.

SYNTAX FOR THE .CFG FILES
     The ‘.cfg’ files under /var/lib/tex-common/fontmap-cfg/ should contain valid configuration lines for updmap(1).  Usually, they will consist
     of lines of following one of these forms:

           Map <foo.map>
           MixedMap <bar.map>
           KanjiMap <baz.map>

     The MixedMap form should only be used if the font is available in both bitmap and scalable formats (this way, it won't be declared in the
     default map file for Dvips that is used when dvipsPreferOutline is set to ‘false’ in updmap.cfg).

     The KanjiMap form should only be used for map files defining Japanese font maps.

FILES
     /var/lib/tex-common/fontmap-cfg/texlive/*.cfg
     /var/lib/tex-common/fontmap-cfg/texmf/*.cfg
     /var/lib/texmf/updmap.cfg-TEXLIVEDIST
     /var/lib/texmf/updmap.cfg-DEBIAN

DIAGNOSTICS
     update-updmap returns 0 on success, or a strictly positive integer on error.

SEE ALSO
     updmap(1)

     /usr/share/doc/tex-common/README.Debian.{txt,pdf,html}
     /usr/share/doc/tex-common/Debian-TeX-Policy.{txt,pdf,html}
     /usr/share/doc/tex-common/TeX-on-Debian.{txt,pdf,html}

AUTHORS
     This manual page was written by Atsuhito Kohda <kohda@debian.org> and updated by Florent Rougon <f.rougon@free.fr> and Frank Kuester
     <frank@debian.org> for the Debian distribution (and may be used by others).

Debian                                                             Jul 17, 2013                                                             Debian
