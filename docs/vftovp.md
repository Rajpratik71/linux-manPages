VFTOVP(1)                                                                        General Commands Manual                                                                        VFTOVP(1)

NAME
       vftovp - convert virtual font (vf) files to virtual property lists (vpl)

SYNOPSIS
       vftovp [OPTIONS] vf_name[.vf] [tfm_name[.tfm] [vpl_name[.vpl]]]

DESCRIPTION
       This manual page is not meant to be exhaustive.  The complete documentation for this version of TeX can be found in the info file or manual Web2C: A TeX implementation.

       The  vftovp  program translates a (program-oriented) virtual font file and its accompanying TeX font metric file to a (human-oriented) property list file.  Thus, the virtual font
       can be edited, and its exact contents can be displayed mnemonically.  It also serves as a VF-file validating program; if no error messages are given, the input files are correct.

       The filenames are extended with the appropriate extension if necessary.

OPTIONS
       -charcode-format=format
              The argument format specifies how character codes are output in the VPL file.  By default, only letters and digits are output using the C integer code  (i.e.,  in  ASCII);
              the others are output in octal.  (Unless the font's coding scheme starts with TeX math sy or TeX math ex, when all are output in octal.)  If format is ascii, all character
              codes that correspond to graphic characters, besides the left and right parentheses, are output in ASCII.  On the other hand, if format is octal, all character  codes  are
              output in octal.

       -verbose
              Without this option, vftovp operates silently.  With it, a banner and progress report are printed on stdout.

ENVIRONMENT
       vftovp looks for vf_name using the environment variable VFFONTS.  If that is not set, it uses the variable TEXFONTS.  If that is not set, it uses the system default.

       See tex(1) for the details of the searching.

SEE ALSO
       pltotf(1), tftopl(1), vptovf(1).

AUTHORS
       Donald E. Knuth wrote the program, based in part on an idea of David Fuchs, starting with the code for tftopl(1).  Karl Berry adapted it for compilation with web2c.

Web2C 2019/dev                                                                         16 June 2015                                                                             VFTOVP(1)
