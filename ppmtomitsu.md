Ppmtomitsu User Manual(0)                                                                                                                                                           Ppmtomitsu User Manual(0)



NAME
       ppmtomitsu - convert a PPM image to a Mitsubishi S340-10 file


SYNOPSIS
       ppmtomitsu

       [-sharpness val]

       [-enlarge val]

       [-media string]

       [-copy val]

       [-dpi300]

       [-tiny]

       [ppmfile]


DESCRIPTION
       This program is part of Netpbm(1)

       ppmtomitsu reads a PPM image as input and converts it into a format suitable to be printed by a Mitsubishi S340-10 printer, or any other Mitsubishi color sublimation printer.

       The  Mitsubishi  S340-10 Color Sublimation printer supports 24bit color.  Images of the available sizes take so long to transfer that there is a fast method, employing a lookuptable, that ppmtomitsu
       will use if there is a maximum of 256 colors in the image.  ppmtomitsu will try to position your image to the center of the paper, and will rotate your image for you if xsize is larger  than  ysize.
       If  your image is larger than the media allows, ppmtomitsu will quit with an error message. (We decided that the media were too expensive to have careless users produce misprints.)  Once data trans-
       mission has started, the job can't be stopped in a sane way without resetting the printer.  The printer understands putting together images in the printers memory; ppmtomitsu doesn't utilize this as
       pnmcat etc provide the same functionality and let you view the result on-screen, too.  The S340-10 is the lowest common denominator printer; for higher resolution printers there's the dpi300 option.
       The other printers also support higher values for enlarge eg, but I don't think that's essential enough to warrant a change in the program.

       For proper results, the input maxval must be 255.  Use pamdepth to ensure that it is.

       Before Netpbm 10.40 (September 2007), all Netpbm PPM programs, including ppmtomitsu, see a PBM image as having maxval 1, so ppmtomitsu does not function properly with PBM input.  You  can  use  ppm-
       toppm together with pamdepth to turn your PBM input into maxval 255 PPM input that ppmtomitsu will use properly.



OPTIONS
       -sharpness 1-4
              'sharpness' designation.  Default is  to use the current sharpness.


       -enlarge 1-3
              Enlarge by a factor; Default is 1 (no enlarge)


       -media {A|A4|AS|A4S}
              Designate  the  media  you're  using.   Default is 1184 x 1350, which will fit on any media.  A is 1216 x 1350, A4 is 1184 x 1452, AS is 1216 x 1650 and A4S is 1184 x 1754.  A warning: If you
              specify a different media than the printer currently has, the printer will wait until you put in the correct media or switch it off.


       -copy 1-9
              The number of copies to produce.  Default is 1.


       -dpi300
              Double the number of allowed pixels for a S3600-30 Printer in S340-10 compatibility mode.  (The S3600-30 has 300 dpi).


       -tiny  Memory-saving, but always slow. The printer will get the data line-by-line in 24bit. It's probably a good idea to use this if your machine starts paging a lot without this option.




REFERENCES
       Mitsubishi Sublimation Full Color Printer S340-10 Specifications of Parallel Interface LSP-F0232F


SEE ALSO
       pnmquant(1) , pamscale(1) , ppm(5)



AUTHOR
       Copyright (C) 1992, 93 by S.Petra Zeidler, MPIfR Bonn, Germany.  (spz@specklec.mpifr-bonn.mpg.de)



netpbm documentation                                                                            24 March 2009                                                                       Ppmtomitsu User Manual(0)
