Pamtooctaveimg User Manual(0)                                                                                                                                                   Pamtooctaveimg User Manual(0)



       " "netpbm documentation" <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd"> <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">



NAME
       pamtooctaveimg - convert a Netpbm image to a GNU Octave image


SYNOPSIS
       pamtooctaveimg [netpbmfile]


DESCRIPTION
       This program is part of Netpbm(1)

       pamtooctaveimg reads a Netpbm image as input and produces a GNU Octave ⟨http://www.octave.org/⟩  image file as output.

       An Octave image file (called 'Octave's image format' in Octave documentation) is a particular kind of Octave data file.  It describes two matrices:



       ·      the image itself as a list of indexes into a colormap, and

       ·      the corresponding colormap as a list of {red, green, blue} triplets.


       An Octave data file is an ASCII text file that you use to import data to Octave.

       See the
        Image Processing chapter ⟨http://www.gnu.org/software/octave/doc/interpreter/Image-Processing.html#Image-Processing⟩  of the GNU Octave manual for details.

       pamtooctaveimg writes the output Octave image to Standard Output.


Arguments
       netpbmfile  is  the  name of the file containing the input PNM or PAM image, or - to indicate Standard Input.  If you don't specify netpbmfile, the input is from Standard Input.  pamtooctaveimg con-
       verts only the first image in the input stream.



Examples
          % pamtooctaveimg myimage.ppm > myimage.img
          % octave
          > [img,map] = loadimage("myimage.img");

          # (At this point, img is an X by Y matrix and map is a 3 by M matrix.)

          > imshow(img,map);   # Displays img with colormap map
          > [r,g,b] = ind2rgb(img,map);

          # (r, g, and b are now each X by Y matrices of color levels [0 to 1].)

          > [newimg,newmap] = rgb2ind(r,b,g);   # Swap the blue and green channels.
          > saveimage("newimage.ppm", newimg, "ppm", newmap);  # Save as a PPM file.



NOTES
       There is no octavetopam program.  However, GNU Octave's saveimage command can save images in PPM format.



HISTORY
       pamtooctaveimg was new in Netpbm 10.39 (June 2007).



SEE ALSO
       octave(1) , pam(5)


AUTHOR
       Copyright (C) 2007 Scott Pakin, scott+pbm@pakin.org.



                                                                                                 27 June 2007                                                                   Pamtooctaveimg User Manual(0)
