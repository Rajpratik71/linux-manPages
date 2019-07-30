FMTUTIL(1)                                                                            User Commands                                                                            FMTUTIL(1)

NAME
       fmtutil - manage TeX formats, Metafont bases and Metapost mems, per-user
       fmtutil-sys - manage TeX formats, Metafont bases and Metapost mems, system-wide
       mktexfmt - create a TeX format, Metafont base, or Metapost mem

SYNOPSIS
       fmtutil [OPTION] ... [COMMAND]
       fmtutil-sys [OPTION] ... [COMMAND]
       mktexfmt FORMAT.fmt|BASE.base|MEM.mem|FMTNAME.EXT

DESCRIPTION
       fmtutil version svn36788 (2015-04-13 00:53:26 +0900)

       Rebuild and manage TeX formats, Metafont bases and MetaPost mems.

       If  the  command name ends in mktexfmt, only one format can be created.  The only options supported are --help and --version, and the command line must consist of either a format
       name, with its extension, or a plain name that is passed as the argument to --byfmt (see below).  The full name of the generated file (if any) is written to stdout,  and  nothing
       else.

       If not operating in mktexfmt mode, the command line can be more general, and multiple formats can be generated, as follows.

OPTIONS
       --cnffile FILE
              read FILE instead of fmtutil.cnf (can be given multiple times, in which case all the files are used)

       --fmtdir DIRECTORY

       --no-engine-subdir
              don't use engine-specific subdir of the fmtdir

       --no-error-if-no-format
              exit successfully if no format is selected

       --no-error-if-no-engine=ENGINE1,ENGINE2,...
              exit successfully even if the required engine

              is missing, if it is included in the list.

       --quiet
              be silent

       --test (not implemented, just for compatibility)

       --dolinks
              (not implemented, just for compatibility)

       --force
              (not implemented, just for compatibility)

   Commands:
       --all  recreate all format files

       --missing
              create all missing format files

       --refresh
              recreate only existing format files

       --byengine ENGINENAME
              (re)create formats using ENGINENAME

       --byfmt FORMATNAME
              (re)create format for FORMATNAME

       --byhyphen HYPHENFILE
              (re)create formats that depend on HYPHENFILE

       --enablefmt FORMATNAME
              enable formatname in config file

       --disablefmt FORMATNAME
              disable formatname in config file

       --listcfg
              list (enabled and disabled) configurations, filtered to available formats

       --catcfg
              output the content of the config file

       --showhyphen FORMATNAME
              print name of hyphenfile for format FORMATNAME

       --version
              show version information and exit

       --help show this message and exit

ENVIRONMENT
       Explanation of trees and files normally used:

              If --cnffile is specified on the command line (possibly multiple times), its value(s) are used.  Otherwise, fmtutil reads all the fmtutil.cnf files found by running `kpse‐
              which -all fmtutil.cnf', in the order returned by kpsewhich.

              In any case, if multiple fmtutil.cnf files are found, all the format definitions found in all the fmtutil.cnf files are merged.

              Thus, if fmtutil.cnf files are present in all trees, and the default layout is used as shipped with TeX Live, the following files are read, in the given order.

              For fmtutil-sys:
              TEXMFSYSCONFIG $TEXLIVE/YYYY/texmf-config/web2c/fmtutil.cnf
              TEXMFSYSVAR    $TEXLIVE/YYYY/texmf-var/web2c/fmtutil.cnf
              TEXMFLOCAL     $TEXLIVE/texmf-local/web2c/fmtutil.cnf
              TEXMFDIST      $TEXLIVE/YYYY/texmf-dist/web2c/fmtutil.cnf

              For fmtutil:
              TEXMFCONFIG    $HOME/.texliveYYYY/texmf-config/web2c/fmtutil.cnf
              TEXMFVAR       $HOME/.texliveYYYY/texmf-var/web2c/fmtutil.cnf
              TEXMFHOME      $HOME/texmf/web2c/fmtutil.cnf
              TEXMFSYSCONFIG $TEXLIVE/YYYY/texmf-config/web2c/fmtutil.cnf
              TEXMFSYSVAR    $TEXLIVE/YYYY/texmf-var/web2c/fmtutil.cnf
              TEXMFLOCAL     $TEXLIVE/texmf-local/web2c/fmtutil.cnf
              TEXMFDIST      $TEXLIVE/YYYY/texmf-dist/web2c/fmtutil.cnf

              (where YYYY is the TeX Live release version).

              According to the actions, fmtutil might write to one of the given files or create a new fmtutil.cnf, described further below.

       Where changes are saved:

              If config files are given on the command line, then the first one given will be used to save any changes from --enable or --disable.  If the config files  are  taken  from
              kpsewhich output, then the algorithm is more complex:

              1) If $TEXMFCONFIG/web2c/fmtutil.cnf or $TEXMFHOME/web2c/fmtutil.cnf appears in the list of used files, then the one listed first by kpsewhich --all (equivalently, the one
              returned by kpsewhich fmtutil.cnf), is used.

              2) If neither of the above two are present and changes are made, a new config file is created in $TEXMFCONFIG/web2c/fmtutil.cnf.

              In general, the idea is that if a given config file is not writable, a higher-level one can be used.  That way, the distribution's settings  can  be  overridden  for  sys‐
              tem-wide using TEXMFLOCAL, and then system settings can be overridden again for a particular using using TEXMFHOME.

       Resolving multiple definitions of a format:

              If a format is defined in more than one config file, then the definition coming from the first-listed fmtutil.cnf is used.

       Disabling formats:

              fmtutil.cnf files with higher priority (listed earlier) can disable formats mentioned in lower priority (listed later) fmtutil.cnf files by writing, e.g.,

              #! <fmtname> <enginename> <hyphen> <args>

              in the higher-priority fmtutil.cnf file.

              As an example, suppose you have want to disable the luajitlatex format.  You can create the file $TEXMFCONFIG/web2c/fmtutil.cnf with the content

              #! luajitlatex luajittex language.dat,language.dat.lua lualatex.ini

              and call fmtutil.

       fmtutil vs. fmtutil-sys (fmtutil --sys):

              When  fmtutil-sys  is run or the command line option --sys is used, TEXMFSYSCONFIG and TEXMFSYSVAR are used instead of TEXMFCONFIG and TEXMFVAR, respectively.  This is the
              primary difference between fmtutil-sys and fmtutil.

              Other locations may be used if you give them on the command line, or these trees don't exist, or you are not using the original TeX Live.

REPORTING BUGS
       Report bugs to: tex-k@tug.org
       TeX Live home page: <http://tug.org/texlive/>

TeX Live                                                                                April 2015                                                                             FMTUTIL(1)
