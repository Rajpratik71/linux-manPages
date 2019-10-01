MFT(1)                                                                                     General Commands Manual                                                                                     MFT(1)



NAME
       mft - translate Metafont or MetaPost code to TeX code for prettyprinting

SYNOPSIS
       mft [OPTIONS] mf_file_name[.mf|.mp]

DESCRIPTION
       This manual page is not meant to be exhaustive.  The complete documentation for this version of TeX can be found in the info file or manual Web2C: A TeX implementation.

       The  mft  program  creates  a TeX file from a Metafont or MetaPost program.  It takes appropriate care of typographic details like page layout and the use of indentation, italics, boldface, etc., as
       illustrated in the book Computer Modern Typefaces.  Special conventions in Metafont and MetaPost comments allow you to control things that would not otherwise come out right; section 1  of  the  MFT
       source program in the Metafontware report explains these rules.

       The mft program uses an optional change file (which works just as the change files to tangle(1) and weave(1) do) and one or several style files (which are prepended to everything).  If no style file
       is specified, the style file plain.mft for Metafont (or mplain.mft for MetaPost) is automatically used.

       The mf_file_name, optional change_file_name, and style_file_name files are searched for using the MFINPUTS (for Metafont) or MPINPUTS (for MetaPost) and MFTINPUTS environment variables if  you  have
       set them, or else the corresponding system defaults.

       The output TeX file name is formed by using .tex in place of the extension of mf_file_name.

OPTIONS
       -change=change_file_name[.ch]
              Apply the change file change_file_name to mf_file_name.

       -metapost
              Assume mf_file_name is a MetaPost source file (this is the default if mf_file_name has the extension .mp).

       -style=style_file_name[.mft]
              Use the style file style_file_name insted of plain.mft (or mplain.mft); this option can be given more than once.

FILES
       mftmac.tex
              TeX macros used by mft output.

       plain.mft, mplain.mft
              Default style files.

       cmbase.mft
              Style file for Computer Modern.

SEE ALSO
       mf(1), weave(1).
       Donald E. Knuth, Computer Modern Typefaces (Volume E of Computers and Typesetting), Addison-Wesley, 1986, ISBN 0-201-13446-2.
       Donald E. Knuth et al., Metafontware.

AUTHORS
       Donald  E.  Knuth wrote the program, and he ported it to Unix with the help of Pierre MacKay and the Unix port of weave by Howard Trickey and Pavel Curtis.  The program is published in the Metafont‐
       ware technical report, available from the TeX Users Group.



Web2C 2012                                                                                     14 December 1993                                                                                        MFT(1)
