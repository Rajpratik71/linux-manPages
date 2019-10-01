GRUB-GLUE-EFI(3)                                                                           Library Functions Manual                                                                          GRUB-GLUE-EFI(3)



NAME
       grub-glue-efi — Create an Apple fat EFI binary.


SYNOPSIS
       grub-glue-efi <-3 | --input32=FILE> <-6 | --input64=FILE>
                      <-o | --output=FILE> [-v | --verbose]


DESCRIPTION
       grub-glue-efi creates an Apple fat EFI binary from two EFI binaries.


OPTIONS
       --input32=FILE
              Read 32-bit binary from FILE.


       --input64=FILE
              Read 64-bit binary from FILE.


       --output=FILE
              Write resulting fat binary to FILE.


       --verbose
              Print verbose messages.


SEE ALSO
       info grub



                                                                                               Wed Feb 26 2014                                                                               GRUB-GLUE-EFI(3)
