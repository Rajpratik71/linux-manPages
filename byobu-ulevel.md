byobu-ulevel(1)                                                        byobu                                                       byobu-ulevel(1)

NAME
       byobu-ulevel  - helper script for notification level indicators

DESCRIPTION
       byobu-ulevel is a helper script that can be used to create history graphs with UTF8 characters

USAGE
       byobu-ulevel  [options] -c <current_num>

       byobu-ulevel  [options] <current_num>

       byobu-ulevel  <current_num>

OPTIONS
        -a          : Accessibility mode: only output ASCII.  (Also enabled if variable '$a11y_variable' set).
        -b          : Display current value as space if zero, rather than lowest 'value' of theme.
        -c <num>    : Current value of your indicator.
        -d          : Enable debug output.
        -e <int>    : Number of decimal places to use for accessibility mode (default=$default_decimal_places).
        -h          : Show this help.
        -i          : Invert colour scheme (rating themes only).
        -l          : List available themes. If '-t' also specified, show all values for specified theme.
        -m <num>    : Minimum value (default=$min_default).
        -n          : Supress output of newline character.
        -p          : Permissive mode - if current value out of bounds, set it to the nearest bound (min or max).
        -q          : Suppress messages (requires '-t').
        -r          : Reverse 'direction' of display (rating theme only).
        -t <theme>  : Name of theme (default=$theme_default).
        -u <chars>  : Specify a user theme (2 or more values).
        -w <int>    : Width of rating theme (default=$width_default).
        -x <num>    : Maximum value (default=$max_default).

EXAMPLES
       Display character representing 27% using default theme.
         byobu-ulevel 27

       As above.
         byobu-ulevel -c 27

       Example showing floating-point and negative values.
         byobu-ulevel -c 1.100001 -m -5.00234 -x 2.71828 -t dice_6

       Use accessibility mode to display a percentage value (rounded to nearest percentage)
         byobu-ulevel -m -22.613 -x 5.00212 -c 0.10203 -a -e 0

       Display value using a "rating theme" (displayed left-to-right).
         byobu-ulevel -c 83 -t stars_2

       Display right-to-left inverted "rating theme".
         byobu-ulevel -c 60 -t diamonds_2 -ri

       Display all glyphs in 'solid_numbers_a_10' theme.
         byobu-ulevel -l -t solid_numbers_a_10

       Display a user-specified rating theme 10 glyphs wide.
         byobu-ulevel -c 666.321 -m -273.15 -x 1370 -u "· ☢" -w 10

       A multi-element user theme (this prints 'e').
         byobu-ulevel -c 50 -u "a b c d e f g h i j"

NOTES
       Arguments of type "<int>" denote an integer value, whereas arguments of type "<num>" denotes either an integer or a floating-point number.

       The final '_<number>' in a theme name denotes the number of glyphs in it.

       "Rating themes" are those with only 2 values.

       The <chars> argument to '-u' must contain space-delimited characters.

SEE ALSO
       byobu(1)

       http://byobu.org

AUTHOR
       This utility was written by James Hunt <james.hunt@canonical.com>, and this manpage was written by Dustin Kirkland <kirkland@byobu.org> for
       Ubuntu systems (but may be used by others).  Permission is granted to copy, distribute and/or modify this document and  the  utility  under
       the terms of the GNU General Public License, Version 3 published by the Free Software Foundation.

       The  complete  text  of  the  GNU  General  Public  License  can be found in /usr/share/common-licenses/GPL on Debian/Ubuntu systems, or in
       /usr/share/doc/fedora-release-*/GPL on Fedora systems, or on the web at http://www.gnu.org/licenses/gpl.txt.

byobu                                                               16 Dec 2013                                                    byobu-ulevel(1)
