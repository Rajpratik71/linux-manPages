UPDMAP(1)                                                                             User Commands                                                                             UPDMAP(1)

NAME
       updmap - manage TeX font maps, per-user
       updmap-sys - manage TeX font maps, system-wide

SYNOPSIS
       updmap [OPTION] ... [COMMAND]
       updmap-sys [OPTION] ... [COMMAND]

DESCRIPTION
       updmap version svn33988 (2014-05-12 15:39:32 +0900)

       Update  the  default font map files used by pdftex, dvips, and dvipdfm(x), and optionally pxdvi, as determined by all configuration files updmap.cfg (the ones returned by running
       "kpsewhich --all updmap.cfg", but see below).

       Among other things, these map files are used to determine which fonts should be used as bitmaps and which as outlines, and to determine which font files are included in  the  PDF
       or PostScript output.

       updmap-sys  is  intended  to  affect  the  system-wide configuration, while updmap affects personal configuration files only, overriding the system files.  As a consequence, once
       updmap has been run, even a single time, running updmap-sys no longer has any effect.  (updmap-sys issues a warning in this situation.)

       By default, the TeX filename database (ls-R) is also updated.

OPTIONS
       --cnffile FILE
              read FILE for the updmap configuration (can be given multiple times, in which case all the files are used)

       --dvipdfmxoutputdir DIR
              specify output directory (dvipdfm(x) syntax)

       --dvipsoutputdir DIR
              specify output directory (dvips syntax)

       --pdftexoutputdir DIR
              specify output directory (pdftex syntax)

       --pxdvioutputdir DIR
              specify output directory (pxdvi syntax)

       --outputdir DIR
              specify output directory (for all files)

       --copy cp generic files rather than using symlinks

       --force
              recreate files even if config hasn't changed

       --nomkmap
              do not recreate map files

       --nohash
              do not run texhash

       --sys  affect system-wide files (equivalent to updmap-sys)

       -n, --dry-run
              only show the configuration, no output

       --quiet, --silent
              reduce verbosity

   Commands:
       --help show this message and exit

       --version
              show version information and exit

       --showoption OPTION
              show the current setting of OPTION

       --showoptions OPTION
              show possible settings for OPTION

       --setoption OPTION VALUE
              set OPTION to value; option names below

       --setoption OPTION=VALUE
              as above, just different syntax

       --enable MAPTYPE MAPFILE
              add "MAPTYPE MAPFILE" to updmap.cfg, where MAPTYPE is Map, MixedMap, or KanjiMap

       --enable Map=MAPFILE
              add "Map MAPFILE" to updmap.cfg

       --enable MixedMap=MAPFILE add "MixedMap MAPFILE" to updmap.cfg

       --enable KanjiMap=MAPFILE add "KanjiMap MAPFILE" to updmap.cfg

       --disable MAPFILE
              disable MAPFILE, of whatever type

       --listmaps
              list all active and inactive maps

       --listavailablemaps
              same as --listmaps, but without unavailable map files

       --syncwithtrees
              disable unavailable map files in updmap.cfg

       Explanation of the map types: the (only) difference between Map and MixedMap is that MixedMap entries are not added to psfonts_pk.map.  The purpose is to help users with  devices
       that  render Type 1 outline fonts worse than mode-tuned Type 1 bitmap fonts.  So, MixedMap is used for fonts that are available as both Type 1 and Metafont.  KanjiMap entries are
       added to psfonts_t1.map and kanjix.map.

       Explanation of the OPTION names for --showoptions, --showoption, --setoption:

       dvipsPreferOutline
              true,false  (default true)

              Whether dvips uses bitmaps or outlines, when both are available.

       dvipsDownloadBase35
              true,false  (default true)

              Whether dvips includes the standard 35 PostScript fonts in its output.

       pdftexDownloadBase14
              true,false   (default true)

              Whether pdftex includes the standard 14 PDF fonts in its output.

       pxdviUse
              true,false  (default false)

              Whether maps for pxdvi (Japanese-patched xdvi) are under updmap's control.

       kanjiEmbed
              (any string)

       kanjiVariant
              (any string)

              See below.

       LW35   URWkb,URW,ADOBEkb,ADOBE  (default URWkb)

              Adapt the font and file names of the standard 35 PostScript fonts.

       URWkb  URW fonts with "berry" filenames    (e.g. uhvbo8ac.pfb)

       URW    URW fonts with "vendor" filenames   (e.g. n019064l.pfb)

       ADOBEkb
              Adobe fonts with "berry" filenames  (e.g. phvbo8an.pfb)

       ADOBE  Adobe fonts with "vendor" filenames (e.g. hvnbo___.pfb)

              These options are only read and acted on by updmap; dvips, pdftex, etc., do not know anything about them.  They work by changing the default map file  which  the  programs
              read, so they can be overridden by specifying command-line options or configuration files to the programs, as explained at the beginning of updmap.cfg.

              The  options kanjiEmbed and kanjiVariant specify special replacements in the map lines.  If a map contains the string @kanjiEmbed@, then this will be replaced by the value
              of that option; similarly for kanjiVariant.  In this way, users of Japanese TeX can select different fonts to be included in the final output.

