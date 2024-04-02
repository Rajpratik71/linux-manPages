GTF(1)                                                                                  General Commands Manual                                                                                 GTF(1)

NAME
       gtf - calculate VESA GTF mode lines

SYNOPSIS
       gtf h-resolution v-resolution refresh [-v|--verbose] [-f|--fbmode] [-x|--xorgmode]

DESCRIPTION
       Gtf  is a utility for calculating VESA GTF modes.  Given the desired horizontal and vertical resolutions and refresh rate (in Hz), the parameters for a matching VESA GTF mode are printed out.
       Two output formats are supported: mode lines suitable for the Xorg xorg.conf(5) file, and mode parameters suitable for the Linux fbset(8) utility.

OPTIONS
       -v|--verbose
               Enable verbose printouts  This shows a trace for each step of the computation.

       -x|--xorgmode
               Print the mode parameters as Xorg-style mode lines.  This is the default format.

       -f|--fbset
               Print the mode parameters in a format suitable for fbset(8).

SEE ALSO
       xorg.conf(5), cvt(1)

AUTHOR
       Andy Ritger.

       This program is based on the Generalized Timing Formula (GTF(TM)) Standard Version: 1.0, Revision: 1.0.  The GTF Excel(TM) spreadsheet, a sample (and the definitive) implementation of the GTF
       Timing Standard is available at <ftp://ftp.vesa.org/pub/GTF/VTF_V1R1.xls>.

X Version 11                                                                              xorg-server 1.20.1                                                                                    GTF(1)
