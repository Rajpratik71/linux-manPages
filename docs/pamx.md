Pamx User Manual(0)                                                                                                                                                                       Pamx User Manual(0)



NAME
       pamx - display Netpbm image in X Window System window


SYNOPSIS
       pamx

       [-fullscreen]  [-install]  [-private]  [-fit]  [-pixmap]  [-verbose]  [-display=x-display]  [-title=text] [-foreground=color] [-background=color] [-border=color] [-geometry=x-geometry-string] [-vis-
       ual=name] netpbm_file

       All options can be abbreviated to their shortest unique prefix.  You may use two hyphens instead of one to designate an option.  You may use either white space or an equals sign  between  an  option
       name and its value.


DESCRIPTION
       This program is part of Netpbm(1)

       pamx displays a Netpbm image in an X Window System window.  It is like a very simple version of the classic X image viewer xloadimage.

       If  you  don't  specify the input file netpbm_file, the input is from Standard Input.  The input image can be any Netpbm image format.  If the input is a multi-image stream, pamx ignores all but the
       first image.

       pamx is not the best choice for general purpose viewing of images, because it is a traditional simple Netpbm building block.  It is a good thing to build into other programs and can  be  useful  for
       debugging more complex systems, but you can get much more powerful viewers that can display Netpbm images.  For example, xloadimage, xli, xzgv, and any web browser.

       The  program  xwud (X Window Undump) is part of the X Window System and performs the same basic display function, though with input in the special X Window Dump format (for which Netpbm has convert-
       ers).

       The initial window is at most 90% of the size of the display unless the window manager does not correctly handle window size requests or if you've used the -fullscreen  option.   You  may  move  the
       image around in the window by dragging with the first mouse button.  The cursor will indicate which directions you may drag, if any.  You may exit the window by typing 'q' or control-C when the key-
       board focus is on the window.

       ppmsvgalib is a similar program that displays an image on a Linux system without the need for the X Window System.



X RESOURCE CLASS
       pamx uses the resource class name Xloadimage for window managers which need this resource set.  This is, of course, the same resource class that the conventional viewer program xloadimage uses.



OPTIONS
       -border=color
              This sets the background portion of the window which is not covered by any images to be color.


       -display=display_name
              This names the X display in which to put the window.  E.g. 0:0.


       -fit   Force image to use the default visual and colormap.  This is useful if you do not want technicolor effects when the colormap focus is inside the image window, but it may reduce the quality of
              the displayed image.


       -fullscreen
              Use the entire screen to display the image.


       -geometry=WxH[{+,-}X{+,-}Y
              This sets the size and position of the window in which pamx displays the image.

              By default, the window size exactly matches the image size, except that if you don't specify -fullscreen, the maximum is 90% of the screen dimensions.


       -install
              Forcibly  install  the image's colormap when the window is focused.  This violates ICCCM standards and only exists to allow operation with naive window managers.  Use this option only if your
              window manager does not install colormaps properly.


       -pixmap
              Force the use of a pixmap as backing-store.  This is provided for servers where backing-store is broken (such as some versions of the AIXWindows server).  It may improve scrolling performance
              on servers which provide backing-store.


       -private
              Force pamx to use of a private colormap.  By default, pamx allocates colors shared unless there are not enough colors available.


       -verbose
              Causes pamx to print various information about what it's doing to Standard Error.


       -visual=visual_name
              Force  the  use  of  a specific visual type to display an image.  By default, pamx tries to pick the best available image for a particular image type.  The available visual types are: Direct-
              Color, TrueColor, PseudoColor, StaticColor, GrayScale, and StaticGray.  You may use the shortest unique prefix of these names, and case is not significant.


       -background=color
              Use color as the background color instead of the default (usually white but this depends on the image type) if you are transferring a monochrome image to a color display.


       -foreground=color
              Use color as the foreground color instead of black if you are transferring a monochrome image to a color display.  You can also use this to invert the foreground and background  colors  of  a
              monochrome image.


       -title=text
              Set the title bar title of the window.  Default is the file name of the input file, or 'stdin' if the image is from Standard Input.




SEE ALSO
       ppmsvgalib(1) , pam(5) , pnm(5) , xzgv, xwud, xloadimage, xli



AUTHOR
       pamx is by Bryan Henderson, in March 2006, based on xloadimage by Jim Frost, Centerline Software, jimf@centerline.com, 1989-1993.

       Jim's code contained the following copyright notice and license:


              Copyright 1989, 1993 Jim Frost


              Permission to use, copy, modify, distribute, and sell this software and its documentation for any purpose is hereby granted without fee, provided that the above copyright notice appear in all
              copies and that both that copyright notice and this permission notice appear in supporting documentation.  The author makes no representations about the suitability of this software  for  any
              purpose.  It is provided "as is" without express or implied warranty.


              THE  AUTHOR  DISCLAIMS  ALL  WARRANTIES  WITH REGARD TO THIS SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL,
              INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT  OF
              OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.


       Lots of other people contributed to Xloadimage, and they are listed in the file COPYRIGHT in the source code.



HISTORY
       pamx was new in Netpbm 10.34 (May 2006).

       pamx is essentially based on the classic X displayer program xloadimage by Jim Frost, 1989.  Bryan Henderson stripped it down and adapted it to Netpbm in March 2006.

       The  following  features  of  xloadimage are left out of pamx, to be more compatible with Netpbm's philosophy of simple building blocks.  Note that there are other programs in Netpbm that do most of
       these things:


       ·      zoom in/out

       ·      ability to accept formats other than Netpbm

       ·      image transformations (brightening, clipping, rotating, etc)

       ·      decompressing and other decoding of input

       ·      ability to display on the root window

       ·      slide show


              pamx also differs from xloadimage in that it uses Libnetpbm.

       There is virtually no code from xloadimage actually in pamx, because Bryan rewrote it all to make it easier to understand.



netpbm documentation                                                                             02 July 2011                                                                             Pamx User Manual(0)
