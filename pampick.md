Pampick User Manual(0)                                                                                                                                                                 Pampick User Manual(0)



NAME
       pampick - pick images out of a multi-image Netpbm image stream


SYNOPSIS
       pampick

       image_sequence_number ...

       Minimum  unique  abbreviation  of  option  is  acceptable.  You may use double hyphens instead of single hyphen to denote options.  You may use white space in place of the equals sign to separate an
       option name from its value.



DESCRIPTION
       This program is part of Netpbm(1)

       pampick reads a PNM or PAM image stream as input.  It picks certain images from the stream and copies them to a new image stream on Standard Output.

       You identify the images to pick by sequence number within the stream.  Each image_sequence_number is a decimal sequence number, with zero meaning the first image.

       The arguments must be in increasing order, without duplicates.  The results are undefined if they are not.  (There are a number of enhancements that might be made in future releases that would  make
       whatever pampick does today when you break this rule change).  pampick outputs the images in the same order as they appear in the input.  If you specify no sequence numbers, pampick outputs nothing.
       If you specify a sequence number that is beyond what is in the input, pampick fails with an error message to that effect.

       pampick always reads the entire input stream.  (This is helpful when the input stream is a pipe and whatever is feeding the pipe would be upset if it filled up or broke).

       To see how many images, and what kind, are in a stream, use pamfile.

       To extract all the images in a stream into separate named files, use pamsplit.



SEE ALSO
       pamfile(1) , pamsplit(1) , pnm(5) , pam(5) , cat man page


HISTORY
       pampick was new in Netpbm 10.31 (December 2005);



netpbm documentation                                                                           25 October 2005                                                                         Pampick User Manual(0)
