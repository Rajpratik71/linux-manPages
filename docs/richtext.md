richtext(1)                                                                                General Commands Manual                                                                                richtext(1)



NAME
       richtext - View a richtext document, typically a mail message

SYNOPSIS
       richtext [ -c ] [ -f ] [ -m ] [ -n ] [ -o ] [ -p ] [ -s charset ] [ -t ] [ file ]

DESCRIPTION
       The  richtext program allows users to view "richtext" files on an ASCII terminal.  It uses termcap(5) capabilities to highlight text that is supposed to be bold or italic, and to underline text that
       is supposed to be underlined.  It also implements most of the richtext commands that have to do with indentation and justification, as well as the "excerpt" and "signature" commands.

       Richtext is a very simple markup language for sending rich text through the mail.  It is not to be confused with Microsoft's RTF (Rich Text Format).  It is part of the MIME standard  for  multimedia
       Internet mail.

       The richtext program takes raw richtext output on its standard input or from a file and produces formatted output on its standard output, which is assumed to be a terminal.  It is intended primarily
       for use by the metamail(1) program.

       The program will also repair the raw input to match up any richtext command pairs that are out of order.

OPTIONS
       When invoked with no options, richtext expects raw richtext on its standard input, which is corrected, and then formatted output is written on its standard output.  The following options  can  alter
       that behaviour:

       -a      This option, which is only available under DOS, toggles whether or not to use ANSI mode for highlighting bold, italic, or underlined text.

       -c      This option directs richtext to just correct the raw richtext and write the corrected version to its standard output, without performing any formatting.

       -f      This option directs richtext to use termcap-derived escape codes for bold and italic text, even if richtext is called in a pipe.

       -m      This option directs richtext to interpret '<' in multi-byte Japanese and Korean sequences as a real less-than symbol and not the start of a richtext command.  This is called the ''multi-byte
               '<' hack'' in the source code.  Primarily this is for international variants of richtext.

       -n      This option directs richtext to not do any correction to the raw richtext it receives.

       -o      This option directs richtext to use overstriking for underlining, etc., on terminals where this is the most appropriate behavior.

       -p      This enables the use of a pager which reports "Press RETURN to go on" after each screen-full of data.  Alternatively, if the environment variable MM_USEPAGER is present, then the pager  will
               also be used.  This option and the environment variable have no effect if either standard input or standard output is redirected.

       -s charset
               This  option  directs  richtext  to use the specified default character set initially when processing the text.  Legal values are us-ascii, iso-2022-jp and iso-2022-kr.  Any other value will
               default to us-ascii.

       -t      This option directs richtext NOT to use termcap-derived escape codes for bold and italic text, even if richtext is called in a terminal.  Instead, "*" and "_" will be used to  highlight  the
               affected text.

X11 Resources
       If you're using the xterm program, you can control what font is used for bold text using the "xterm*boldFont" resource.

SEE ALSO
       metamail(1), mailto(1), termcap(5)

BUGS
       This is a very quick hack, really -- an attempt to provide minimal richtext support for an ASCII terminal.  The author makes no pretense of having gotten every single case right.

COPYRIGHT
       Copyright (c) 1991 Bell Communications Research, Inc. (Bellcore)

       Permission  to  use,  copy,  modify, and distribute this material for any purpose and without fee is hereby granted, provided that the above copyright notice and this permission notice appear in all
       copies, and that the name of Bellcore not be used in advertising or publicity pertaining to this material without the specific, prior written permission of an authorized representative of  Bellcore.
       BELLCORE MAKES NO REPRESENTATIONS ABOUT THE ACCURACY OR SUITABILITY OF THIS MATERIAL FOR ANY PURPOSE.  IT IS PROVIDED "AS IS", WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES.

AUTHORS
       Nathaniel S. Borenstein
       Richtext correction algorithm and international language support by Rhys Weatherley (rhys@cs.uq.oz.au).



                                                                                                  Release 1                                                                                       richtext(1)
