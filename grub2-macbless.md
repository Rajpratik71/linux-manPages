GRUB-MACBLESS(1)                                                                           General Commands Manual                                                                           GRUB-MACBLESS(1)



NAME
       grub-macbless — Mac-style bless utility for HFS or HFS+


SYNOPSIS
       grub-macbless [-p | --ppc] [-v | --verbose] [-x | --x86] FILE


DESCRIPTION
       grub-mkimage blesses a file on an HFS or HFS+ file system, so that it can be used to boot a Mac.


OPTIONS
       --ppc  Bless the file for use on PPC-based Macs.


       --verbose
              Print verbose messages.


       --x86  Bless the file for use on x86-based Macs.


SEE ALSO
       info grub



                                                                                               Wed Feb 26 2014                                                                               GRUB-MACBLESS(1)
