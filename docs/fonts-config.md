FONTS-CONFIG(1)                                                                                                                                                                               FONTS-CONFIG(1)



NAME
       fonts-config - configures installed X11 fonts.

SYNOPSIS
       fonts-config [OPTION]...

OPTIONS
       --force-hintstyle string
           By default, "hintstyle" is chosen depending on value of autohint for given font.  Apart from exceptions (e. g. IPA fonts for example): for fonts, with good instructions*) "hintfull" used and for
           other fonts "hintslight" is used. You can enforce hintstyle here. Possible values are "none", "hintnone", "hintslight", "hintmedium" and "hintfull". This option can be overriden by --force-bw*
           options, where "hintfull" is always used.

           *) see /usr/share/doc/packages/fonts-config/infinality/good-hinted-tt-fonts.list for reference

       --force-autohint
           By default, FreeType's autohinter is used for fonts, which have no or not good native hinting instructions. You can enforce to use autohinter even for fonts with good instructions*) with this
           option. hintstyle="hintslight" is used then, when --force-hintstyle do not everrides it.

           *) see /usr/share/doc/packages/fonts-config/infinality/good-hinted-tt-fonts.list for fonts with good hinting instructions

       --force-bw
           FreeType is instructed to use antialias (font smoothing) in rendering by default.  You can override this settings with this option, which means that fonts will not bee smoothed but contranst
           with background will be high, which can suit one's eyes. Liberation Sans family is then automatically prefered over DejaVu Sans.  Force using bitmap strikes from the font. Hintstlyle is forced
           to "hintfull" (this even overrides --force-hintstyle option).

           This can produce bitmap quality rendering for good instructed fonts.

       --force-bw-monospace
           This option has lower impact than --force-bw. Sets black and white rendering only for good hinted monospaced fonts (e. g. Liberation Mono). "hintfull" hintstyle is used.

       --lcd-filter string
           Defines lcd filter to be used. If not overriden by this option, "lcdnone" is used.  Possible values are "lcdnone", "lcddefault", "lcdlight" and "lcdlegacy".

       --rgba string
           Defines lcd subpixel arrangement and orientation for your monitor. Default value is "none". Possible values are "none", "rgb", "vrgb", "bgr", "vbgr", "unknown".

       --(no)ebitmaps
           Use (or don't use) embedded bitmaps from font.

       --ebitmapslang string
           Limit use of embedded bitmaps to specified in string separated by colons.

       --sans-families string
           Given colon-separated list of prefered sans families, they will be prefered over system preference list of sans families*).

           *) see /etc/fonts/conf.d/60-family-prefer.conf for details

       --mono-families string
           Given colon-separated list of prefered monospace families, they will be prefered over system preference list of monospace families*).

           *) see /etc/fonts/conf.d/60-family-prefer.conf for details

       --serif-families string
           Given colon-separated list of prefered serif families, they will be prefered over system preference list of serif families*).

           *) see /etc/fonts/conf.d/60-family-prefer.conf for details

       --(no)metric
           Value of --*-families can be overriden when document or GUI is requesting metric compatible font as defined
               in /etc/fonts/conf.d/30-metric-aliases.conf, e. g. request to Times New Roman will get Liberation Serif even if other family is explicitely prefered by --serif-families option. (hint, that's
           because binding="same" in that fontconfig)

           You can change this default behaviour with --nometric, but be careful with that. Metric compatibility means that every glyph, say 'A', has the same width and height in both fonts, so document
           should have same line wraps for example.

       --(no)forcefpl
           Value of --*-families can be overriden, when document or GUI is requesting some particular font. This is very often intended.

           With --forcefpl, it is possible to override all such requests with fonts listed in family preference lists (FPLs).

       --(no)ttcap
           Generate (or don't generate) TTCap entries.  TTCap entries can be used with the xtt module and with recent versions of the freetype module.

       --(no)java
           Generate (or don't generate) font setup for Java.

       -u, --user
           run fontconfig setup for user. it reads ~/.config/fontconfig/fonts-config, which is user analogy of /etc/sysconfig/fonts-config.

       -U, --remove-user-setting
           remove user setting created by by --user.

       -f, --force
           Force the update of all generated files even if it appears to be unnecessary according to the time stamps.

       -q, --quiet
           Work silently, unless an error occurs.

       -v, --verbose
           Print some progress messages to standard output.

       -d, --debug
           Print a lot of debugging messages to standard output.

       --version
           Display version and exit.

       -h, --help
           Display a short help message and exit.

       -i, --info
           Lists important involved input and output files to fonts-config script.

DESCRIPTION
       Configures installed X11 fonts. Basically it does the following things:

       creates fonts.scale and fonts.dir files
           fonts-config currently assumes all fonts installed in /usr/share/fonts tree.

           For each subdirectory, the time stamps of the directory, the fonts.scale file, the fonts.dir file and an extra time stamp file .fonts-config-timestamp are checked.  If not all the time stamps
           are equal or any of these files is missing, the fonts.scale and fonts.dir files will be updated as follows:

           First, fonts.scale file is created by calling mkfontscale.

           Then, the entries found in the fonts.scale file are merged with the entries from all fonts.scale.* files.

           fonts.scale.* files may be supplied by rpm-packages or manually added by the user to override or amend the entries created automatically by mkfontscale. Entries in a fonts.scale.* file have
           higher priority than entries automatically created by mkfontscale.  All entries generated automatically by mkfontscale for a certain font file are discarded if any fonts.scale.* file contains an
           entry for the same font file.

           After the final list of entries has been written back to fonts.scale, mkfontdir is called.

           Finally, the time stamps of the directory, fonts.scale, fonts.dir, and .fonts-config-timestamp are set to the time when fonts-config started.

       generate rendering options
           Generates /etc/fonts/conf.d/10-rendering-options.conf according to rendering options or its bound sysconfig variables. See --force-hintstyle, --force-autohint, --force-bw, --force-bw-monospace,
           --lcdfilter, --rgba, --ebitmaps, --ebitmapslang options.

       call fc-cache
           creates cache files for fonts to use with client side font rendering via fontconfig/libXft, for details see fc-cache(1).  fonts.cache-2 cache files are generated in /var/cache/fontconfig for all
           directories which are configured in /etc/fonts/fonts.conf and all their subdirectories.

       Usually fonts-config is called automatically when package containing font is installed, upgraded or removed. But you can also execute fonts-config directly, which is mainly useful to debug it (use
       --debug flag).

FILES
       /etc/sysconfig/fonts-config
           Default values for some command line options of fonts-config are read from this file if it exists.  The options currently supported in this file are:

       FORCE_HINSTYLE
           can be set to "none", "hintfull", "hintmedium" , "hintslight" or "hintnone" and is bound to --force-hintstyle option.

       FORCE_AUTOHINT
           can be set to "yes" or "no" and is bound to --force-autohint option.

       FORCE_BW
           can be set to "yes" or "no" and is bound to --force-bw option.

       FORCE_BW_MONOSPACE
           can be set to "yes" or "no" and is bound to --force-bw-monospace option.

       USE_LCDFILTER
           can be set to "lcdnone", "lcddefault", "lcdlight" and "lcdlegacy" and is bound to --lcdfilter option.

       USE_RGBA
           can be set to "none", "rgb", "vrgb", "bgr", "vrgb" or "unknown" and is bound to --rgba option.

       USE_EMBEDDED_BITMAPS
           can be set to "yes" or "no" and sets the default for the option --ebitmaps.

       EMBEDDED_BITMAPS_LANGUAGES
           can be set to colon separated list of languages, sets the default for the --ebitmapslang

       PREFER_SANS_FAMILIES
           can be set to colon separated list of sans families, bound to the --sans-families option.

       PREFER_SERIF_FAMILIES
           can be set to colon separated list of serif families, bound to the --serif-families option.

       PREFER_MONO_FAMILIES
           can be set to colon separated list of monospace families, bound to the --mono-families option.

       SEARCH_METRIC_COMPATIBLE
           can be set to "yes" or "no" and is bound to --(no)metric option.

       FORCE_FAMILY_PREFERENCE_LISTS
           can be set to "yes" or "no" and is bound to --(no)forcefpl option.

       GENERATE_TTCAP_ENTRIES
           can be set to "yes" or "no" and sets the default for the option --(no)ttcap.

       GENERATE_JAVA_FONT_SETUP
           can be set to "yes" or "no" and sets the default for the option --(no)java.

SEE ALSO
       fc-cache(1), cidfont-x11-config(1), mkfontdir(1), mkfontscale(1)

AUTHOR
       Mike FABIAN, 2003, Petr Gajdos <pgajdos@suse.com>, 2014.



perl v5.18.2                                                                                      2015-08-29                                                                                  FONTS-CONFIG(1)
