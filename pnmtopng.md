Pnmtopng User Manual(0)                                                                                                                                                               Pnmtopng User Manual(0)



NAME
       pnmtopng - convert a PNM image to PNG


SYNOPSIS
       pnmtopng [-verbose] [-downscale] [-interlace] [-alpha=file] [-transparent=[=]color] [-background=color] [-palette=palettefile] [-gamma=value] [-hist] [-text=file] [-ztxt=file] [-rgb='wx wy
         rx ry gx gy bx by'] [-size='x y unit'] [-modtime='[yy]yy-mm-dd
         hh:mm:ss']  [-nofilter]  [-sub]  [-up]  [-avg]  [-paeth]  [-compression=n]  [-comp_mem_level=n]  [-comp_strategy={huffman_only|filtered}]  [-comp_method=deflated] [-comp_window_bits=n] [-comp_buf-
       fer_size=n] [-force] [-libversion] [pnmfile]



OPTION USAGE
       Obsolete options:

       [-filter n]

       Options available only in older versions:

       [-chroma wx wy rx ry gx gy bx by] [-phys x y unit] [-time [yy]yy-mm-dd
         hh:mm:ss]

       Minimum unique abbreviation of option is acceptable.  You may use double hyphens instead of single hyphen to denote options.  You may use white space in place of  the  equals  sign  to  separate  an
       option name from its value.


DESCRIPTION
       This program is part of Netpbm(1)

       pnmtopng reads a PNM image as input and produces a PNG image as output.

       Color component values in PNG files are either eight or sixteen bits wide, so pnmtopng will automatically scale colors to have a maxval of 255 or 65535.

       For  a  grayscale image, pnmtopng produces a PNG bit depth 1, 2, 4, 8 or 16.  When the input image has a small maxval, the output PNG image has a correspondingly small bit depth.  But in mapping the
       PNM maxval to the PNG maxval (which is by definition the maximum value that can be represented in the number of bits), a fair amount of distortion happens with these low maxvals.  For example,  with
       a  PNM maxval of 5 and a PNG maxval of 7, the input sample 2 becomes the output sample 3.  The input brightness is 2/5 = .40, while the output brightness is 3/7 = .43.  Note that this is not a prob-
       lem if you view the maxval as a precision, because in .4 and .43 are identical within the precision implied by maxval 5.  Indeed, if you convert this PNG back to a maxval 5 PGM,  the  pixel's  value
       will  again  be 2, exactly as it was originally.  But if you need precisely the same colors in the output PNG as in the input PNM, make sure your input PNM has a maxval which is a power of two minus
       one.  If you can't do that, then convert it with pamdepth to something with a large maxval that is a power of two minus one (255 and 65535 are good choices) to minimize the error.



