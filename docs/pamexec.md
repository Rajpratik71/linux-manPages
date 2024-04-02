Pamexec User Manual(0)                                                                                                                                                                 Pamexec User Manual(0)



NAME
       pamexec - Execute a shell command on each image in a Netpbm image stream


SYNOPSIS
       pamexec

       ['command']

       [netpbmfile]

       [-check]

       Minimum  unique  abbreviation  of  option  is  acceptable.  You may use double hyphens instead of single hyphen to denote options.  You may use white space in place of the equals sign to separate an
       option name from its value.



DESCRIPTION
       This program is part of Netpbm(1)

       pamexec reads a Netpbm image stream as input.  For each image, it runs a specified shell command and supplies the image to it as Standard Input (with a pipe).

       netpbmfile is the file name of the input file, or - to indicate Standard Input.  The default is Standard Input.

       Many Netpbm programs understand multimage Netpbm streams themselves, so you don't need to use pamexec to run the program on the images in the stream.  Ideally, all Netpbm programs  would  have  that
       capability,  but multi-image streams are a relatively recent invention, so older Netpbm programs just process the first image in the stream and then stop.  Even recently written Netpbm programs work
       that way, since the authors aren't aware of the multi-image possibility.

       Another way to process a multi-image stream is to use pamsplit to explode it into multiple files, one image per file.  You can then process those files.

       To run your command on a subset of the images in the stream, use pampick to select the desired images from the input stream and pipe the result to pamexec.



OPTIONS
       -check This causes pamexec to exit without processing any further images if the command has a nonzero exit status.




APPLICATIONS
       To make an animated GIF movie:

           pamexec pamtogif myvideo.ppm | gifsicle --multifile >myvideo.gif


LIMITATIONS
       pamexec assumes all commands consume all of Standard Input.  If yours doesn't (perhaps it just exits when it's seen enough), you can buffer through a temporary file like this:

           pamexec 'cat >/tmp/x; head -3 x' myvideo.ppm


HISTORY
       pamexec was new in Netpbm 10.56 (September 2011).

       Michael Pot wrote it, borrowing from pamsplit.



SEE ALSO
       pamfile(1) , pampick(1) , pampick(1) , pnm(5) , pam(5) , cat man page



netpbm documentation                                                                            11 August 2011                                                                         Pamexec User Manual(0)
