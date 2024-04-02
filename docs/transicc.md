TRANSICC(1)                                                                             General Commands Manual                                                                            TRANSICC(1)

NAME
       transicc - little cms ColorSpace conversion calculator.

SYNOPSIS
       transicc [options]

DESCRIPTION
       lcms is a standalone CMM engine, which deals with the color management.  It implements a fast transformation between ICC profiles.  transicc is lcms ColorSpace conversion calculator.

OPTIONS
       -%     use percent % of ink.

       -b     Black point compensation.

       -c <0,1,2,3>
              Precalculates transform. (0=Off, 1=Normal, 2=Hi-res, 3=LoRes) [defaults to 1]

       -i profile
              Input profile (defaults to sRGB).

       -l     Transform by device-link profile.

       -n     Terse output, intended for pipe usage.

       -o profile

       Output profile (defaults to sRGB).

       -t <0,1,2,3>
              Intent (0=Perceptual, 1=Colorimetric, 2=Saturation, 3=Absolute).

       -v     Verbose.

       -w     Use 16 bits.

       -x     Hexadecimal.

       You can use '*Lab' and '*xyz' as built-in profiles.

NOTES
       For suggestions, comments, bug reports etc. send mail to info@littlecms.com.

SEE ALSO
       jpgicc(1), tificc(1), psicc(1), linkicc(1),

AUTHOR
       This manual page was written by Shiju p. Nair <shiju.p@gmail.com>, for the Debian project.

                                                                                          September 30, 2004                                                                               TRANSICC(1)
