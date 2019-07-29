Pamtopdbimg User Manual(0)                                                                                                                                                         Pamtopdbimg User Manual(0)



NAME
       pamtodbimg - convert a Netpbm image to a Palm Pilot Image Viewer PDB Image


SYNOPSIS
       pamtopdbimg

       [-notefile=filename] [-title=text] [-compressed] [-uncompressed] [-maybecompressed] [-4depth]

       [netpbmfile]


DESCRIPTION
       This program is part of Netpbm(1)

       pamtopdbimg reads a Netpbm image as input and produced a Palm Pilot Image Viewer image (and Image record in a PDB file) as output.

       If the Netpbm image is black and white, the Pilot image is monochrome.  Otherwise, the Pilot image is either 4-level or 16-level grayscale, depending on the -4depth option.



OPTIONS
       -title=text
              The title of the image, to be included in the image.


       -compressed

       -uncompressed

       -maybecompressed
              You  may  specify  only one of these.  -compressed says to generate the image in compressed format.  -uncompressed says to generate the image in uncompressed format.  -maybecompressed says to
              generate whichever format is smaller (the compression algorithm sometimes actually makes the data larger).


       -4depth
              This option makes pamtopdbimg create the image in 16-level grayscale (4 bits per pixel) format.  If you don't specify this, pamtopdbimg uses 4-level (2 bits per pixel) format.

              This option has no effect when the input is black and white (maxval 1).  In that case, pamtopdbimg generates the monochrome (1 bit per pixel) format regardless.


       -notefile=filename
              Attach the note in the specified file to the image.

              If you don't specify this, pamtopdbimg does not attach any note.




SEE ALSO
       pdbimgtopam(1) , palmtopnm(1) , pam(5) ,


HISTORY
       pamtopdbimg was new in Netpbm 10.52 (September 2010).  It was modelled after Eric A. Howe's imgvtopbm package, which dates back to September 1997.



netpbm documentation                                                                          25 September 2010                                                                    Pamtopdbimg User Manual(0)