OPTIONS
       pnmtopng changed in Netpbm 10.30 (October 2005) to use the standard Netpbm command line syntax.  Before that, you could not use double hyphens to denote an option and could not use an equal sign  to
       separate an option name from its value.  And the options had to come before the non-option program arguments.

       Furthermore, the options -chroma, -phys, and -time were replaced by -rgb, -size, and -modtime, respectively.  The only difference, taking -phys/-size as an example, is that -phys takes multiple pro-
       gram arguments as the option argument, whereas -rgb takes a single program argument which is composed of multiple words.  E.g.  The old shell command

          pnmtopng -phys 800 800 0 input.pnm >output.png

       is equivalent to the new shell command

          pnmtopng -size '800 800 0' input.pnm >output.png

       If you're writing a program that needs to work with both new and old pnmtopng, have it first try with the new syntax, and if it fails with 'unrecognized option,' fall back to the old syntax.



       -verbose
                   Display the format of the output file.

       -downscale
                   Enables scaling of maxvalues of more then 65535 to 16 bit. Since
                   this means loss of image data, pnmtopng does not do it by
                   default..TP -interlace
                   Creates an interlaced PNG file (Adam7).

       -alpha=filename
               This specifies the transparency (alpha channel) of the image.  You supply the alpha channel as a standard PGM alpha mask (see the PGM(5)
               specification.  pnmtopng does not necessarily represents the transparency information as an alpha channel in the PNG format.  If it can represent the transparency information through a  pal-
              ette,  it  will  do  so in order to make a smaller PNG file.  pnmtopng even sorts the palette so it can omit the opaque colors from the transparency part of the palette and save space for the
              palette.


       -transparent=color
              pnmtopng marks the specified color as transparent in the PNG image.

              Specify the color (color) as described for the argument of the ppm_parsecolor() library routine ⟨libppm.html#colorname⟩ .  E.g. red or rgb:ff/00/0d.  If the color you specify is  not  present
              in  the image, pnmtopng selects instead the color in the image that is closest to the one you specify.  Closeness is measured as a Cartesian distance between colors in RGB space.  If multiple
              colors are equidistant, pnmtopng chooses one of them arbitrarily.

              However, if you prefix your color specification with '=', e.g.

                                  -transparent =red

               only the exact color you specify will be transparent.  If that color does not appear in the image, there will be no transparency.  pnmtopng issues an information message  when  this  is  the
              case.


       -background=color
              Causes pnmtopng to create a background color chunk in the PNG output which can be used for subsequent alpha channel or transparent color conversions.  Specify color the same as for -transpar-
              ent.


       -palette=palettefile
              This option specifies a palette to use in the PNG.  It forces pnmtopng to create the paletted (colormapped) variety of PNG -- if that isn't possible, pnmtopng fails.  If the palette you spec-
              ify  doesn't contain exactly the colors in the image, pnmtopng fails.  Since pnmtopng will automatically generate a paletted PNG, with a correct palette, when appropriate, the only reason you
              would specify the -palette option is if you care in what order the colors appear in the palette.  The PNG palette has colors in the same order as the palette you specify.

              You specify the palette by naming a PPM file that has one pixel for each color in the palette.

              Alternatively, consider the case that have a palette and you want to make sure your PNG contains only colors from the palette, approximating if necessary.  You don't care what indexes the PNG
              uses  internally  for  the  colors (i.e. the order of the PNG palette).  In this case, you don't need -palette.  Pass the Netpbm input image and your palette PPM through pnmremap.  Though you
              might think it would, using -palette in this case wouldn't even save pnmtopng any work.


       -gamma=value
              Causes pnmtopng to create a gAMA chunk.  This information helps describe how the color values in the PNG must be interpreted.  Without the gAMA chunk, whatever interprets  the  PNG  must  get
              this  information  separately  (or  just  assume something standard).  If your input is a true PPM or PGM image, you should specify -gamma=.45.  But sometimes people generate images which are
              ostensibly PPM except the image uses a different gamma transfer function than the one specified for PPM.  A common case of this is when the image is created by simple  hardware  that  doesn't
              have digital computational ability.  Also, some simple programs that generate images from scratch do it with a gamma transfer in which the gamma value is 1.0.


       -hist  Use this parameter to create a chunk that specifies the frequency (or histogram) of the colors in the image.


       -rgb=chroma_list
              This  option  specifies  how  red, green, and blue component values of a pixel specify a particular color, by telling the chromaticities of those 3 primary illuminants and of white (i.e. full
              strength of all three).

              The chroma_list value is a blank-separated list of 8 floating point decimal numbers.  The CIE-1931 X and Y chromaticities (in that order) of each of white,  red,  green,  and  blue,  in  that
              order.

              This information goes into the PNG's cHRM chunk.

              In a shell command, make sure you use quotation marks so that the blanks in chroma_list don't make the shell see multiple command arguments.

              This option was new in Netpbm 10.30 (October 2005).  Before that, the option -chroma does the same thing, but with slightly different syntax.


       -size='x y unit'
              This option determines the aspect ratio of the individual pixels of your image as well as the physical resolution of it.

              unit  is  either 0 or 1.  When it is 1, the option specifies the physical resolution of the image in pixels per meter.  For example, -size='10000 15000 1' means that when someone displays the
              image, he should make it so that 10,000 pixels horizontally occupy 1 meter and 15,000 pixels vertically occupy one meter.  And even if he doesn't take this advice on the overall size  of  the
              displayed image, he should at least make it so that each pixel displays as 1.5 times as high as wide.

              When unit is 0, that means there is no advice on the absolute physical resolution; just on the ratio of horizontal to vertical physical resolution.

              This information goes into the PNG's pHYS chunk.

              When you don't specify -size, pnmtopng creates the image with no pHYS chunk, which means square pixels of no absolute resolution.

              This option was new in Netpbm 10.30 (October 2005).  Before that, the option -phys does the same thing, but with slightly different syntax.


       -text=filename
              This option lets you include comments in the text chunk of the PNG output.  file is the name of a file that contains your text comments.

              Here is an example of a comment file:
                         Title           PNG file

                         Author          Bryan Henderson

                         Description     how to include a text chunk
                                         PNG file
                         "Creation date" 3-feb-1987

                         Software        pnmtopng

              The  format  of  the  file is as follows:  The file is divided into lines, delimited by newline characters.  The last line need not end with a newline character.  A group of consecutive lines
              represents a comment.

              A "delimiter character" is a blank or tab or null character.  The first line representing a comment must not start with a delimiter character.  Every other line in the group is  a  "continua-
              tion line" and must start with a delimiter character.

              The  first  line  representing a comment consists of a keyword and the first line of comment text.  The keyword begins in Column 1 of the file line and continues up to, but not including, the
              first delimiter character, or the end of the line, whichever is first.  Exception: you can enclose the keyword in double quotes and spaces and tabs within the double quotes are  part  of  the
              keyword.  The quotes are not part of the keyword.  A NUL character is not allowed in a keyword.

              The  first  line  of the comment text is all the text in the file line beginning after the keyword and any delimiter characters after it.  immediately after the delimiter character that marks
              the end of the keyword.

              A continuation line defines a subsequent line of the comment.  The comment line is all the text on the continuation line starting with the first non-delimiter character.

              There is one newline character between every two comment lines.  There is no newline character after the last line of comment text.

              There is no limit on the length of a file line or keyword or comment text line or comment text.  There is no limit on the number of comments or size of or number of lines in the file.


       -ztxt=filename
              The same as -text, except pnmtopng considers the text compressed.


       -modtime='[yy]yy-mm-dd hh:mm:ss'
              This option allows you to specify the modification time value to be placed in the PNG output.  You can specify the year parameter either as a two digit or four digit value.

              This option was new in Netpbm 10.30 (October 2005).  Before that, the option -time does the same thing, but with slightly different syntax.


       -filter=n
              This option is obsolete.  Before Netpbm 10.22 (April 2004), this was the only way to specify a row filter.  It specifies a single type of row filter, by number, that pnmtopng must use on each
              row.

              Use -nofilter, -sub, -up, -avg, and -paeth in current Netpbm.


       -nofilter

       -sub

       -up

       -avg

       -paeth Each of these options permits pnmtopng to use one type of row filter.  pnmtopng chooses whichever of the permitted filters it finds to be optimal.  If you specify none of these options, it is
              the same as specifying all of them -- pnmtopng uses any row filter type it finds optimal.

              These options were new with Netpbm 10.22 (April 2004).  Before that, you could use the -filter option to specify one permitted row filter type.   The  default,  when  you  specify  no  filter
              options, was the same.


       -compression=n
              This option sets set the compression level of the zlib compression.  Select a level from 0 for no compression (maximum speed) to 9 for maximum compression (minimum speed).

              The default is the default of the zlib library.


       -comp_mem_level=n
              This option sets the memory usage level of the zlib compression.  Select a level from 1 for minimum memory usage (and minimum speed) to 9 for maximum memory usage (and speed).

              The default is the default of the zlib library.

              This option was new in Netpbm 10.30 (October 2005).


       -comp_strategy={huffman_only|filtered}
              This options sets the compression strategy of the zlib compression.  See Zlib documentation for information on what these strategies are.

              The default is the default of the zlib library.

              This option was new in Netpbm 10.30 (October 2005).


       -comp_method=deflated
              This option does nothing.  It is here for mathematical completeness and for possible forward compatibility.  It theoretically selects the compression method of the zlib compression, but the Z
              library knows only one method today, so there's nothing to choose.

              The default is the default of the zlib library.

              This option was new in Netpbm 10.30 (October 2005).


       -comp_window_bits=N
              This option tells how big a window the zlib compression algorithm uses.  The value is the base 2 logarithm of the window size in bytes, so 8 means 256 bytes.  The value must be from 8  to  15
              (i.e. 256 bytes to 32K).

              See Zlib documentation for details on what this window size is.

              The default is the default of the zlib library.

              This option was new in Netpbm 10.30 (October 2005).


       -comp_buffer_size=N
              This  option determines in what size pieces pnmtopng does the zlib compression.  One compressed piece goes in each IDAT chunk in the PNG.  So the bigger this value, the fewer IDAT chunks your
              PNG will have.  Theoretically, this makes the PNG smaller because 1) you have less per-IDAT-chunk overhead, and 2) the compression algorithm has more data to work with.  But in  reality,  the
              difference will probably not be noticeable above about 8K, which is the default.

              The value n is the size of the compressed piece (i.e. the compression buffer) in bytes.

              This option was new in Netpbm 10.30 (October 2005).



       -force When  you  specify  this, pnmtopng limits its optimizations.  The resulting PNG output is as similar to the Netpbm input as possible.  For example, the PNG output will not be paletted and the
              alpha channel will be represented as a full alpha channel even if the information could be represented more succinctly with a transparency chunk.



       -libversion
              This option causes pnmtopng to display version information about itself and the libraries it uses, in addition to all its normal function.  Do not confuse this with the Netpbm  common  option
              -version, which causes the program to display version information about the Netpbm library and do nothing else.

              You can't really use this option in a program that invokes pnmtopng and needs to know which version it is.  Its function has changed too much over the history of pnmtopng.  The option is good
              only for human eyes.




SEE ALSO
       pngtopam(1) , pamrgbatopng(1) , pnmremap(1) , pnmgamma(1) , pnm(5)


       For information on the PNG format, see http://schaik.com/png ⟨http://schaik.com/png⟩ .


AUTHOR
       Copyright (C) 1995-1997 by Alexander Lehmann and Willem van Schaik.



netpbm documentation                                                                              July 2008                                                                           Pnmtopng User Manual(0)
