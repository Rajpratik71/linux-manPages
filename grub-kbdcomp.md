GRUB-KBDCOMP(1)                                                                              User Commands                                                                             GRUB-KBDCOMP(1)

NAME
       grub-kbdcomp - generate a GRUB keyboard layout file

SYNOPSIS
       grub-kbdcomp -o OUTPUT CKBMAP_ARGUMENTS...

DESCRIPTION
       grub-kbdcomp processes a X keyboard layout description in keymaps(5) format into a format that can be used by GRUB's keymap command.

       Make GRUB keyboard layout file.

       -h, --help
              print this message and exit

       -V, --version
              print the version information and exit

       -o, --output=FILE
              save output in FILE [required]

       grub-kbdcomp generates a keyboard layout for GRUB using ckbcomp

REPORTING BUGS
       Report bugs to <bug-grub@gnu.org>.

SEE ALSO
       grub-mklayout(8)

       The full documentation for grub-kbdcomp is maintained as a Texinfo manual.  If the info and grub-kbdcomp programs are properly installed at your site, the command

              info grub-kbdcomp

       should give you access to the complete manual.

grub-kbdcomp ()                                                                              February 2019                                                                             GRUB-KBDCOMP(1)
