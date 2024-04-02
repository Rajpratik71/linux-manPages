highlight(1)                                                                                  user documentation                                                                                 highlight(1)



NAME
       Highlight - a universal sourcecode to formatted text converter


SYNOPSIS
       highlight [OPTIONS]... [FILES]...


DESCRIPTION
       Highlight  converts sourcecode to HTML, XHTML, RTF, ODT, LaTeX, TeX, BBCode, SVG, XTERM or ANSI escape sequences.  There are several colour themes available.  Highlight recognizes keywords, numbers,
       strings, comments, symbols and preprocessor directives.  It supports about 160 programming languages, which are defined in Lua scripts.


       It's easily possible to enhance highlight's database of programming languages and colour themes.  See the README file for details.

General options
       -B, --batch-recursive=<wildcard>
              convert all files matching the wildcard (uses recursive search)

       -D, --data-dir=<path>
              set path to highlight data directory

       --add-config-dir=<path>
              set path to an additional configuration directory

       --config-file=<file>
              set path to a lang or theme file

       -h, --help
              print this help

       -i, --input=<file>
              name of input file

       -o, --output=<file>
              name of output file

       -d, --outdir=<output directory>
              name of output directory

       -P, --progress
              print progress bar in batch mode

       -S, --syntax=<type>
              set type of source code, necessary if input file suffix is missing

       -v, --verbose
              print debug info to stderr

       -p, --list-langs
              list installed language definitions

       -q, --quiet
              supress progress info in batch mode

       -w, --list-themes
              list installed themes

       --force
              generate output if input syntax is unknown

       --plug-in=<script>
              execute Lua plug-in script; repeat option to apply multiple plug-ins

       --plug-in-read
              set input file for a plug-in (e.g. 'tags')

       --print-config
              print path configuration

       --print-style
              print stylesheet only (see --style-outfile)

       --skip=<list>
              ignore listed unknown file types (Example: --skip='bak;c~;h~')

       --start-nested=<lang>
              define nested language which starts input without opening delimiter

       --validate-input
              test if input is a valid text file

       --version
              print version and copyright info


Output formatting options
       -O, --out-format=<format>
              output file in given format <format>=[html, xhtml, latex, tex, rtf, odt, ansi, xterm256, bbcode, svg]

       -c, --style-outfile=<file>
              name of style definition file or output to stdout, if "stdout" is given as file argument

       -T, --doc-title
              document title

       -e, --style-infile=<file>
              name of file to be included in style-outfile

       -f, --fragment
              omit header and footer of the output document

       -F, --reformat=<style>
              reformat output in given style.  <style>=[allman, banner, gnu, java, kr, linux, stroustrup, whitesmith]

       -I, --include-style
              include style definition in output

       -J, --line-length=<num>
              line length before wrapping (see -W, -V)

       -j, --line-number-length=<num>
              line number length incl. left padding

       -k, --font=<font>
              set font (specific to output format)

       -K, --font-size=<num?>
              set font size (specific to output format)

       -l, --line-numbers
              print line numbers in output file

       -m, --line-number-start=<cnt>
              start line numbering with cnt (assumes -l)

       -s, --style=<style name>
              set highlighting style (see --list-themes)

       -t  --replace-tabs=<num>
              replace tabs by num spaces

       -u, --encoding=<enc>
              set output encoding which matches input file encoding; omit encoding information if set to "NONE"

       -V, --wrap-simple
              wrap long lines without indenting function parameters and statements

       -W, --wrap
              wrap long lines (use with caution)

       -z, --zeroes
              fill leading space of line numbers with zeroes

       --kw-case=<upper|lower|capitalize>
              output all keywords in given case if language is not case sensitive

       --delim-cr
              set CR as end-of-line delimiter (MacOS 9)

       --no-trailing-nl
              omit trailing newline

       --wrap-no-numbers
              omit line numbers of wrapped lines (assumes -l)


(X)HTML OPTIONS
       -a, --anchors
              attach anchors to line numbers (HTML only)

       -y, --anchor-prefix=<str>
              set anchor name prefix

       -N, --anchor-filename
              use input file name as anchor name

       -C, --print-index
              print index file with links to all output files

       -n, --ordered-list
              print lines as ordered list items

       --class-name=<str>
              set CSS class name prefix; omit class name if set to "NONE"

       --inline-css
              output CSS within each tag (verbose output)

       --enclose-pre
              enclose fragmented output with pre tag (assumes -f)


LaTeX OPTIONS
       -b, --babel
              disable Babel package shorthands

       -r, --replace-quotes
              replace double quotes by \dq

       --pretty-symbols
              improve appearance of brackets and other symbols


RTF OPTIONS
       -x, --page-size=<size>
              set page size, <size>=[a3, a4, a5, b4, b5, b6, letter]

       --char-styles
              include character stylesheets


SVG OPTIONS
       --height=<h>
              set image height (units allowed)

       --width=<w>
              set image size (see --height)


GNU SOURCE-HIGHLIGHT COMPATIBILITY OPTIONS
       --doc  create stand alone document

       --no-doc
              cancel the --doc option

       --css=filename
              the external style sheet filename

       --src-lang=STRING
              source language

        -t, --tab=INT
              specify tab length

        -n, --line-number[=0]
              number all output lines, optional padding

       --line-number-ref[=p]
              number all output lines and generate an anchor, made of the specified prefix
               p + the line number  (default='line')

       --output-dir=path
               output directory

       --failsafe
              if no language definition is found for the input, it is simply copied to the output


       If no in- or output files are specified, stdin and stdout will be used for  in- or output.  HTML will be generated unless an other output format is given.  Style  definitions  are  stored  in  high‐
       light.css (HTML, XHTML, SVG) or highlight.sty (LaTeX, TeX) if neither -c nor -I is given.  Reformatting code (-F)  will only work with C, C++, C# and Java input files.

BUGS
       The wrapping options might cause faulty highlighting of multi line comments.

FILES
       The  parsing  information of the programming languages is stored in /usr/share/highlight/langDefs/.  You may enhance highlight's parsing capabilities by adding more *.lang - files to this directory.
       You can also define other directories with --data-dir.  Documentation files are stored in /usr/share/doc/highlight/ , configuration files in /etc/highlight/.


Examples
       Single file conversion:

       highlight -o hello.html -i hello.c

       highlight -o hello.html hello.c

       highlight -o hello.html -S c < hello.c

       highlight -S c < hello.c > hello.html

       Note that a file highlight.css is created in the current directory.

       Batch file processing:

       highlight --out-format=xhtml  -B '*.cpp' -d /home/you/html_code/

       converts all *.cpp files in the current directory and its subdirectories to xhtml files, and stores the output in /home/you/html_code.

       highlight --out-format=latex  * -d /home/you/latex_code/

       converts all files to LaTeX, stored in /home/you/latex_code/.

       Use --quiet to improve performance of batch file processing (recommended for usage in shell scripts).

       Use highlight --out-format=xterm256 <yourfile> | less -R to display a source file in a terminal.

AUTHORS
       Andre Simon <as@andre-simon.de>

SEE ALSO
       README file and highlight webpage at http://www.andre-simon.de/.



Andre Simon                                                                                       2012-10-03                                                                                     highlight(1)
