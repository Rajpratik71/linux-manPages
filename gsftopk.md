
GSFTOPK(1)                                                                                 General Commands Manual                                                                                 GSFTOPK(1)



NAME
       gsftopk - render a ghostscript font in TeX pk form

SYNOPSIS
       gsftopk [-i path] [-q] [-t] [--debug=n] [--dosnames] [--interpreter=path] [--mapline=line] [--mapfile=file] [--quiet] [--test] [--help] [--version] font dpi

ARGUMENTS
       font  Name of the font to be created.

       dpi   Desired resolution of the font to be created, in dots per inch.  This may be a real number.

DESCRIPTION
       gsftopk  is  a program which calls up the ghostscript program gs(1) to render a given font at a given resolution.  It packs the resulting characters into the pk file format and writes them to a file
       whose name is formed from the font name and the resolution (rounded to the nearest integer).  The font may be in any format acceptable to Ghostscript, including .pfa, .pfb, .gsf, and .ttf files.

       This program should normally be called by a script, such as mktexpk, to create fonts on demand.

       gsftopk obtains the character widths from the .tfm file, which must exist in the standard search path.  It also must be able to find the font in a map file (such as  psfonts.map),  formatted  as  in
       dvips(1)), unless the --mapline option is used.  The set of map files is given by the --mapfile option, or in the files config.ps, $HOME/.dvipsrc, and config.gsftopk (as would be used by dvips -Pgs‐
       ftopk).

       The following pk "specials" are added at the end of the output file, to provide an internal check on the contents of the file: "jobname=font", "mag=1",  "mode=modeless",  and  "pixels_per_inch=dpi".
       This is in accordance with the TeX Directory Standard (TDS).

OPTIONS
       --debug=n
              Set the Kpathsea debug flags according to the integer n.

       --dosnames
              Use a name of the form font.pk instead of font.dpipk.

       -h, --help
              Print a brief help synopsis and exit.

       -i path, --interpreter=path
              Use path as the Ghostscript interpreter.

       --mapfile=file
              Use file to look for the map information for font.  This should be the full name of the file (in other words, no path searching algorithms are applied).

       --mapline=line
              Use line instead of looking for an entry in a map file.  The first word of line must match font.

       -q, --quiet
              Operate quietly; i.e., without writing any messages to the standard output.

       -t, --test
              Test  run:   return  zero  status if the font can be found in the map file(s), and nonzero status if it cannot.  If this option is specified, then the dpi argument is optional (since the font
              will not be generated).

       -v, --version
              Print the version number and exit.

ENVIRONMENT VARIABLES
       DVIPSRC         Name of file to read instead of $HOME/.dvipsrc.  This should be the full name of the file (in other words, no path searching algorithms are applied).

       GSFTOPKFONTS    See TFMFONTS.

       GSFTOPKHEADERS  See TEXPSHEADERS.

       PSHEADERS       See TEXPSHEADERS.

       TEXCONFIG       Colon-separated list of paths to search for map files.  An extra colon in the list will include the compiled-in default paths at that point.  A double  slash  will  enable  recursive
                       subdirectory searching at that point in the path.

       TFMFONTS        Colon-separated  list of paths to search for the .tfm file associated with the font.  Double slashes and extra colons behave as with TEXCONFIG.  This information may also be supplied
                       by using the environment variables TFMFONTS or GSFTOPKFONTS.  These environment variables are checked in the order GSFTOPKFONTS, TFMFONTS, TFMFONTS; the first one (if any)  having  a
                       value is used.

       TEXPSHEADERS    Colon-separated list of paths to search for the Ghostscript driver file render.ps and for any PostScript header or font files (.enc, .pfa, .pfb, .gsf, or .ttf files).  Double slashes
                       and extra colons behave as with TEXCONFIG.  This information may also be supplied by using the environment variables PSHEADERS or GSFTOPKHEADERS.   These  environment  variables  are
                       checked in the order GSFTOPKHEADERS, TEXPSHEADERS, PSHEADERS; the first one (if any) having a value is used.

       TFMFONTS        See TFMFONTS.

CONFIGURATION
       In  order to determine the set of map files to be used and the path for finding PostScript files, gsftopk reads, in order, the files config.ps, .dvipsrc, and config.gsftopk.  The files config.ps and
       config.gsftopk are searched for using the environment variable TEXCONFIG, the Kpathsea configuration file, or the compiled-in default paths.  The file .dvipsrc is searched for  in  the  user's  home
       directory.

       These files are in the same format as for dvips (as well as being in the same locations).  The entries used by gsftopk are as follows.

       H path Indicates that the Ghostscript driver file render.ps and the PostScript header and font files are to be searched for using path.

       p file Indicates that the list of map files is to be erased and replaced by file.

       p +file
              Indicates that file is to be added to the list of map files.

       All other entries are ignored.

       This is similar to the handling of these options when running dvips -Pgsftopk.  For more details, see the Kpathsea manual.

BUGS
       gsftopk  sometimes  has  trouble  with fonts with very complicated characters (such as the Seal of the University of California).  This is because gsftopk uses the charpath operator to determine the
       bounding box of each character.  If the character is too complicated, then old versions of Ghostscript fail, causing gsftopk to terminate with an error message

              Call to gs stopped by signal 10

       (The number may vary from system to system; it corresponds to a bus error or a segmentation fault.)  The best way to fix this bug is to install a current version of ghostscript.  As an  alternative,
       gsftopk can be instructed to use the bounding box provided with the font (if one exists) instead of finding a bounding box for each character.  To do this, include the string

              /usefontbbox true def

       in the font map file; e.g.,

              ucseal "/usefontbbox true def"

       This will not affect use of the font by dvips.

SEE ALSO
       gs(1), gftopk(1), tex(1), xdvi(1), dvips(1)

AUTHOR
       Written by Paul Vojta.  This program was inspired by Karl Berry's gsrenderfont.

MODIFICATIONS
       Modified by Yves Arrouye to use Karl Berry's Kpathsea library.



                                                                                               28 November 1998                                                                                    GSFTOPK(1)
