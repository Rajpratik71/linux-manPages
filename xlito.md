XLITO(1)                                                                                   General Commands Manual                                                                                   XLITO(1)



NAME
       xlito (XLoadImageTrailingOptions) - Append/Delete/Show a Trailing Option string in a file.

SYNOPSIS
       xlito [option] [string] files ...

DESCRIPTION
       xlito  (XLoadImageTrailingOptions)  is a utility that provides a file format independent way of marking image files with the appropriate options to display correctly.  It does this by appending to a
       file, a string specified by the user. The string is marked with some magic numbers so that it can be extracted by a program that knows what to look for. Since almost all image files have  some  sort
       of  image  dimension information in the file, the programs that load or manipulate these files generally do not look beyond the point at which they have read the complete image, so trailing informa-
       tion is safely be hidden. If appending this information causes trouble with other utilities, it can simply be deleted.

       Appropriate version of xloadimage (ie. xli 1.00) will recognise these trailing options at the end of the image files, and will treat the embedded string as if it were  a  sequence  of  command  line
       Image Options.  Any Global Options will be ignored, and unlike command line image Options, Trailing Options are never propagated to other images.

       Old versions of xloadimage (3.01 or less) can be made forward compatible by using the -x option to pull the trailing options out of the image files, and put them on the command line where xloadimage
       can see them.

OPTIONS
       The default behavior is to display the trailing option strings (if any) of the files on the argument line.  The following options change the behavior of xlito:

       -c option_string file_name ...
               This adds or changes the embedded string to option_string.  The string will have to be quoted if it is composed of more than one word.

       -d file_name ...
               Delete any embedded trailing option strings in the given files.

       -x file_name ...
               Process the files and create a command line string suitable for use by xloadimage. Arguments starting with - are echoed, arguments not starting with - are treated as files and  any  trailing
               options strings are echoed followed by the file name. The xloadimage option -name is treated correctly.

EXAMPLES
       If fred.gif has the wrong aspect ratio, then it might need viewing with the xloadimage options:

            xloadimage -yzoom 130 fred.gif

       This option can then be appended to the file by:

            xlito -c "-yzoom 130" fred.gif

       and from then on some new versions of xloadimage will get the appropriate options from the image file itself. Old versions of xloadimage can be made to work by using:

            xloadimage `xlito -x fred.gif`

       This can be made transparent by using a script containing something like:

            xloadimage `xlito -x $∗`

       The script could be called xli for instance.

       The options can be deleted with:

            xlito -d fred.gif

AUTHOR
       Graeme Gill
       Labtam Australia
       graeme@labtam.oz.au

MAINTAINER
       smar@reptiles.org

COMPATIBILITY WITH IMAGE FILES
       Some  image  files  are actually ascii files that are used in other contexts.  X Bitmap files are an example. They are formatted as 'C' style #defines and an initialised array of characters, so that
       they can be included in 'C' source code.  Adding trailing options would therefore render the file unusable with a compiler, since it will get a syntax error on the  railing  option  string  and  the
       magic numbers. The solution to this is that xlito will ignore a certain amount (a few hundred bytes) after the trailing options, and uses a padding of 20 bytes before the trailing options. These two
       areas will be maintained when changing an existing trailing option. In the case of an X bitmap then, the solution is to edit the file and place the embedded string in some 'C' comments:

       eg: say the file starts as:
       #define tt_width 4
       #define tt_height 4
       static char tt_bits[] = {
          0x08, 0x02, 0x04, 0x01};

       and you add a trailing options:
       #define tt_width 4
       #define tt_height 4
       static char tt_bits[] = {
          0x08, 0x02, 0x04, 0x01};
       01234567890123456789XXX xloadimage trailing options XXX0007"-smooth"0007XXX
       xloadimage trailing options XXX

       Then the trailing options can be commented out:
       #define tt_width 4
       #define tt_height 4
       static char tt_bits[] = {
          0x08, 0x02, 0x04, 0x01};
       /∗234567890123456789XXX xloadimage trailing options XXX0007"-smooth"0007XXX
       xloadimage trailing options XXX ∗/

BUGS
       xlito doesn't cope with compressed files. A files will need uncompressing, the options added, and then compressing again.





                                                                                                  7 Jul 1993                                                                                         XLITO(1)
