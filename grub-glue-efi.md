GRUB-GLUE-EFI(1)                                                   User Commands                                                  GRUB-GLUE-EFI(1)

NAME
       grub-glue-efi - generate a fat binary for EFI

SYNOPSIS
       grub-glue-efi [OPTION...] [OPTIONS]

DESCRIPTION
       grub-glue-efi processes ia32 and amd64 EFI images and glues them according to Apple format.

       Glue 32-bit and 64-bit binary into Apple universal one.

       -3, --input32=FILE
              set input filename for 32-bit part.

       -6, --input64=FILE
              set input filename for 64-bit part.

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
       The  full documentation for grub-glue-efi is maintained as a Texinfo manual.  If the info and grub-glue-efi programs are properly installed
       at your site, the command

              info grub-glue-efi

       should give you access to the complete manual.

grub-glue-efi (GRUB) 2.02-pve6                                      March 2017                                                    GRUB-GLUE-EFI(1)
