GRUB-MKLAYOUT(3)                                                                           Library Functions Manual                                                                          GRUB-MKLAYOUT(3)



NAME
       grub-mklayout — Generate a GRUB keyboard layout file.


SYNOPSIS
       grub-mklayout [-i | --input=FILE] [-o | --output=FILE]
                      [-v | --verbose]


DESCRIPTION
       grub-mklayout generates a GRUB keyboard layout description which corresponds with the Linux console layout description given as input.


OPTIONS
       --input=FILE
              Use FILE as the input.  The default value is the standard input device.


       --output=FILE
              Use FILE as the output.  The default value is the standard output device.


       --verbose
              Print verbose messages.


SEE ALSO
       info grub



                                                                                               Wed Feb 26 2014                                                                               GRUB-MKLAYOUT(3)
