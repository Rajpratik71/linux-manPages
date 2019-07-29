columns(1)                                                         User Commands                                                        columns(1)

NAME
       columns - Columnize Input Text

SYNOPSIS
       columns [-flags] [-flag [value]] [--option-name[[=| ]value]]

       All arguments must be options.

DESCRIPTION
       There is no description for this command.

OPTIONS
   Specify the output dimensions
       -W num, --width=num
              Maximum Line Width.  This option takes an integer number as its argument.  The value of num is constrained to being:
                  in the range  16 through 4095
              The default num for this option is:
                   79

              This option specifies the full width of the output line, including any start-of-line indentation.  The output will fill each line as
              completely as possible, unless the column width has been explicitly specified.  If the maximum width is less than the length of the
              widest input, you will get a single column of output.

       -c count, --columns=count
              Desired number of columns.  This option takes an integer number as its argument.  The value of count is constrained to being:
                  in the range  1 through 2048
              The default count for this option is:
                   0

              Use this option to specify exactly how many columns to produce.  If that many columns will not fit within line_width, then the count
              will be reduced to the number that fit.

       -w num, --col-width=num
              Set width of each column.  This option takes an integer number as its argument.  The value of num is constrained to being:
                  in the range  1 through 2048
              The default num for this option is:
                   0

              Use this option to specify exactly how many characters are to be allocated for each column.  If it is narrower than the widest
              entry, it will be over-ridden with the required width.

       --tab-width=num
              tab width.  This option takes an integer number as its argument.  The default num for this option is:
                   8

              If an indentation string contains tabs, then this value is used to compute the ending column of the prefix string.

   Specify how to lay out the text
       --spread=num
              maximum spread added to column width.  This option takes an integer number as its argument.  The value of num is constrained to
              being:
                  in the range  1 through 1024
              The default num for this option is:
                   0

              Use this option to specify exactly how many characters may be added to each column.  It allows you to prevent columns from becoming
              too far apart.  Without this option, columns will attempt to widen columns to fill the full width.

       --fill Fill lines with input.  This option must not appear in combination with any of the following options: spread, col_width, by_columns.

              Instead of columnizing the input text, fill the output lines with the input lines.  Blank lines on input will cause a blank line in
              the output, unless the output is sorted.  With sorted output, blank lines are ignored.

       -I l-pfx, --indent=l-pfx
              Line prefix or indentation.

              If a number, then this many spaces will be inserted at the start of every line.  Otherwise, it is a line prefix that will be
              inserted at the start of every line.

       --first-indent=l-pfx
              First line prefix.  This option must appear in combination with the following options: indent.

              If a number, then this many spaces will be inserted at the start of the first line.  Otherwise, it is a line prefix that will be
              inserted at the start of that line.  If its length exceeds "indent", then it will be emitted on a line by itself, suffixed by any
              line separation string.  For example:

                  $ columns --first='#define TABLE' -c 2 -I4 --line=' ´ <<_EOF_
                  one
                  two
                  three
                  four
                  _EOF_
                  #define TABLE         one   two         three four

       -f fmt-str, --format=fmt-str
              Formatting string for each input.

              If you need to reformat each input text, the argument to this option is interpreted as an sprintf(3) format that is used to produce
              each output entry.

       -S sep-str, --separation=sep-str
              Separation string - follows all but last.

              Use this option if, for example, you wish a comma to appear after each entry except the last.

       --line-separation=sep-str
              string at end of all lines but last.

              Use this option if, for example, you wish a backslash to appear at the end of every line, except the last.

       --ending=end-str
              string at end of last line.

              This option puts the specified string at the end of the output.

   Specify the ordering of the entries
       --by-columns
              Print entries in column order.

              Normally, the entries are printed out in order by rows and then columns.  This option will cause the entries to be ordered within
              columns.  The final column, instead of the final row, may be shorter than the others.

       -s key-pat, --sort [key-pat]
              Sort input text.

              Causes the input text to be sorted.  If an argument is supplied, it is presumed to be a pattern and the sort is based upon the
              matched text.  If the pattern starts with or consists of an asterisk (*), then the sort is case insensitive.

   Redirecting stdin to an alternate file
       -i file, --input=file
              Input file (if not stdin).

              This program normally runs as a filter, reading from standard input, columnizing and writing to standard out.  This option redirects
              input to a file.

       -?, --help
              Display usage information and exit.

       -!, --more-help
              Pass the extended usage information through a pager.

       -> [cfgfile], --save-opts [=cfgfile]
              Save the option state to cfgfile.  The default is the last configuration file listed in the OPTION PRESETS section, below.  The com‐
              mand will exit after updating the config file.

       -< cfgfile, --load-opts=cfgfile, --no-load-opts
              Load options from cfgfile.  The no-load-opts form will disable the loading of earlier config/rc/ini files.  --no-load-opts is han‐
              dled early, out of order.

       -v [{v|c|n --version [{v|c|n}]}]
              Output version of program and exit.  The default mode is `v', a simple version.  The `c' mode will print copyright information and
              `n' will print the full copyright notice.

OPTION PRESETS
       Any option that is not marked as not presettable may be preset by loading values from configuration ("RC" or ".INI") file(s) and values
       from environment variables named:
         COLUMNS_<option-name> or COLUMNS
       The  environmental  presets take precedence (are processed later than) the configuration files.  The homerc files are ".", and "$HOME".  If
       any of these are directories, then the file .columnsrc is searched for within those directories.

ENVIRONMENT
       See OPTION PRESETS for configuration environment variables.

FILES
       See OPTION PRESETS for configuration files.

EXIT STATUS
       One of the following exit values will be returned:

       0  (EXIT_SUCCESS)
              Successful program execution.

       1  (EXIT_FAILURE)
              The operation failed or the command syntax was not valid.

       66  (EX_NOINPUT)
              A specified configuration file could not be loaded.

       70  (EX_SOFTWARE)
              libopts had an internal operational error.  Please report it to autogen-users@lists.sourceforge.net.  Thank you.

SEE ALSO
       This program is documented more fully in the Columns section of the Add-On chapter in the AutoGen Info system documentation.

AUTHORS
       Bruce Korb

COPYRIGHT
       Copyright (C) 1999-2014 Bruce Korb all rights reserved.  This program is released under the terms of the GNU General Public  License,  ver‐
       sion 3 or later.

BUGS
       Please send bug reports to: autogen-users@lists.sourceforge.net

NOTES
       This manual page was AutoGen-erated from the columns option definitions.

GNU AutoGen (1.2)                                                   2016-01-10                                                          columns(1)
