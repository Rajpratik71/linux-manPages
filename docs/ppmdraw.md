Ppmdraw User Manual(0)                                                                                                                                                                 Ppmdraw User Manual(0)



NAME
       ppmdraw - draw lines, text, etc on a PPM image


SYNOPSIS
       ppmdraw

       { -script=script | -scriptfile=filename } [-verbose]

       [ppmfile]

       All  options  can  be abbreviated to their shortest unique prefix.  You may use two hyphens instead of one to designate an option.  You may use either white space or an equals sign between an option
       name and its value.



DESCRIPTION
       This program is part of Netpbm(1)

       ppmdraw draws lines, shapes, text, etc. on a PPM image.  It is essentially an easy-to-program front end to libnetpbm's 'ppmd' subroutines.  It lets you create a human-friendly script to describe the
       drawing rather than write a C program.

       You supply drawing instructions with a script, which you supply either in a file named by a -scriptfile option or as the value of a -script option.  Here is an example script:

       setpos 50 50;
       text_here 10 30 'hello';
       setcolor black;
       text_here 10 0 'there';
       line_here 5 20;

       This  example  starts  at Column 50, Row 50 of the input image and writes the word 'hello' there in 10 pixel high white letters at a 30 degree angle up from horizontal.  Then, from where that leaves
       off, the script writes 'there' in 10 pixel high black letters horizontally.  Finally, it draws a black line to a point 5 pixels over and 20 pixels down from the end of 'there.'

       If you don't specify ppmfile, ppmdraw reads its input PPM image from Standard Input.

       The output image goes to Standard Output.

       ppmdraw works on multi-image streams.  It executes the same script on each input image and produces an output stream with one image for each input image.  But before Netpbm  10.32  (February  2006),
       ppmdraw ignored every image after the first.

       If you just want to add a single line of text to an image, ppmlabel may be more what you want.



OPTIONS
       -script=script
              This option gives the script.  See Script ⟨#script⟩ .

              You may not specify both -script and -scriptfile.


       -scriptfile=filename
              This option names a file that contains the script.  - means Standard Input.

              You may not specify both -script and -scriptfile.

              You may not specify - (Standard Input) for both -scriptfile and the input image file.





SCRIPT
       The  heart of ppmdraw function is its script.  The script is a character stream.  The stream consists of commands.  Commands are separated by semicolons.  White space is regarded just like in C: Any
       contiguous stretch of unquoted white space is equivalent to a single space character.  Note that this means newlines have no particular significance.

       A command is composed of tokens, separated from each other by white space.  To write a token that contains white space, enclose it in double quotes.  Everything between two matched  quotation  marks
       is one token.

       The  first  token of a command is the verb, which determines the basic function of the command.  The rest of the tokens of the command are arguments, the meaning of which depends upon the verb.  The
       following list gives all the valid verbs, and for each its meaning and its arguments.

       Many command have arguments that specify a position on the canvas, which you specify by row and column.  Row 0 is the top row.  Column 0 is the leftmost column.  You  may  specify  negative  numbers
       (but such a position would necessarily be off the canvas).

       Your drawing instructions may involve positions not on the canvas.  But any pixels you draw there just get discarded.



       setpos Set the 'current position' in the image.  This affects where subsequent commands draw things.  The 2 arguments are the column and row number.

              At the start of the script, the current position is (0,0).


       setlinetype
              The 1 argument is 'normal' or 'nodiag.'.  This effects a ppmd_setlinetype() call.  Further details are not yet documented.


       setlineclip
              This effects a ppmd_setlineclip() call.  Not yet documented.


       setcolor
              This sets the 'current color', which determines the color in which subsequent drawing commands draw.  Before the first setcolor, the current color is white.


       setfont
              This sets the 'current font', which determines the font in which subsequent text drawing commands draw.  Before the first setfont, the current font is a built in font called 'standard.'

              The argument of this command is a file name.  It is the name of a Netpbm PPMD font file.

              A Netpbm PPMD font file typically has a name that ends in '.ppmdfont' and its first 8 bytes are the ASCII encoding of 'ppmdfont'.

              There  is  only one of these fonts as far as we know.  It is distributed with Netpbm as the file standard.ppmdfont, but you don't need to use that file because the same font is built into the
              Netpbm library and is the default.  If you want to make a new font, you can find the format of a ppmdfont file in the Netpbm interface header file ppmdfont.h, but you'll have to make your own
              tools to build it.  The program ppmdmkfont generates standard.ppmdfont, so you can use that as an example.


       line   This draws a one pixel wide line in the current color.  The 4 arguments are: starting column, starting row, ending column, ending row.

              This command does not affect the current position.


       line_here
              This is like line, except it works in a more relative way.

              The  line starts at the current point.  The two arguments are the rightward and downward displacement from there to the terminal point.  The command moves the current position to the terminal
              point after drawing.


       spline3
              This draws a spline in the current color between 2 points, using a third as a control point.  It approximates a cubic spline segment.

              The shape of the curve is such that it passes through the specified endpoints, and lines tangent to the curve at those endpoints intersect at the  control  point.   Controlling  the  tangents
              allows you to connect this curve to other curves generated the same way without having corners at the connection points.

              The 6 arguments are the starting point column, starting point row, control point column, control point row, ending point column, and ending point row.

              This command does not affect the current position.


       circle This command draws a circle in the current color.  The three arguments are the column number and row number of the center of the circle and the radius of the circle in pixels.


       filledrectangle
              This command draws a rectangle filled with the current color.

              The 4 arguments are the column and row numbers of the upper left corner of the rectangle, the width of the rectangle, and the height of the rectangle.


       text   This command draws text in the current color in the built-in font.  The 5 arguments are:



       ·      column number of starting point of baseline

       ·      row number of starting point of baseline

       ·      height of characters, in pixels

       ·      angle of baseline in degrees elevated from the horizontal

       ·      text


              Note that if your text contains white space, you'll have to use double quotes to cause it to be a single token.


       text_here
              This is like text, except that the baseline starts at the current position and the command updates the current position to the other end of the baseline after it draws.

              Bear in mind that a script starts with the current position in the top line, so if you leave it there, only the bottom line of your text will be within the image!




HISTORY
       ppmdraw was new in Netpbm 10.29 (August 2005).



SEE ALSO
       ppmlabel(1) , ppm(5)



netpbm documentation                                                                             22 June 2005                                                                          Ppmdraw User Manual(0)