ENVIRONMENT
       Explanation of trees and files normally used:

              If --cnffile is specified on the command line (possibly multiple times), its value(s) are used.  Otherwise, updmap reads all the updmap.cfg files found by  running  `kpse‐
              which -all updmap.cfg', in the order returned by kpsewhich.

              In any case, if multiple updmap.cfg files are found, all the maps mentioned in all the updmap.cfg files are merged.

              Thus, if updmap.cfg files are present in all trees, and the default layout is used as shipped with TeX Live on Debian, the following files are read, in the given order.

              For updmap-sys:
              TEXMFSYSCONFIG /etc/texmf/web2c/updmap.cfg
              TEXMFSYSVAR    /var/lib/texmf/web2c/updmap.cfg
              TEXMFLOCAL     /usr/local/share/texmf/web2c/updmap.cfg
              TEXMFDIST      /usr/share/texmf/web2c/updmap.cfg
              TEXMFDIST      /usr/share/texlive/texmf-dist/web2c/updmap.cfg

              For updmap-user:
              TEXMFCONFIG    $HOME/.texmf-config/web2c/updmap.cfg
              TEXMFVAR       $HOME/.texmf-var/web2c/updmap.cfg
              TEXMFHOME      $HOME/texmf/web2c/updmap.cfg
              TEXMFSYSCONFIG /etc/texmf/web2c/updmap.cfg
              TEXMFSYSVAR    /var/lib/texmf/web2c/updmap.cfg
              TEXMFLOCAL     /usr/local/share/texmf/web2c/updmap.cfg
              TEXMFDIST      /usr/share/texmf/web2c/updmap.cfg
              TEXMFDIST      /usr/share/texlive/texmf-dist/web2c/updmap.cfg

              According to the actions, updmap might write to one of the given files or create a new updmap.cfg, described further below.

       Where changes are saved:

              If  config files are given on the command line, then the first one given will be used to save any changes from --setoption, --enable or --disable.  If the config files are
              taken from kpsewhich output, then the algorithm is more complex:

              1) If $TEXMFCONFIG/web2c/updmap.cfg or $TEXMFHOME/web2c/updmap.cfg appears in the list of used files, then the one listed first by kpsewhich --all (equivalently,  the  one
              returned by kpsewhich updmap.cfg), is used.

              2) If neither of the above two are present and changes are made, a new config file is created in $TEXMFCONFIG/web2c/updmap.cfg.

              In  general,  the  idea  is  that if a given config file is not writable, a higher-level one can be used.  That way, the distribution's settings can be overridden for sys‐
              tem-wide using TEXMFLOCAL, and then system settings can be overridden again for a particular using using TEXMFHOME.

       Resolving multiple definitions of a font:

              If a font is defined in more than one map file, then the definition coming from the first-listed updmap.cfg is used.  If a font is defined multiple times within  the  same
              map file, one is chosen arbitrarily.  In both cases a warning is issued.

       Disabling maps:

              updmap.cfg files with higher priority (listed earlier) can disable maps mentioned in lower priority (listed later) updmap.cfg files by writing, e.g.,

              #! Map mapname.map

              or

              #! MixedMap mapname.map

              in the higher-priority updmap.cfg file.

              As  an  example,  suppose you have a copy of MathTime Pro fonts and want to disable the Belleek version of the fonts; that is, disable the map belleek.map.  You can create
              the file $TEXMFCONFIG/web2c/updmap.cfg with the content

              #! Map belleek.map Map mt-plus.map Map mt-yy.map

              and call updmap.

       updmap writes the map files for dvips (psfonts.map) and pdftex (pdftex.map) to the TEXMFVAR/fonts/map/updmap/{dvips,pdftex}/ directories.

       The log file is written to TEXMFVAR/web2c/updmap.log.

       When updmap-sys is run, TEXMFSYSCONFIG and TEXMFSYSVAR are used instead of TEXMFCONFIG and TEXMFVAR, respectively.  This is the only difference between updmap-sys and updmap.

       Other locations may be used if you give them on the command line, or these trees don't exist, or you are not using the original TeX Live.

       To see the precise locations of the various files that will be read and written, give the -n option (or read the source).

EXAMPLES
       For step-by-step instructions on making new fonts known to TeX, read http://tug.org/fonts/fontinstall.html.  For even more terse instructions, read  the  beginning  of  the  main
       updmap.cfg.

FILES
       Configuration and input files:

       updmap.cfg
              Main  configuration  file.   In  texmf-dist/web2c  by  default,  but  may  be  located  elsewhere depending on your distribution.  Each texmf tree read should have its own
              updmap.cfg.

       dvips35.map
              Map file for standard 35 PostScript fonts for use with dvips(1).

       pdftex35.map
              Map file for standard 35 PostScript fonts for use with pdftex(1).

       ps2pk35.map
              Map file for standard 35 PostScript fonts for use with ps2pk(1).

       Output files:

       psfonts.map
              For dvips(1).  Same as psfonts_t1.map if option dvipsPreferOutline active, else as psfonts_pk.map.

       psfonts_pk.map
              For dvips(1).  Without information from MixedMap files.  (Setting of dvipsPreferOutline ignored.)

       psfonts_t1.map
              For dvips(1).  With information from MixedMap files.  (Setting of dvipsPreferOutline ignored.)

       download35.map
              For dvips(1).  Always downloads the standard 35 fonts.  (Setting of dvipsDownloadBase35 ignored.)

       builtin35.map
              For dvips(1).  Never downloads the standard 35 fonts.  (Setting of dvipsDownloadBase35 ignored.)

       pdftex.map
              For pdftex(1).  Same as pdftex_dl14.map if option pdftexDownloadBase14 active, else as pdftex_ndl14.map.

       pdftex_dl14.map
              For pdftex(1).  Always downloads the standard 14 fonts.

       pdftex_ndl14.map
              For pdftex(1).  Never downloads the standard 14 fonts.

       ps2pk.map
              Similar to psfonts.map file, but forces all fonts to be downloaded, so this map file can be used with xdvi(1) and ps2pk(1).

       Configuration files for dvips(1):

       config.builtin35
              Loads builtin35.map instead of psfonts.map.

       config.download35
              Loads download35.map instead of psfonts.map.

       config.outline
              Loads psfonts_t1.map instead of psfonts.map.

       config.pdf
              Loads psfonts_t1.map instead of psfonts.map and has additional optimizations for PDF generation.

       config.pk
              Loads psfonts_pk.map instead of psfonts.map.

       config.www
              Loads psfonts_t1.map instead of psfonts.map.  (For compatibility with old versions.)

       config.gstopk
              Loads psfonts_t1.map instead of psfonts.map.

REPORTING BUGS
       Report bugs to: tex-k@tug.org
       TeX Live home page: <http://tug.org/texlive/>

TeX Live                                                                                 May 2014                                                                               UPDMAP(1)
