TFTOPL(1)                                                                        General Commands Manual                                                                        TFTOPL(1)

NAME
       tftopl - convert TeX font metric (tfm) files to property lists

SYNOPSIS
       tftopl [OPTIONS] tfm_name[.tfm] [pl_name[.pl]]

DESCRIPTION
       This manual page is not meant to be exhaustive.  The complete documentation for this version of TeX can be found in the info file or manual Web2C: A TeX implementation.

       The  tftopl  program  translates  a  (program-oriented)  font metric file to a (human-oriented) property list file.  Thus, you can edit the contents of the TFM files, if the font
       designer has not done his or her job properly, or if you're encountering strange difficulties, or if you're just curious.  It also serves as a TFM-file validating program,  i.e.,
       if no error messages are given, the input file is correct.

       The  pl_name  is  extended with .pl if it lacks a suffix.  If pl_name is not given, standard output is used. Likewise, tfm_name is extended with .tfm if it lacks a suffix.  Also,
       path searching is done for the TFM file using the environment variable TEXFONTS.  If that is not set, tftopl uses the system default.

       See tex(1) for the details of the searching.

OPTIONS
       -charcode-format=format
              The argument format specifies how character codes are output in the PL file.  By default, only letters and digits are output using the C integer code (i.e., in ASCII); the
              others are output in octal.  (Unless the font's coding scheme starts with TeX math sy or TeX math ex, in which case all character codes are output in octal.)  If format is
              ascii, all character codes that correspond to graphic characters, besides the left and right parentheses, are output in ASCII.  Finally, if format is octal, all  character
              codes are output in octal.

       -verbose
              Without this option, tftopl operates silently.  With it, a banner and progress report are printed on stdout.

SEE ALSO
       pltotf(1),
       Donald E. Knuth, TeXware.
       Donald E. Knuth, The Metafontbook (Volume C of Computers and Typesetting), Addison-Wesley, 1986, ISBN 0-201-13445-4.

AUTHORS
       Donald  E.  Knuth  wrote  the  program.  It was published as part of the TeXware technical report, available from the TeX Users Group.  Howard Trickey and Pavel Curtis originally
       ported it to Unix.

Web2C 2019/dev                                                                         16 June 2015                                                                             TFTOPL(1)
