GRUB-RENDER-LABEL(1)                         User Commands                        GRUB-RENDER-LABEL(1)

NAME
       grub-render-label - generate a .disk_label for Apple Macs.

SYNOPSIS
       grub-render-label [OPTION...] [OPTIONS]

DESCRIPTION
       Render Apple .disk_label.

       -b, --bgcolor=COLOR
              use COLOR for background

       -c, --color=COLOR
              use COLOR for text

       -f, --font=FILE
              use FILE as font (PF2).

       -i, --input=FILE
              read text from FILE.

       -o, --output=FILE
              set output filename. Default is STDOUT

       -t, --text=STRING
              set the label to render

       -v, --verbose
              print verbose messages.

       -?, --help
              give this help list

       --usage
              give a short usage message

       -V, --version
              print program version

       Mandatory  or  optional arguments to long options are also mandatory or optional for any corre‐
       sponding short options.

REPORTING BUGS
       Report bugs to <bug-grub@gnu.org>.

SEE ALSO
       The full documentation for grub-render-label is maintained as a Texinfo manual.   If  the  info
       and grub-render-label programs are properly installed at your site, the command

              info grub-render-label

       should give you access to the complete manual.

grub-render-label (GRUB) 2.04-1ubuntu12.1    November 2019                        GRUB-RENDER-LABEL(1)
