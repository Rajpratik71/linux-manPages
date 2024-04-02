PSICC(1)                                                                                General Commands Manual                                                                               PSICC(1)

NAME
       psicc - little cms PostScript converter.

SYNOPSIS
       psicc [options]

DESCRIPTION
       lcms is a standalone CMM engine, which deals with the color management.  It implements a fast transformation between ICC profiles.  psicc is little cms PostScript converter.

OPTIONS
       -b     Black point compensation (CRD only).

       -i profile
              Input profile: Generates Color Space Array (CSA).

       -o profile

       Output profile: Generates Color Rendering Dictionary(CRD).

       -t <0,1,2,3>
              Intent (0=Perceptual, 1=Colorimetric, 2=Saturation, 3=Absolute).

       -u     Do NOT generate resource name on CRD.

NOTES
       For suggestions, comments, bug reports etc. send mail to info@littlecms.com.

SEE ALSO
       jpgicc(1), tificc(1), linkicc(1), transicc(1),

AUTHOR
       This manual page was written by Shiju p. Nair <shiju.p@gmail.com>, for the Debian project.

                                                                                          September 30, 2004                                                                                  PSICC(1)
