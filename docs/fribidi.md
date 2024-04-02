FRIBIDI(1)                                                         User Commands                                                        FRIBIDI(1)

NAME
       fribidi - a command line interface for the fribidi library, converts a logical string to visual

SYNOPSIS
       fribidi [OPTION]... [FILE]...

DESCRIPTION
       A command line interface for the fribidi library, Converts a logical string to visual.

       -h, --help
              Display this information and exit

       -V, --version
              Display version information and exit

       -v, --verbose
              Verbose mode, same as --basedir --ltov --vtol \ --levels --changes

       -d, --debug
              Output debug information

       -t, --test
              Test fribidi, same as --clean --nobreak --showinput \ --reordernsm

       -c, --charset CS
              Specify character set, default is UTF-8

       -C, --charsetdesc CS
              Show descriptions for character set CS and exit

       --caprtl
              Old style: set character set to CapRTL

       --showinput
              Output the input string too

       --nopad
              Do not right justify RTL lines

       --nobreak
              Do not break long lines

       -w, --width W
              Screen  width  for padding, default is 80, but if \ environment variable COLUMNS is defined, its value \ will be used, --width over‐
              rides both of them.\

       -B, --bol BOL
              Output string BOL before the visual string

       -E, --eol EOL
              Output string EOL after the visual string

       --rtl  Force base direction to RTL

       --ltr  Force base direction to LTR

       --wrtl Set base direction to RTL if no strong character found

       --wltr Set base direction to LTR if no strong character found \ (default)

       --nomirror
              Turn mirroring off, to do it later

       --reordernsm
              Reorder NSM sequences to follow their base character

       --clean
              Remove explicit format codes in visual string \ output, currently does not affect other outputs

       --basedir
              Output Base Direction

       --ltov Output Logical to Visual position map

       --vtol Output Visual to Logical position map

       --levels
              Output Embedding Levels

       --changes
              Output information about changes between \ logical and visual string (start, length)

       --novisual
              Do not output the visual string, to be used with \ --basedir, --ltov, --vtol, --levels, --changes

              All string indexes are zero based

   Output:
              For each line of input, output something like this:

              [input-str` => '][BOL][[padding space]visual-str][EOL] [\n base-dir][\n ltov-map][\n vtol-map][\n levels][\n changes]

   Available character sets:
       * UTF-8 : UTF-8 (Unicode)

       * CapRTL : CapRTL (Test)            X

       * ISO8859-6 : ISO 8859-6 (Arabic)

       * ISO8859-8 : ISO 8859-8 (Hebrew)

       * CP1255    : CP1255 (Hebrew/Yiddish)

       * CP1256    : CP1256 (MS-Arabic)

       * ISIRI-3342: ISIRI 3342 (Persian)

       X: Character set has descriptions, use --charsetdesc to see

REPORTING BUGS
       Report bugs online at <http://fribidi.sourceforge.net/bugs.php>.

       interface version 2 Unicode version 3.2.0

COPYRIGHT
       Copyright © 2002 FriBidi Project (http://fribidi.sf.net/).  fribidi comes with NO WARRANTY, to the extent permitted by law.  You may redis‐
       tribute  copies  of  fribidi  under  the terms of the GNU Lesser General Public License.  For more information about these matters, see the
       files named COPYING.

fribidi 0.10.5                                                      April 2003                                                          FRIBIDI(1)
