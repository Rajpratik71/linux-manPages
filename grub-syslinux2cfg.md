GRUB-SYSLINUX2CFG(1)                                                                          User Commands                                                                          GRUB-SYSLINUX2CFG(1)

NAME
       grub-syslinux2cfg - transform syslinux config into grub.cfg

SYNOPSIS
       grub-syslinux2cfg [OPTION...] FILE

DESCRIPTION
       Transform syslinux config into GRUB one.

       -c, --cwd=DIR
              current directory of the syslinux [default is parent directory of input file].

       -i, --isolinux
              assume input is an isolinux configuration file.

       -o, --output=FILE
              write output to FILE [default=stdout].

       -p, --pxelinux
              assume input is a pxelinux configuration file.

       -r, --root=DIR
              root directory of the syslinux disk [default=/].

       -s, --syslinux
              assume input is a syslinux configuration file.

       -t, --target-root=DIR
              root directory as it will be seen on runtime [default=/].

       -T, --target-cwd=DIR
              current directory of the syslinux as it will be seen on runtime  [default is parent directory of input file].

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
       grub-menulst2cfg(8)

       The full documentation for grub-syslinux2cfg is maintained as a Texinfo manual.  If the info and grub-syslinux2cfg programs are properly installed at your site, the command

              info grub-syslinux2cfg

       should give you access to the complete manual.

grub-syslinux2cfg (GRUB) 2.02~beta2-36ubuntu3.23                                               October 2019                                                                          GRUB-SYSLINUX2CFG(1)
