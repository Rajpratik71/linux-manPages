TILT(1)                                          tilt                                          TILT(1)

NAME
       tilt - Generic interface to multiple Ruby template engines

SYNOPSIS
       tilt <options> <file>

DESCRIPTION
       Process  template <file> and write output to stdout. With no <file> or when <file> is '-', read
       template from stdin and use the --type option to determine the template's type.

       Options

       -l, --list
              List template engines + file patterns and exit

       -t, --type=<pattern> Use this template engine; required if no <file>

       -y, --layout=<file>
              Use <file> as a layout template

       -D<name>=<value>
              Define variable <name> as <value>

       -o, --vars=<ruby>
              Evaluate <ruby> to Hash and use for variables

       -h, --help
              Show this help message

   Convert markdown to HTML:
              $ tilt foo.markdown > foo.html

   Process ERB template:
              $ echo "Answer: <%= 2 + 2 %>" | tilt -t erb Answer: 4

   Define variables:
              $ echo "Answer: <%= 2 + n %>" | tilt --locals="{:n=>40, :x=>0}" Answer: 42 $  echo  "An‐
              swer: <%= 2 + n %>" | tilt -Dn=40 -Dx=0 Answer: 42

tilt 1.3.2                                     July 2011                                       TILT(1)
