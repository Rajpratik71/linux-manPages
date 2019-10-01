GRUB-MKFONT(3)                                                                             Library Functions Manual                                                                            GRUB-MKFONT(3)



NAME
       grub-mkfont — Convert common font file formats into the PF2 format.


SYNOPSIS
       grub-mkfont [--ascii-bitmaps] [-a | --force-autohint]
                    [-b | --bold] [-c | --asce=NUM] [-d | --desc=NUM]
                    [-i | --index=NUM] [-n | --name=NAME] [--no-bitmap]
                    [--no-hinting] <-o | --output=FILE>
                    [-r | --range=FROM-TO[,FROM-TO]] [-s | --size=SIZE]
                    [-v | --verbose] [--width-spec] FONT_FILES


DESCRIPTION
       grub-mkfont converts font files from common formats into the PF2 format used by GRUB.


OPTIONS
       --ascii-bitmaps
              Save only bitmaps for ASCII characters.


       --force-autohint
              Force generation of automatic hinting.


       --bold Convert font to bold.


       --asce=NUM
              Set font ascent to NUM.


       --desc=NUM
              Set font descent to NUM.


       --index=NUM
              Select face index NUM.


       --name=NAME
              Set font family to NAME.


       --no-bitmap
              Ignore bitmap strikes when loading.


       --no-hinting
              Disable hinting.


       --output=FILE
              Save ouptut to FILE.  This argument is required.


       --range=FROM-TO,FROM-TO
              Set the font ranges to each pair of FROM,TO.


       --size=SIZE
              Set font size to SIZE.


       --verbose
              Print verbose messages.


       --width-spec
              Create a width summary file.


       FONT_FILES
              The input files to be converted.


SEE ALSO
       info grub



                                                                                               Wed Feb 26 2014                                                                                 GRUB-MKFONT(3)
