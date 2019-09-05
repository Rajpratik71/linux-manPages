Pamchannel User Manual(0)                                                                                                                                                           Pamchannel User Manual(0)



NAME
       pamchannel - extract channels from a PAM image


SYNOPSIS
       pamchannel [-infile=infile] [-tupletype=tupletype] [channum ...]

       Minimum  unique  abbreviation  of  option  is  acceptable.  You may use double hyphens instead of single hyphen to denote options.  You may use white space in place of the equals sign to separate an
       option name from its value.


DESCRIPTION
       This program is part of Netpbm(1)

       pamchannel reads a Netpbm image as input and produces a PAM image as output, consisting of the indicated channels (planes) of the input.

       Each channum argument is the number of a channel of the input, with the first channel being zero.  The channels in the output are in the order of these arguments.

       The output is the same dimensions as the input, except that the depth is the number of channum arguments you supply.  The tuple type is a null string unless you specify the -tupletype option.

       This program works on multi-image streams, producing a corresponding output stream.  But before Netpbm 10.32 (February 2006), it ignored every image after the first.

       pamstack does the opposite of pamchannel:  It takes multiple PAM or PNM images as input and stacks their planes (channels) on top of one another to yield a single PAM.


OPTIONS
       -infile infile
              This specifies the input file, which defaults to Standard Input.  You may specify - to select Standard Input explicitly.

              This is a little unconventional for Netpbm programs, which usually have the input file specification as an argument.  For pamchannel, the arguments are channel numbers.


       -tupletype tupletype
              This specified the tuple type name to be recorded in the output.  You may use any string up to 255 characters.  Some programs recognize some names.  If you omit this option, the default tuple
              type name is null.



SEE ALSO
       pam(5)

       pamstack(1)



HISTORY
       pamchannel was new, along with the PAM format, in Netpbm 9.7 (August 2000).



netpbm documentation                                                                           10 January 2006                                                                      Pamchannel User Manual(0)
