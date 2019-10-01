PAPS(1)                                                                                    General Commands Manual                                                                                    PAPS(1)



NAME
       paps - UTF-8 to PostScript converter using Pango

SYNOPSIS
       paps [options] files...

DESCRIPTION
       paps reads a UTF-8 encoded file and generates a PostScript language rendering of the file. The rendering is done by creating outline curves through the pango ft2 backend.

OPTIONS
       These programs follow the usual GNU command line syntax, with long options starting with two dashes (`-').  A summary of options is included below.

       --landscape
              Landscape output. Default is portrait.

       --columns=cl
              Number of columns output. Default is 1.

       --font=desc
              Set the font description. Default is Monospace 12.

       --rtl  Do rtl layout.

       --paper ps
              Choose paper size. Known paper sizes are legal, letter, a4. Default is A4.

       --bottom-margin=bm
              Set bottom margin in postscript points (1/72 inch). Default is 36.

       --top-margin=tm
              Set top margin. Default is 36.

       --left-margin=lm
              Set left margin. Default is 36.

       --right-margin=rm
              Set right margin. Default is 36.

       --help Show summary of options.

       --header
              Draw page header for each page.

       --markup
              Interpret the text as pango markup.

       --encoding=ENCODING
              Assume the documentation encoding is ENCODING.

       --lpi  Set the lines per inch. This determines the line spacing.

       --cpi  Set the characters per inch. This is an alternative method of specifying the font size.

       --stretch-chars
              Indicates that characters should be stretched in the y-direction to fill up their vertical space. This is similar to the texttops behaviour.

AUTHOR
       paps was written by Dov Grobgeld <dov.grobgeld@gmail.com>.

       This manual page was written by Lior Kaplan <kaplan@debian.org>, for the Debian project (but may be used by others).



                                                                                               April  17, 2006                                                                                        PAPS(1)
