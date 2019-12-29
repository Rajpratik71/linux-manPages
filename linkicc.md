LINKICC(1)                              General Commands Manual                             LINKICC(1)

NAME
       linkicc - little cms device link generator.

SYNOPSIS
       linkicc [options] <profiles>

DESCRIPTION
       lcms  is  a standalone CMM engine, which deals with the color management.  It implements a fast
       transformation between ICC profiles.  linkicc is little cms device link generator.

       Links two or more profiles into a single devicelink profile.  Colorspaces must be paired except
       Lab/XYZ, that can be interchanged.

OPTIONS
       -8     Creates 8-bit devicelink.

       -b     Black point compensation.

       -c <0,1,2,3>
              Precission (0=LowRes, 1=Normal, 2=Hi-res). [defaults to 1]

       -d description
              Description text (quotes can be used).

       -h <0,1,2,3>
              Show summary of options and examples.

       -i profile
              Input profile (defaults to sRGB).

       -k <0..400>
              Ink-limiting in % (CMYK only)

       -o profile
              Output devicelink profile. [defaults to 'devicelink.icm']

       -t <0,1,2,3>
              Intent (0=Perceptual, 1=Colorimetric, 2=Saturation, 3=Absolute).

       -x     Creatively, guess deviceclass of resulting profile.

       Built-in profiles:
                   *Lab  -- D50-based CIEL*a*b (PCS)
                   *XYZ  -- CIE XYZ (PCS)
                   *sRGB -- sRGB color space
                   *Gray22- Monochrome of Gamma 2.2
                   *Lin2222- CMYK linearization of gamma 2.2 on each channel

EXAMPLES
       To create 'devicelink.icm' from a.icc to b.icc:
            linkicc a.icc b.icc

       To create 'out.icc' from sRGB to cmyk.icc:
            linkicc -o out.icc *sRGB cmyk.icc

       To create a sRGB input profile working in Lab:
            linkicc -x -o sRGBLab.icc *sRGB *Lab

       To create a XYZ -> sRGB output profile:
            linkicc -x -o sRGBLab.icc *XYZ *sRGB

       To create a abstract profile doing softproof for cmyk.icc:
            linkicc -t1 -x -o softproof.icc *Lab cmyk.icc cmyk.icc *Lab

       To create a 'grayer' sRGB input profile:
            linkicc -x -o grayer.icc *sRGB gray.icc gray.icc *Lab

       To embed ink limiting into a cmyk output profile:
            linkicc -x -o cmyklimited.icc -k 250 cmyk.icc *Lab

NOTES
       For suggestions, comments, bug reports etc. send mail to info@littlecms.com.

SEE ALSO
       jpgicc(1), tificc(1), psicc(1), transicc(1),

AUTHOR
       This manual page was written by Shiju p. Nair <shiju.p@gmail.com>, for the Debian project.

                                          September 30, 2004                                LINKICC(1)
