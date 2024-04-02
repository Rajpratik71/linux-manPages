fish_indent(1)                                                         fish                                                         fish_indent(1)

NAME
       fish_indent -- indenter and prettifier

   Synopsis
       fish_indent [OPTIONS]

   Description
       fish_indent is used to indent a piece of fish code. fish_indent reads commands from standard input and outputs them to standard output.

       The following options are available:

       · -i or --no-indent do not indent commands; only reformat to one job per line

       · -v or --version displays the current fish version and then exits

       · --ansi colorizes the output using ANSI escape sequences, appropriate for the current $TERM, using the colors defined in the environment
         (such as $fish_color_command).

       · --html outputs HTML, which supports syntax highlighting if the appropriate CSS is defined. The CSS class names are the same as the
         variable names, such as fish_color_command

Version 2.2.0                                                     Wed Dec 16 2015                                                   fish_indent(1)
