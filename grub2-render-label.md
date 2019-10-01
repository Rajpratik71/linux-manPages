GRUB-RENDER-LABEL(3)                                                                       Library Functions Manual                                                                      GRUB-RENDER-LABEL(3)



NAME
       grub-render-label — Render an Apple disk label.


SYNOPSIS
       grub-render-label [-b | --bgcolor=COLOR] [-c | --color=COLOR]
                          [-f | --font=FILE] [-i | --input=FILE]
                          [-o | --output=FILE] [-t | --text=STRING]
                          [-v | --verbose]


DESCRIPTION
       grub-render-label renders an Apple disk label (.disk_label) file.



OPTIONS
       --color=COLOR
              Use COLOR as the color for generated labels.


       --bgcolor=COLOR
              Use COLOR as the background color for generated labels.


       --font=FILE
              Use FILE as the font file for generated labels.


       --input=FILE
              Read input text from FILE.


       --output=FILE
              Render output to FILE.


       --text=STRING
              Use STRING as input text.


       --verbose
              Print verbose output.



SEE ALSO
       info grub



                                                                                               Wed Feb 26 2014                                                                           GRUB-RENDER-LABEL(3)
