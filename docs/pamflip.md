Pamflip User Manual(0)                                                                                                                                                                 Pamflip User Manual(0)



NAME
       pamflip - flip or rotate a PAM or PNM image


SYNOPSIS
       pamflip  {  -leftright  |  -lr | -topbottom | -tb | -transpose | -xy | -rotate90 | -r90 | -cw | -rotate270 | -r270 | -ccw | -rotate180 | -r180 -null | -xform=xform1,xform2...  } [-memsize=mebibytes]
       [-pagesize=bytes] [pamfile]

       All options can be abbreviated to their shortest unique prefix.  You may use two hyphens instead of one to designate an option.  You may use either white space or an equals sign  between  an  option
       name and its value.



DESCRIPTION
       This program is part of Netpbm(1)

       pamflip flips a PAM or PNM image top for bottom or left for right, or transposes it horizontal for vertical, or rotates it 1, 2, or 3 quarter turns.

       To rotate at other angles, use pnmrotate.  It is much slower, though.

       The input image is pamfile, or Standard Input if pamfile is not specified.

       To  flip/rotate a JFIF (JPEG) image losslessly, use jpegtran.  jpegtran is part of the Independent Jpeg Group's compression library package, not part of Netpbm.  The normal Netpbm way to flip a JFIF
       file would be to convert it to PNM, use pamflip, and convert back to JFIF.  But since JPEG compression is lossy, the resulting image would have less quality than  the  original.   jpegtran,  on  the
       other hand, can do this particular transformation directly on the compressed data without loss.



OPTIONS
       You must supply exactly one of the following options:

       pamflip's  predecessor  (before  Netpbm 10.7 - August 2002) pnmflip did not have the -xform option and instead allowed you to specify any number of the other options, including zero.  It applied all
       the indicated transformations, in the order given, just like with pamflip's -xform option.  (Reason for the change: this kind of interpretation of options is inconsistent with the rest of Netpbm and
       most of the Unix world, and thus hard to understand and to implement).



       -leftright

       -lr    Flip left for right.


       -topbottom

       -tb    Flip top for bottom.


       -transpose

       -xy    Transpose horizontal for vertical.  I.e. make the pixel at (x,y) be at (y,x).


       -rotate90

       -r90

       -ccw   Rotate counterclockwise 90 degrees.


       -rotate180

       -r180  Rotate 180 degrees.


       -rotate270

       -r270

       -cw    Rotate counterclockwise 270 degrees (clockwise 90 degrees)


       -null  No change.  (The purpose of this option is the convenience of programs that invoke pamflip after computing the kind of transformation desired, including none at all).

              This option was new in Netpbm 10.13 (December 2002).


       -xform=xform1,xform2...
              Apply all the transforms listed, in order.  The valid values for the transforms are as follows and have the same meanings as the identically named options above.


       ·      leftright

       ·      topbottom

       ·      transpose


              This option was new in Netpbm 10.13 (December 2002).



       The  following  options  help  pamflip use memory efficiently.  Some flipping operations on very large images can cause pamflip to have a very large working set, which means if you don't have enough
       real memory, the program can page thrash, which means it takes a ridiculous amount time to run.  If your entire image fits in real memory, you don't have a problem.  If you're just flipping top  for
       bottom  or  left for right, you don't have a problem.  Otherwise, pay attention.  If you're interested in the details of the thrashing problem and how pamflip approaches it, you're invited to read a
       complete explanation in comments in the source code.



       -memsize=mebibytes
              mebibytes is the size in mebibytes (aka megabytes) of memory available for pamflip.  It is the lesser of the amount of real or virtual memory available.

              pamflip does nothing special to allocate real memory or control it's allocation -- it gets whatever it gets just by referencing virtual memory normally.  The real memory figure in question is
              the  maximum  amount that pamflip can be expected to end up with by doing that.  This is just about impossible for you to know, of course, but you can estimate.  The total real memory in your
              system should be a major factor in your estimate.

              If pamflip cannot fit the entire image in the amount of memory you specify, it does the transformation in chunks, using temporary files for intermediate results.

              Strict horizontal transformations (either left for right or null), pamflip never keeps more than one row in memory, so the memory size is irrelevant and pamflip doesn't use temporary files.

              The real memory is important when you do a column for row type of transformation (e.g. -rotate90).  In that case, even if pamflip can fit the entire image in virtual memory  at  once,  if  it
              does not also fit in real memory, the program will thrash like crazy because of the order in which pamflip accesses the pixels, and that means it will take a ridiculously long time to run.  A
              proper -memsize drastically reduces the paging.

              If you specify -memsize too large, pamflip may attempt to get more virtual memory than the system allows it and fail.  If it can get the virtual memory, but -memsize is larger than the amount
              of real memory the system allows it and the transformation is row for column, it will page thrash and run very slowly.  A value even slightly too high is the same as infinity.

              If  you specify -memsize too small, the program will run slightly more slowly because of extra overhead in manipulating temporary files.  Also, if your environment isn't set up to make tempo-
              rary files possible, pamflip will fail.

              Doing the entire transformation 'in memory' doesn't speed things up as much as you might think, because even with the temporary files, the data is just as likely to  be  in  memory.   Virtual
              memory  gets  paged  to disk and disk files get cached in memory.  In fact, the pixels fit much more compactly into memory when stored in a temporary file than when stored 'in memory' because
              pamflip uses a more efficient format.  So you're likely to have less disk I/O when you allow pamflip less memory.

              If you do not specify -memsize, pamflip assumes infinity.

              This option did not exist before Netpbm 10.7 (August 2002).

              Before Netpbm 10.42 (March 2008), this option applied only to real memory.  pamflip would always keep the entire image in virtual memory and if it could not  get  enough  virtual  memory,  it
              failed.  pamflip accessed the pixels in an order designed to keep real memory use within the specified amount.


       -pagesize=bytes
              bytes is the size in bytes of a paging unit -- the amount of memory that gets paged in or out as an indivisible unit -- in your system.  The default is 4KiB.

              This option has no effect.

              Before Netpbm 10.42 (March 2008), pamflip used it to control its use of real memory.

              This option did not exist before Netpbm 10.7 (August 2002).



              Miscellaneous options:


       -verbose
              This option causes pamflip to issue messages to Standard Error about its progress.




SEE ALSO
       pnmrotate(1) , pnm(5) , pam(5) , jpegtran manual


HISTORY
       pamflip replaced pnmflip in Netpbm 10.13 (December 2002).  pamflip is backward compatible, but also works on PAM images.



AUTHOR
       Copyright (C) 1989 by Jef Poskanzer.



netpbm documentation                                                                           20 January 2008                                                                         Pamflip User Manual(0)
