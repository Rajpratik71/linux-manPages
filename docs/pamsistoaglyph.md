Pamsistoaglyph User Manual(0)                                                                                                                                                   Pamsistoaglyph User Manual(0)



NAME
       pamsistoaglyph - convert a single-image stereogram to a red/cyan anaglyphic image



SYNOPSIS
       pamsistoaglyph [--invert] [--sep=number] [--minsep=number] [--gray=number] [in_netpbmfile


       All options can be abbreviated to their shortest unique prefix. You may use either white space or an equals sign between an option name and its value.



DESCRIPTION
       This program is part of Netpbm(1)

       pamsistoaglyph reads a Netpbm image as input and produces a Netpbm image as output.

       pamsistoaglyph takes a single-image stereogram (SIS) such as those produced by pamstereogram(1)

       and  converts  it  to  a  red/cyan  anaglyphic image such as those produced by ppm3d(1) Many people have trouble tricking their eyes into focusing beyond the image in front of them and are therefore
       unable to perceive the 3-D shape hidden within a single-image stereogram.  Anaglyphic stereograms are easier to perceive in 3-D but require a pair of red/cyan glasses such as  those  often  used  to
       watch 3-D movies. The goal of pamsistoaglyph is to help people who have trouble viewing single-image stereograms see the intriguing 3-D effect.

       pamsistoaglyph can convert single-image random-dot stereograms (SIRDS), wallpaper stereograms, and even dual-image stereograms to anaglyphic images.



OPTIONS
       For most images, no command-line options need to be specified. The following options are available, however, for unusual circumstances:



       --invert
              Swap the left- and right-eye
                  images. pamsistoaglyph assumes that its input
                  represents a wall-eyed stereogram and generates the anaglyphic
                  image accordingly. If the generated image appears to recede into
                  the page where it should pop out of the page (and vice versa),
                  this typically implies that the input image represents a
                  cross-eyed stereogram. Use --invert to correct
                  the image depth.


       --sep=number
              Specify the distance in pixels between the left- and right-eye
                  images. Essentially, this corresponds to the distance between
                  repetitions of the background pattern.  The --sep
                  option should rarely be necessary
                  as pamsistoaglyph is fairly good at determining
                  automatically the eye-separation distance.


       --minsep=number
              This option is similar to --sep but
                  constrains pamsistoaglyph only to
                  a minimum eye-separation distance. Any distance larger
                  than number is acceptable.  The --minsep
                  option should rarely be necessary
                  as pamsistoaglyph is fairly good at determining
                  automatically the eye-separation distance.  The default value for
                  the minimum eye-separation distance is 10% of the image width;
                  this value seems to work well in practice.


       --gray=number
              Limit the number of gray levels to use when searching for the
                  optimal eye-separation
                  distance.  Because pamsistoaglyph looks for
                  repeated patterns, it is vulnerable to being confused by slight
                  variations in color.  By reducing the input image to grayscale and
                  capping the number of gray levels,
                  pamsistoaglyph ameliorates the effects of
                  unintentional color variations (such as those caused by conversion
                  from a low-quality JPEG image, for example). The default of 63
                  seems to work well so the --gray option should
                  rarely be necessary.




NOTES
       The  registration  algorithm used by pamsistoaglyph was developed specifically for this program. As far as the author knows, there are no existing algorithms for converting stereograms to anaglyphs.
       The algorithm works as follows:



       ·      Convert the image to grayscale to increase the ability to identify
                  matches.


       ·      Count the number of pixels that match N pixels ahead in the
                  image for all N in [1, width/2].


       ·      Maintain a running mean (&mu;) and standard deviation (&sigma;) of
                  the number of matched pixels.


       ·      Store the N corresponding to each spike in the number of
                  matched pixels. A spike is defined as a tally that exceeds the
                  mean plus one, two, or three standard deviations. Only the first
                  spike of a given standard-deviation multiplier is stored.


       ·      If a tally greater than &mu;+3&sigma; was encountered, return the
                  corresponding N. If not, then if a tally greater than
                  &mu;+2&sigma; was encountered, return the
                  corresponding N. If not, then if a tally greater than
                  &mu;+&sigma; was encountered, return the
                  corresponding N. If not, then return the N that
                  produces the minimum average distance between matched pixels
                  (i.e., #matches divided by #pixels). If no
                  such N exceeds the minimum allowable eye-separation value,
                  return zero to indicate failure.


       ·      If the algorithm returned zero, rerun the algorithm independently
                  on each row of the input image and return the median of
                  all N that exceed the minimum allowable eye-separation
                  value. If no such N exists, abort with an error
                  message.



HISTORY
       Scott Pakin wrote pamsistoaglyph in April 2009.  It first appeared in Netpbm in Release 10.47 (June 2009).



AUTHOR
       Copyright (C) 2009 Scott Pakin, scott+pbm@pakin.org.



SEE ALSO
       ·

              pamstereogram(1)


       ·

              ppm3d(1) ,

       ·

              http://en.wikipedia.org/wiki/Stereogram ⟨http://en.wikipedia.org/wiki/Stereogram⟩



netpbm documentation                                                                             5 April 2009                                                                   Pamsistoaglyph User Manual(0)
