GRUB-MKLAYOUT(1)                                                                              User Commands                                                                              GRUB-MKLAYOUT(1)

NAME
       grub-mklayout - generate a GRUB keyboard layout file

SYNOPSIS
       grub-mklayout [OPTION...] [OPTIONS]

DESCRIPTION
       grub-mklayout processes a keyboard layout description in keymaps(5) format into a format that can be used by GRUB's keymap command.

       Generate GRUB keyboard layout from Linux console one.

       -i, --input=FILE
              set input filename. Default is STDIN

       -o, --output=FILE
              set output filename. Default is STDOUT

       -v, --verbose
              print verbose messages.

       -?, --help
              give this help list

       --usage
              give a short usage message

       -V, --version
              print program version

       Mandatory or optional arguments to long options are also mandatory or optional for any corresponding short options.

REPORTING BUGS
       Report bugs to <bug-grub@gnu.org>.

SEE ALSO
       grub-mkconfig(8)

       The full documentation for grub-mklayout is maintained as a Texinfo manual.  If the info and grub-mklayout programs are properly installed at your site, the command

              info grub-mklayout

       should give you access to the complete manual.

grub-mklayout (GRUB) 2.02~beta2-36ubuntu3.23                                                   October 2019                                                                              GRUB-MKLAYOUT(1)
