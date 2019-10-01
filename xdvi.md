XDVI(1)                                                                                    General Commands Manual                                                                                    XDVI(1)



NAME
       xdvi - DVI Previewer for the X Window System

SYNOPSIS
       xdvi  [+[page]]  [--help] [-allowshell] [-altfont font] [-bg color] [-browser WWWbrowser] [-copy] [-cr color] [-debug bitmask|string[,string ...]]  [-display host:display] [-dvipspath path] [-editor
       command] [-expert] [-expertmode flag] [-fg color] [-findstring string] [-text-encoding encoding] [-font font] [-fullscreen ] [-gamma g] [-geometry  geometry]  [-gsalpha]  [-gspalette  palette]  [-h]
       [-help]  [-hl color] [-anchorposition anchor] [-hush] [-hushchars] [-hushchecksums] [-warnpecials] [-hushstdout] [-hushbell] [-icongeometry geometry] [-iconic] [-install] [-interpreter path] [-keep]
       [-l] [-license] [-linkcolor color] [-linkstyle 0|1|2|3] [-margins dimen] [-mfmode mode-def[:dpi]] [-mgs[n] size] [-mousemode  0|1|2]  [-nocolor]  [-nofork]  [-noghostscript]  [-nogrey]  [-nogssafer]
       [-noinstall]  [-nomakepk]  [-nomatchinverted] [-noomega] [-noscan] [-not1lib] [-notempfile] [-offsets dimen] [-p pixels] [-paper papertype] [-pause] [-pausespecial special-string] [-postscript flag]
       [-rulecolor color] [-rv] [-S  density]  [-s  shrink]  [-safer]  [-sidemargin  dimen]  [-sourceposition  line[:col][ ]filename]  [-statusline]  [-thorough]  [-topmargin  dimen]  [-unique]  [-version]
       [-visitedlinkcolor color] [-warnspecials] [-watchfile secs] [-wheelunit pixels] [-xoffset dimen] [-yoffset dimen] [dvi_file]

DESCRIPTION
       Xdvi is a program for previewing dvi files, as produced e.g. by the tex(1) program, under the X window system.

       Xdvi  can  show the file shrunken by various integer factors, and it has a ``magnifying glass'' for viewing parts of the page enlarged (see the section MAGNIFIER below). This version of xdvi is also
       referred to as xdvik since it uses the kpathsea library to locate and generate font files.  In addition to that, it supports the following features:

         - hyperlinks in DVI files (section HYPERLINKS),

         - direct rendering of Postscript<tm> Type1 fonts (section T1LIB),

         - source specials in the DVI file (section SOURCE SPECIALS),

         - string search in DVI files (section STRING SEARCH),

         - saving or printing (parts of) the DVI file (sections PRINT DIALOG and SAVE DIALOG).

       Xdvi can be compiled with the Motif toolkit or the Xaw (Athena) toolkit (and variants of it), and the Motif version has a slightly different GUI; these differences are noted below.

       Before displaying a page of a DVI file, xdvi will check to see if the file has changed since the last time it was displayed.  If this is the case, it will reload the file.  This feature  allows  you
       to  preview many versions of the same file while running xdvi only once. Since it cannot read partial DVI files, xdvik versions starting from 22.74.3 will create a temporary copy of the DVI file be‐
       ing viewed, to ensure that the file can be viewed without interruptions. (The -notempfile can be used to turn off this feature).

       Xdvi can show PostScript<tm> specials by any of three methods.  It will try first to use Display PostScript<tm>, then NeWS, then it will try to use Ghostscript to render the images.   All  of  these
       options depend on additional software to work properly; moreover, some of them may not be compiled into this copy of xdvi.

       For performance reasons, xdvi does not render PostScript specials in the magnifying glass.

       If  no file name has been specified on the command line, xdvi will try to open the most recently opened file; if the file history (accessible via the File > Open Recent menu) is empty, or if none of
       the files in the history are valid DVI files, it will pop up a file selector for choosing a file name.  (In previous versions, which didn't have a file history, the file selector  was  always  used;
       you can set the X resource noFileArgUseHistory to false to get back the old behaviour.)

OPTIONS
       In  addition  to  specifying the dvi file (with or without the .dvi extension), xdvi supports the following command line options.  If the option begins with a `+' instead of a `-', the option is re‐
       stored to its default value.  By default, these options can be set via the resource names given in parentheses in the description of each option.

       +page  Specifies the first page to show.  If + is given without a number, the last page is assumed; the first page is the default.

       -allowshell
              (.allowShell) This option enables the shell escape in PostScript specials.  (For security reasons, shell escapes are disabled by default.)  This option should be rarely used; in particular it
              should not be used just to uncompress files: that function is done automatically if the file name ends in .Z, .gz, or .bz2.  Shell escapes are always turned off if the -safer option is used.

       -altfont font
              (.altFont) Declares a default font to use when the font in the dvi file cannot be found.  This is useful, for example, with PostScript <tm> fonts.

       -background color
              (.background) Determines the color of the background.  Same as -bg.

       -bg color
              (.background) Determines the color of the background.

       -browser browser
              (.wwwBrowser)  Defines  the  web  browser used for handling external URLs. The value of this option or resource has the same syntax as the BROWSER environment variable; see the explanation of
              that variable in the section `ENVIRONMENT' below for a detailed description.  If neither the option nor the X resource wwwBrowser is specified, the environment variables BROWSER and WWWBROWS‐
              ER  (in  that  order)  are  used  to  determine  the  browser  command.  If  these  are  not  set  either, the following default value is used: xdg-open %s:htmlview %s:firefox -remote -remote
              "openURL(%s,new-window)":mozilla -remote "openURL(%s,new-window)":netscape -raise -remote "openURL(%s,new-window)":xterm -e w3m %s:xterm -e lynx %s:xterm -e wget %s

       -copy  (.copy) Always use the copy operation when writing characters to the display.  This option may be necessary for correct operation on a color display, but overstrike characters will be  incor‐
              rect.  If greyscale anti-aliasing is in use, the -copy operation will disable the use of colorplanes and make overstrikes come out incorrectly.  See also -thorough.

       -cr color
              (.cursorColor) Determines the color of the mouse cursor.  The default is the same as the foreground color.

       -debug bitmask|string[,string ...]
              (.debugLevel) If nonzero, prints additional information on standard output.  The argument can be either a bitmask specified as a decimal number, or comma-separated list of strings.
              For  the bitmask representation, multiple values can be specified by adding the numbers that represent the individual bits; e.g. to debug all all file searching and opening commands, use 4032
              (= 2048 + 1024 + 512 + 256 + 128 + 64). Use -1 to turn on debugging of everything (this will produce huge output).
              For the string representation, use the strings listed in the following table, with a comma to separate the values; e.g. to debug all  file  searching  and  opening  commands,  use  search,ex‐
              pand,paths,hash,stat,open.   (The option `kpathsea' is provided as a shorthand for these.)  Note that such a list may need to be quoted to prevent the shell from interpreting commas or spaces
              in the list.
              The individual numbers and strings have the following meanings:

               1       bitmap      Bitmap creation
               2       dvi         DVI translation
               4       pk          PK fonts
               8       batch       Batch mode: Exit after
                                   reading the DVI file
               16      event       Event handling
               32      ps          PostScript interpreter calls
               64      stat        Kpathsea stat(2) calls
               128     hash        Kpathsea hash table lookups
               256     open        Kpathsea file opening
               512     paths       Kpathsea path definitions
               1024    expand      Kpathsea path expansion
               2048    search      Kpathsea searching
               4032    kpathsea    All Kpathsea options
               4096    htex        Hypertex specials
               8192    src         Source specials
               16384   client      Client/server mode (see -unique
                                   and -sourceposition options)
               32768   t1          Type1 font library messages
               65536   t1_verbose  Verbose Type1 library messages
               131072  gui         GUI elements

              Some of the Kpathsea debugging options are actually provided by Kpathsea; see the Debugging section in the Kpathsea manual for more information on these.

       -density density
              (.densityPercent) Determines the density used when shrinking bitmaps for fonts.  A higher value produces a lighter font.  The default value is 40.  If greyscaling is  in  use,  this  argument
              does not apply; use -gamma instead.  See also the `S' keystroke.  Same as -S.

       -display host:display
              Specifies the host and screen to be used for displaying the dvi file.  By default this is obtained from the environment variable DISPLAY.

       -dvipspath path
              (.dvipsPath)  Use path as the dvips program to use when printing.  The default for this is dvips.  The program or script should read the DVI file from standard input, and write the Postscript
              file to standard output.

       -editor editor
              (.editor) Specifies the editor that will be invoked when the source-special() action is triggered to start a reverse search (by default via Ctrl-Mouse 1).  The argument to this  option  is  a
              format  string  in which occurrences of ``%f'' are replaced by the file name, occurrences of ``%l'' are replaced by the line number within the file, and optional occurrences of ``%c'' are re‐
              placed by the column number within the line.

              If neither the option nor the X resource .editor is specified, the following environment variables are checked to determine the editor command: XEDITOR, VISUAL, and EDITOR (in this sequence).
              If the string is found as the value of the VISUAL or EDITOR environment variables, then ``xterm -e '' is prepended to the string; if the editor is specified by other means, then it must be in
              the form of a shell command to pop up an X window with an editor in it. If none of these variables is set, a warning message is displayed and the command ``xterm -e vi +%l %f'' is used.

              If no ``%f'' or ``%l'' occurs in the string, the missing format strings are appended automatically.  (This is for compatibility with other programs when using one  of  the  environment  vari‐
              ables).

              A  new  instance  of the editor is started each time this command is used; therefore it is preferable to use an editor that can be invoked in `client' mode to load new files into the same in‐
              stance. Example settings are:

              emacsclient --no-wait
                     (older Emacsen)

              gnuclient -q
                     (XEmacs and newer Emacsen)

              gvim --servername xdvi --remote
                     (VIM v6.0+; the `--servername xdvi' option will cause gvim to run a dedicated instance for the files opened by xdvi.)

              nc     (nedit)

              Note that those strings need to be enclosed into quotes when using them on the command-line to protect them from the shell; when using them as argument for the .editor resource in  an  X  re‐
              source file, no quotes should be used.

              NOTE ON SECURITY: The argument of this option isn't executed as a shell command, but via exec() to prevent evil tricks with the contents of source specials.

       -expert
              This option is only supported for backwards compatibility; it is equivalent to -expertmode 0, which should be preferred.

       -expertmode flag
              (.expertMode)  With  an argument of 0, this option switches off the display of the buttons, scrollbars, the toolbar (Motif only), the statusline and the page list. These GUI elements can also
              be (de)activated separately, by combining the appropriate values in the flag argument. This acts similar to the -debug option: The integer flag is treated as a bitmap where  each  bit  repre‐
              sents one element. If the bit has the value 1, the element is switched on, if it has the value 0, the element is switched off. The meaning of the bits is as follows:

               1       statusline
               2       scrollbars
               4       Motif: pagelist, Xaw: buttons and pagelist
               8       toolbar (Motif only)
               16      menubar (Motif only)

              For  example, to turn on only the statusline and the scrollbars, use 3 (= 1 + 2).  See also the `x' keystroke, where the bits are addressed by their positions, from 1 to 3 (Xaw) or 5 (Motif),
              respectively.

       If the statusline is not active, all messages that would normally be printed to the statusline will be printed to stdout, unless the -hushstdout option is used.

       -fg color
              (.foreground) Determines the color of the text (foreground).

       -text-encoding encoding
              (.textEncoding) Use encoding as text encoding of the string in the "Find" window. Usually, this shouldn't be needed since the encoding is determined from the locale settings.

       -findstring string
              This option triggers a search for string in the DVI file mentioned on the command-line, similar to forward search (see the description of the sourceposition option): If there is  already  an‐
              other instance of xdvi running on the displaying that DVI file, it will cause that instance to perform the search instead. The search starts at the top of the current page of the DVI file.

       -font font
              (*font) Sets the font used in menus, buttons etc., as described in the X(7x) man page. The font for child windows can be set separately, e.g.:

              xdvi*statusline*font: \
                 -*-helvetica-medium-r-*-*-12-*-*-*-*-*-*-*


       -foreground color
              Same as -fg.

       -fullscreen
              When  this option is used, xdvi will (try to) run in fullscreen mode, with no window decorations.  This option is not guaranteed to work with all windowmanagers/desktops; if you're experienc‐
              ing problems with it, please use the -geometry option instead, and a suitable window manager setting to remove the window decorations.  When using this option  for  presentations,  you  might
              want to get rid of all the control widgets as well, using the -expertmode option. This option can also be toggled at runtime using the fullscreen action (by default bound to Ctrl-l).

       -gamma gamma
              (.gamma)  Controls  the  interpolation of colors in the greyscale anti-aliasing color palette.  Default value is 1.0.  For 0 < gamma < 1, the fonts will be lighter (more like the background),
              and for gamma > 1, the fonts will be darker (more like the foreground).  Negative values behave the same way, but use a slightly different algorithm.  For color and  grayscale  displays;  for
              monochrome, see -density.  See also the `S' keystroke.

       -geometry geometry
              (.geometry) Specifies the initial geometry of the main window, as described in the X(7x) man page. The geometry of child windows can be set separately, e.g.:
              xdvi*helpwindow.geometry: 600x800

       -gsalpha
              (.gsAlpha)  Causes  Ghostscript to be called with the x11alpha driver instead of the x11 driver.  The x11alpha driver enables anti-aliasing in PostScript specials, for a nicer appearance.  It
              is available on newer versions of Ghostscript.  This option can also be toggled with the `V' keystroke.

       -gspalette palette
              (.palette) Specifies the palette to be used when using Ghostscript for rendering PostScript specials.  Possible values are Color, Greyscale, and Monochrome.  The default is Color.

       -h, -help, --help
              Prints a short help text with an overview of the command-line options to standard output.

       -hl color
              (.highlight) Determines the color of the page border, of the ruler in `ruler mode', and of the highlighting markers in forward search and string search.  The default is the foreground color.

       -anchorposition anchor
              Jump to anchor after opening the DVI file. This is only useful when invoking xdvi from other applications.

       -hush  (.Hush) Causes xdvi to suppress all suppressible warnings.

       -hushchars
              (.hushLostChars) Causes xdvi to suppress warnings about references to characters which are not defined in the font.

       -hushchecksums
              (.hushChecksums) Causes xdvi to suppress warnings about checksum mismatches between the dvi file and the font file.

       -hushstdout
              (.hushStdout) Suppresses printing of status messages to stdout.  Note that errors or warnings will still be printed to stderr even if this option is used.

       -hushbell
              (.hushBell) Don't sound the X bell when an error occurs.

       -icongeometry geometry
              (.iconGeometry) Specifies the initial position for the icon.

       -iconic
              (.iconic) Causes the xdvi window to start in the iconic state.  The default is to start with the window open.

       -install
              (.install) If xdvi is running under a PseudoColor visual, then (by default) it will check for TrueColor visuals with more bits per pixel, and switch to such a visual if  one  exists.   If  no
              such  visual exists, it will use the current visual and colormap.  If -install is selected, however, it will still use a TrueColor visual with a greater depth, if one is available; otherwise,
              it will install its own colormap on the current visual.  If the current visual is not PseudoColor, then xdvi will not switch the visual or colormap, regardless of its  options.   The  default
              value of the install resource is the special value, maybe.  There is no +install option.  See also -noinstall, and the GREYSCALING AND COLORMAPS section.

       -interpreter filename
              (.interpreter) Use filename as the Ghostscript interpreter.  By default it uses gs.

       -keep  (.keepPosition)  Sets  a flag to indicate that xdvi should not move to the home position when moving to a new page.  See also the `k' keystroke. This flag is honored by all page switching ac‐
              tions and by up-or-previous() / down-or-next(), although the latter only honor the horizontal postion, not the vertical one.  This allows for a "continuous" scrolling back an forth through  a
              document with a display window narrower than a page width.

       -l     (.listFonts) List the names of all fonts used.

       -license
              Prints licensing information.

       -linkcolor
              (.linkColor)  Color used for unvisited hyperlinks (`Blue2' by default). Hyperlinks are unvisited before you click on them, or after the DVI file has been reloaded.  The value should be either
              a valid X color name (such as DarkGoldenrod4) or a hexadecimal color string (such as #8b6508).  See also -visitedlinkcolor and -linkstyle.

       -linkstyle
              (.LinkStyle) Determines the style in which hyperlinks are displayed. Possible values and their meanings are:

               0       No highlighting of links
               1       Underline links with link color
               2       No underlining, color text with link color
               3       Underline and display text colored with
                       link color

              The values for link color are specified by the options/resources -linkcolor and -visitedlinkcolor (which see).

       -margins dimen
              (.Margin) Specifies the size of both the top margin and side margin.  This determines the ``home'' position of the page within the window as follows.  If the entire page fits in  the  window,
              then  the  margin settings are ignored.  If, even after removing the margins from the left, right, top, and bottom, the page still cannot fit in the window, then the page is put in the window
              such that the top and left margins are hidden, and presumably the upper left-hand corner of the text on the page will be in the upper left-hand corner of the window.  Otherwise, the  text  is
              centered in the window.  The dimension should be a decimal number optionally followed by any of the two-letter abbreviations for units accepted by TeX (pt, pc, in, bp, cm, mm, dd, cc, or sp).
              By default, the unit will be cm (centimeters).  See also -sidemargin, -topmargin, and the keystroke `M.'

       -mfmode mode-def
              (.mfMode) Specifies a mode-def string, which can be used in searching for fonts (see ENVIRONMENT, below).  Generally, when changing the mode-def, it is also necessary to change the font  size
              to  the  appropriate  value  for that mode.  This is done by adding a colon and the value in dots per inch; for example, -mfmode ljfour:600.  This method overrides any value given by the pix‐
              elsPerInch resource or the -p command-line argument.  The metafont mode is also passed to metafont during automatic creation of fonts.  By default, it is unspecified.

       -mgs size
              Same as -mgs1.

       -mgs[n] size
              (.magnifierSize[n]) Specifies the size of the window to be used for the ``magnifying glass'' for Button n.  The size may be given as an integer (indicating that the magnifying glass is to  be
              square), or it may be given in the form widthxheight.  See the MOUSE ACTIONS section.  Defaults are 200x150, 400x250, 700x500, 1000x800, and 1200x1200.

       -mousemode [0|1|2]
              (.mouseMode) Specifies the default mode of xdvi at startup: Magnifier (0), Text Selection Mode (1) or Ruler Mode (2). See the section MODES, below, for more information.

       -nocolor
              (.color) Turns off the use of color specials.  This option can be toggled with the `C' keystroke.  (Note: -nocolor corresponds to color:off; +nocolor to color:on.)

       -nofork
              (.fork)  With  the  -sourceposition and -unique options, the default behavior is for xdvi to put itself into the background (like a daemon) if there is no appropriate instance of xdvi already
              running.  This argument makes it run in the foreground instead.  This is useful for debugging, or if your client application cannot deal well with a program self-backgrounding itself in  this
              way  -- e.g., the IPC functions in emacs are known to have problems with this.  If no -sourceposition or -unique argument is given, then this option has no effect.  (Note: -nofork corresponds
              to fork:off; +nofork to fork:on.)

       -noghostscript
              (.ghostscript) Inhibits the use of Ghostscript for displaying PostScript<tm> specials.  (Note: -noghostscript corresponds to ghostscript:off; +noghostscript to ghostscript:on.)

       -nogrey
              (.grey) Turns off the use of greyscale anti-aliasing when printing shrunken bitmaps.  (Note: -nogrey corresponds to grey:off; +nogrey to grey:on.)  See also the `G' keystroke.

       -nogssafer
              (.gsSafer) Normally, if Ghostscript is used to render PostScript specials, the Ghostscript interpreter is run with the option -dSAFER.  The -nogssafer option runs Ghostscript without -dSAFER.
              The  -dSAFER  option in Ghostscript disables PostScript operators such as deletefile, to prevent possibly malicious PostScript programs from having any effect.  If the -safer option is speci‐
              fied, then this option has no effect; in that case Ghostscript is always run with -dSAFER.  (Note: -nogssafer corresponds to gsSafer:off; +nogssafer to gsSafer:on.)

       -noinstall
              (.install) Inhibit the default behavior of switching to a TrueColor visual if one is available with more bits per pixel than the current visual.  (Note:  -noinstall  corresponds  install:off;
              there is no +noinstall option.)  See also -install, and the GREYSCALING AND COLORMAPS section.

       -nomakepk
              (.makePk) Turns off automatic generation of font files that cannot be found by other means.  (Note: -nomakepk corresponds to makePk:off; +nomakepk to makePK:on.)

       -nomatchinverted
              (.matchInverted) Don't highlight string search matches in inverted color; instead, draw a rectangle in highlight color (see the -hl option) around the match. This option is activated automat‐
              ically if the display isn't running in TrueColor.  (Note: -nomatchinverted corresponds to matchInverted:off; +nomatchinverted to matchInverted:on.)

       -noomega
              (.omega) This will disable the use of Omega extensions when interpreting DVI files.  By default, the additional opcodes 129 and 134 are recognized by xdvi as Omega extensions and  interpreted
              as  requests to set 2-byte characters. The only drawback is that the virtual font array will require 65536 positions instead of the default 256 positions, i.e. the memory requirements of xdvi
              will be slightly larger. If you find this unacceptable or encounter another problem with the Omega extensions, you can switch this extension off by using -noomega (but please do  send  a  bug
              report if you find such problems - see the bug address in the AUTHORS section below).
              (Note: -noomega corresponds to omega: off; +noomega to omega: on.)

       -noscan
              (.prescan)  By default, xdvi does a preliminary scan of the dvi file to process any papersize specials; this is especially important at startup since the paper size may be needed to determine
              the window size.  If PostScript<tm> is in use, then prescanning is also necessary in order to properly process header files.  In addition, prescanning is needed  to  correctly  determine  the
              background  color  of  a  page.   This  option  turns off such prescanning.  (Prescanning will be automatically be turned back on if xdvi detects any of the specials mentioned above.)  (Note:
              -noscan corresponds to prescan:off; +noscan to prescan:on.)

       -not1lib
              (.t1lib) This will disable the use of T1Lib to display PostScript<tm> fonts.  Use this option as a workaround when you encounter problems with the display of T1Lib (but please don't forget to
              send a bug report in this case, to the URL mentioned in the section AUTHORS below).
              (Note: -not1lib corresponds to t1lib:off; +not1lib to t1lib:on.)

       -notempfile
              (.tempFile)  As  mentioned  in  the  section DESCRIPTION above, xdvi will create a temporary copy of the DVI file so that it can be accessed without interruptions even while the file is being
              rewritten by TeX.  Since this introduces the overhead of copying the file every time it has changed, the -notempfile allows you to turn off this behaviour. In this case, exposing parts of the
              window while the DVI file is being written by TeX will erase the current window contents until the DVI file can be completely reread.
              (Note: -notempfile corresponds to tempFile:off; +notempfile to tempFile:on.)

       -offsets dimen
              (.Offset)  Specifies  the size of both the horizontal and vertical offsets of the output on the page.  By decree of the Stanford TeX Project, the default TeX page origin is always 1 inch over
              and down from the top-left page corner, even when non-American paper sizes are used.  Therefore, the default offsets are 1.0 inch.  The argument dimen should be a  decimal  number  optionally
              followed  by  any  of  the  two-letter  abbreviations for units accepted by TeX (pt, pc, in, bp, cm, mm, dd, cc, or sp).  By default, the unit will be cm (centimeters).  See also -xoffset and
              -yoffset.

       -p pixels
              (.pixelsPerInch) Defines the size of the fonts to use, in pixels per inch.  The default value is 600.  This option is provided only for backwards compatibility; the preferred  way is  to  set
              both the resolution and the Metafont mode via the -mfmode option (which see).

       -paper papertype
              (.paper) Specifies the size of the printed page. Note that in most cases it's best to specify the paper size in the TeX input file via the line

              \usepackage[dvips]{geometry}

              which will be recognized by both dvips and xdvi; in that case the use of a `-paper' option should be unnecessary.
              The  paper size may be specified in the form widthxheight optionally followed by a unit, where width and height are decimal numbers giving the width and height of the paper, respectively, and
              the unit is any of the two-letter abbreviations for units accepted by TeX (pt, pc, in, bp, cm, mm, dd, cc, or sp).  By default, the unit is cm (centimeters).
              There are also synonyms which may be used: us (8.5x11in), legal (8.5x14in), foolscap (13.5x17in), as well as the ISO sizes a1-a7, b1-b7, c1-c7.  Each of these also has a landscape or  `rotat‐
              ed'  variant:  usr  (11x8.5in),  a1r-a7r, etc. For compatibility with dvips, the formats letter (8.5x11in), ledger (17x11in) and tabloid (11x17in) are also supported (these don't have rotated
              variants).
              Any of the above sizes may be preceded by a plus sign (`+'); this causes the paper size given here to override any paper size given in the dvi file.  The default paper size is 21  x  29.7  cm
              (A4 size).

       -pause (.pause)  This  option  provides  a simple implementation of incremental (stepwise) display, which can be used for presentations.  When this option is used, xdvi will pause the display of the
              current page whenever it encounters a special special-string (xdvi:pause by default; the string can be customized via -pausespecial, see below), and the cursor will change its shape.  The ac‐
              tion unpause-or-next() (by default bound to the Space key) will display the next portion of the page up to the following special-string, or until the end of the page is reached.  When the op‐
              tion is not used, specials containing special-string will be ignored.

       -pausespecial special-string
              (.pauseSpecial) Sets the special string that causes xdvi to pause when the -pause option is active. The default value of special-string is xdvi:pause.

       -postscript flag
              (.postscript) If flag = 0, rendering of PostScript<tm> specials is disabled; instead, bounding boxes will be displayed (if available). A value of 1 (the default) switches PostScript<tm>  spe‐
              cials on. With a value of 2, the PostScript<tm> specials are displayed along with their bounding boxes; this allows you to visually check the correctness of the bounding boxes. The values can
              also be toggled at runtime with the `v' keystroke and the corresponding numerical prefix arguments 0, 1 and 2.

       -ps2pdfpath path
              (.ps2pdfPath) Use path as a conversion program from Postscript to PDF. The program or script should accept two command-line arguments: The Postscript file as first argument, and the PDF  out‐
              put file as second argument.

       -rulecolor color
              (.ruleColor) Determines the color of the rules used for the the magnifier (default: foreground color).

       -q     (.noInitFile) Ignore the $HOME/.xdvirc startup file (i.e. don't read it at startup, and don't write it at exit). This forces the defaults defined in $HOME/.Xdefaults to be used. See FILES for
              more information on $HOME/.xdvirc.

       -rv    (.reverseVideo) Causes the page to be displayed with white characters on a black background, instead of vice versa.

       -S density
              (.densityPercent) Same as -density (which see).

       -s shrink
              (.shrinkFactor) Defines the initial shrink factor.  The default value is 8.  If shrink is given as 0, then the initial shrink factor is computed so that the page fits within the window (as if
              the `s' keystroke were given without a number).

       -safer (.safer)  This  option  turns on all available security options; it is designed for use when xdvi is called by a browser that obtains a dvi or TeX file from another site.  This option selects
              +nogssafer and +allowshell.

       -sidemargin dimen
              (.sideMargin) Specifies the side margin (see -margins).

       -sourceposition line[:col][ ]filename
              This option makes xdvi search in the dvi file for the place corresponding to the indicated line (and, optionally, column) in the .tex source file, and highlight the place found by  drawing  a
              rectangle  in the highlight color (see the -hl option) around the corresponding text.  In addition, when run with this argument (and the -nofork option is not given, which see), xdvi will al‐
              ways return immediately:  if it finds another instance of xdvi already showing dvi_file, then it will cause that instance to raise its window and move to the given place in the dvi file; oth‐
              erwise  it will start up its own instance in the background.  If several instances of xdvi are displaying the respective dvi file, the instance which was last raised to the foreground will be
              used.

              The space before filename is only needed if the filename starts with a digit.  When the space is used, the argument needs to be enclosed in quotes to prevent the  shell  from  misinterpreting
              the space as argument separator.

              This option requires that dvi_file be prepared with source special information.  See the section on SOURCE SPECIALS for details on how to do this.

              Here is a more detailed description of how the filename in the -sourceposition argument is matched with the filename in the source specials:

              1. If neither of the filenames contains a path name component, the filenames are compared ignoring the `.tex' extensions in both filenames.

              2. Otherwise,  if  one  of  the filenames does contain a path component (e.g.: ./test.tex, ../test.tex, /my/homedir/tex/test.tex or any combination of these), both filenames are expanded to a
                 full path, with any occurrences of ../ and ./ expanded, and multiple slashes removed.
                 The pathname in the -sourceposition is expanded relative to the current working directory of the xdvi -sourceposition invocation, and the pathnames in the source specials are expanded rel‐
                 ative to the path of the current DVI file being viewed.
                 The path names are then compared ignoring the `.tex' extensions in both path names.

       -statusline
              (.statusline) This option is obsolete; use -expertmode  flag instead (which see).

       -thorough
              (.thorough)  Xdvi  will usually try to ensure that overstrike characters (e.g., \notin) are printed correctly.  On monochrome displays, this is always possible with one logical operation, ei‐
              ther and or or.  On color displays, however, this may take two operations, one to set the appropriate bits and one to clear other bits.  If this is the case, then by default xdvi will instead
              use the copy operation, which does not handle overstriking correctly.  The -thorough option chooses the slower but more correct choice.  See also -copy.

       -topmargin dimen
              (.topMargin) Specifies the top and bottom margins (see -margins).

       -unique
              (.unique) This option will make another instance of xdvi running on the same display act as a `server'.  For example, the invocation

              xdvi -unique +5 file.dvi

              will  cause  this  other  instance  to  load  file.dvi on page 5 in place of the file that it is currently displaying. If there is already another instance of xdvi already displaying the file
              file.dvi, then it will just jump to page 5.  If the other instance of xdvi is displaying a different file, it will load file.dvi instead. Otherwise, if no other instance of xdvi is  currently
              running on the display, this option instead starts a new instance of xdvi in the background (unless the -nofork option is specified, which see) displaying page 5 of file.dvi.
              The filename and the +n option for the page number are the only options available for controlling a remote instance of xdvi like this; all other options are currently ignored.

       -useTeXpages
              Use  logical  TeX  pages  (the  values of the \count0 register) instead of physical pages for the pagelist labels and when jumping to a page in a document with the `g' keystroke (or the goto-
              page() action).  This option can be toggled via the `T' keystroke.

       -version
              Print information on the version of xdvi.

       -visitedlinkcolor
              (.visitedLinkColor) Color used for visited hyperlinks (`Purple4' by default). Hyperlinks become visited once you click on them. As for linkColor, the value should be either a  valid  X  color
              name or a hexadecimal color string.

       -warnspecials
              (.warnSpecials) Causes xdvi to print warnings about \special strings that it cannot process to stderr. These warnings are suppressed by default.

       -watchfile n
              (.watchFile)  If this option is set to a value larger than 0, xdvi will check the DVI file for changes every n seconds. If the DVI file has been completely written by TeX, it will be reloaded
              automatically.  Fractional values (e.g. `2.5') are possible. The default for this option is 0, i.e. no watching.
              Since xdvi cannot handle partial DVI files, it tries not to reload the file while it is being rewritten.  However, use of the magnifier or switching of pages requires reading (a part of)  the
              DVI file, and if the tempfile option is switched off, this will erase the current contents of the window until the DVI file can be read entirely.

       -wheelunit pixels
              (.wheelUnit)  Sets  the  number of pixels that a motion of a wheel mouse will move the image up, down, left, or right. (See the wheel and hwheel actions, below, for more information on this.)
              If set to zero, the wheel mouse functionality is (essentially) disabled.  The default value is 80.

       -xoffset dimen
              (.xOffset) Specifies the size of the horizontal offset of the output on the page.  See -offsets.

       -yoffset dimen
              (.yOffset) Specifies the size of the vertical offset of the output on the page.  See -offsets.

KEYSTROKES
       Xdvi recognizes the following keystrokes when typed in its window.  Each may optionally be preceded by a (positive or negative) number, a `prefix argument', whose interpretation will depend  on  the
       particular  keystroke.   This prefix argument can be discarded by pressing the ``Escape'' key.  If present, the ``Help'', ``Prior'' and ``Next'' keys are synonyms for `?', `b', and `f' keys, respec‐
       tively.

       The key bindings listed here are those that xdvi assigns by default.  The names appearing in brackets at the beginning of the descriptions are the names of the  actions  associated  with  the  keys;
       these  can  be used to customize the key bindings, as explained in more detail in the section CUSTOMIZATION below. If only a lowercase binding is listed, both upper- and lowercase keys will work for
       that binding.

       ESC key
              [discard-number()] The escape key discards the numerical prefix for all actions (useful when you mistyped a number).

       Return key
              [forward-page()] Moves to the next page (or to the nth next page if a number is given).  Synonyms are `n', `f' and Line Feed.

       Backspace key
              [back-pagee()] Moves to the previous page (or back n pages).  Synonyms are `p', `b' and Ctrl-h.

       Delete key
              [up-or-previous()] Moves up two-thirds of a window-full, or to the top of the previous page if already at the top of the page. With a float argument, moves up the corresponding fraction of  a
              window-full.

       Space key
              [unpause-or-next()] Moves down two-thirds of a window-full, or to the next page if already at the bottom of the page.
              When  the  option -pause special-string is used and the display is currently paused, this key will instead display the next portion of the page until the next special-string or the end of the
              page is encountered.  See the description of the -pause option for details. The action [down-or-next()] does a similar thing, but without pausing; it is not bound to a key by default.

       Ctrl-Home (Xaw), Ctrl-osfBeginLine (Motif)
              [goto-page(1)] Moves to the first page of the document.

       Ctrl-End (Xaw), Ctrl-osfEndLine (Motif)
              [goto-page()] Moves to the last page of the document.

       Home (Xaw), osfBeginLine (Motif)
              [home-or-top()] Move to the ``home'' position of the page, or to the top of the page if the keep flag is set (in this case, the page doesn't scroll horizontally).

       End (Xaw), osfEndLine (Motif)
              [end-or-bottom()] Move to the ``end'' position of the page (the lower right-hand corner), or to the bottom of the page if the keep flag is set (in this case, the page doesn't scroll  horizon‐
              tally).

       Down arrow
              [down(0.015)] Scrolls page down.

       Up arrow
              [up(0.015)] Scrolls page up.

       Right arrow
              [right(0.015)] Scrolls page right.

       Left arrow
              [left(0.015)] Scrolls page left.

       Alt-Ctrl-+
              [change-density(25)] Increase the darkness of the fonts in the DVI window by adding to the gamma value (see also the `S' keystroke).

       Alt-Ctrl--
              [change-density(-25)] Decrease the darkness of the fonts in the DVI window by subtracting from the gamma value (see also the `S' keystroke).

       Ctrl-+ [set-shrink-factor(+)] Increase the shrink factor (see also the `s' keystroke).

       Ctrl-- [set-shrink-factor(-)] Decrease the shrink factor (see also the `s' keystroke).

       Ctr-[  [pagehistory-delete-backward()] Delete the current item in the page history and move to the history item before the deleted one. With a prefix argument n, delete n previous history items. See
              PAGE HISTORY for details.

       [      [pagehistory-back()] Move back in the page history (see PAGE HISTORY for details). With a prefix argument n, move back n history items.

       Ctr-]  [pagehistory-delete-forward()] Delete the current item in the page history and move to the history item after the deleted one. With a prefix argument n, delete n next history items. See  PAGE
              HISTORY for details.

       ]      [pagehistory-forward()] Move forward in the page history (see PAGE HISTORY for details). With a prefix argument n, move forward n history items.

       ^      [home()] Move to the ``home'' position of the page.  This is normally the upper left-hand corner of the page, depending on the margins as described in the -margins option, above.

       ?      [help()] Same as the h key (which see).

       B      [htex-back()] This key jumps back to the previous hyperlink anchor. See the section HYPERLINKS for more information on navigating the links.

       b      [back-page()] Moves to the previous page (or back n pages).  Synonyms are `p', Ctrl-h and Backspace.

       C      [set-color()] This key toggles the use of color specials.  The key sequences `0C' and `1C' turn interpretation of color specials off and on, respectively.  See also the -nocolor option.

       c      [center()] Moves the page so that the point currently beneath the mouse cursor is moved to the middle of the window, and warps the mouse cursor to the same place.

       D      [toggle-grid-mode()]  This  key  toggles the use of a grid on the displayed page.  If no number is given, the grid mode is switched on or off.  By prepending a number from 1 to 3, 3 different
              grid levels can be set.  The units of the grid are inches or centimeters, depending on whether the paper format is letter (in) or a4 (cm).

       d      [down()] Moves page down two thirds of a window-full. With a float argument to ``down'', moves down the corresponding fraction of a window-full.

       Ctrl-f [find()] Pop up a window to search for a string in the DVI file. See the section STRING SEARCH, below, for more details.

       f      [forward-page()] Moves to the next page (or to the nth next page if a number is given).  Synonyms are `n', Return, and Line Feed.

       G      [set-greyscaling()] This key toggles the use of greyscale anti-aliasing for displaying shrunken bitmaps.  In addition, the key sequences `0G' and `1G' clear and set this  flag,  respectively.
              See also the -nogrey option.

              If given a numeric argument that is not 0 or 1, greyscale anti-aliasing is turned on, and the gamma resource is set to the value divided by 100. E.g., `150G' turns on greyscale and sets gamma
              to 1.5.

       Ctrl-g [find-next()] Find the next match string in the DVI file; this can be used instead of pressing the `Find' button in the search window.

       g      [goto-page()] Moves to the page with the given number. If no page number is given, xdvi jumps to the last page.
              If the option/resource useTeXpages is active, the numbers correspond to the actual page numbers in the TeX file; otherwise, absolute page numbers (starting from 1) are  used.  In  the  latter
              case, the page numbers can be changed with the `P' keystroke, below.  Note that with the useTeXpages option it is possible that the same page number occurs multiple times; in such a case, xd‐
              vi will use the first page number that matches.

       h      Pops up a help window with a short explanation of the most important key bindings and concepts.

       k      [set-keep-flag()] Normally when xdvi switches pages, it moves to the home position as well.  The `k' keystroke toggles a `keep-position' flag which, when set, will keep the same position when
              moving between pages.  Also `0k' and `1k' clear and set this flag, respectively.  See also the -keep option.

       Ctrl-l [fullscreen(toggle)] Toggles fullscreen mode (see the description of the -fullscreen option for more information on this). This is even more flaky than using the command-line option: There is
              no universal standard how a window could change its own geometry or window decorations at run-time, so this will not work with most window managers or desktops. Generally, it's better to  use
              the window manager controls to change the size or decorations of the xdvi window.

       l      [left()] Moves page left two thirds of a window-full.

       M      [set-margins()] Sets the margins so that the point currently under the mouse cursor defines the upper left-hand corner of the text in the page.  Note that the command does not move the image,
              but only determines the margins for the page switching commands. For details on how the margins are used, see the -margins option.

       m      [toggle-mark()] Toggles the mark for the current page in the page list. When a page is marked, it is displayed with a small star `*' next to the page number.  The marked  pages  can  then  be
              printed or saved to a file.  A page or several pages can also be marked by clicking or dragging Mouse-2 in the page list.

       Ctrl-n [toggle-mark()forward-page()] Toggles the mark for the current page in the page list, and moves to the next page. This lets you quickly mark a series of subsequent pages.

       n      [forward-page()] Moves to the next page (or to the nth next page if a number is given).  Synonyms are `f', Return, and Line Feed.

       Ctrl-o [select-dvi-file()]  Read  a  new  dvi  file. A file-selection widget is popped up for you to choose the DVI file from. If a prefix argument n is given, the n th file from the file history is
              opened instead.

       P      [declare-page-number()] ``This is page number n.''  This can be used to make the `g' keystroke refer to a different page number than the physical page.  (If you want to use `logical'  or  TeX
              page numbers instead of physical pages, consider using the option -useTeXpages instead.)  The argument n should be given as prefix to this key.

       Ctrl-p [print()] Opens a popup window for printing the DVI file, or parts of it.  See the section PRINT DIALOG for an explanation of the options available, and the resources to customize the default
              behaviour.

       p      [back-page()] Moves to the previous page (or back n pages).  Synonyms are `b', Ctrl-h and Backspace.

       q      [quit()] Quits the program.

       Ctrl-r [forward-page(0)] Redisplays the current page.

       R      [reread-dvi-file()] Forces the dvi file to be reread.  This allows you to preview many versions of the same file while running xdvi only once.

       r      [right()] Moves page right two thirds of a window-full.

       Ctrl-s [save()] Opens a popup window for saving the DVI file, or parts of it. See the section SAVE DIALOG below for more information on this.

       S      [set-density()] Sets the density factor to be used when shrinking bitmaps.  This should be a number between 0 and 100; higher numbers produce lighter characters.  If greyscaling  mode  is  in
              effect, this changes the value of gamma instead.  The new value of gamma is the given number divided by 100; negative values are allowed.

       s      [set-shrink-factor()]  Changes  the shrink factor to the given number.  If no number is given, the smallest factor that makes the entire page fit in the window will be used.  (Margins are ig‐
              nored in this computation.)

       T      [use-tex-pages()] Use logical TeX pages (the values of the \count0 register) instead of physical pages for the pagelist labels and when jumping to a page in a document via  goto-page().   See
              also the -useTeXpages option.

       t      [switch-magnifier-units()]  Switches  the units used for the magnifier tick marks, and for reporting the distance between the mouse pointer and the ruler centre in ruler mode (see the section
              MODES).  The default value is specified by the X resource tickUnits (`mm' by default). The units toggle through the following values; except for `px', they all correspond to TeX's  units:  mm
              (millimeters)  pt  (TeX points), in (inches), sp (scaled points, the unit used internally by TeX) bp (big points or `Postscript points'), cc (cicero points), dd (didot points), pc (pica), and
              px (screen pixels).

       Ctrl-u [back-page()toggle-mark()] Moves to the previous page, and toggles the mark for that page. This is the dual action to Ctrl-n.

       u      [up()] Moves page up two thirds of a window-full. With a float argument to ``up'', moves up the corresponding fraction of a window-full.

       Ctrl-v [show-source-specials()] Show bounding boxes for every source special on the current page, and print the strings contained in these specials to stderr. With prefix 1, show every bounding  box
              on the page. This is for debugging purposes mainly.

       V      [set-gs-alpha()]  This key toggles the anti-aliasing of PostScript<tm> specials when Ghostscript is used as renderer.  In addition the key sequences `0V' and `1V' clear and set this flag, re‐
              spectively.  See also the -gsalpha option.

       v      [set-ps()] This key toggles the rendering of PostScript<tm> specials between 3 states:

              - specials (like EPS graphics) are displayed;

              - specials are displayed along with their bounding box (if available);

              - only the bounding box is displayed.

              The states can also be selected directly by using `1v', `2v' and `0v' respectively.  See also the -postscript option.

       Ctrl-x [source-what-special()] Display information about the source special next to the mouse cursor in the statusline. This is the same special that would be found by source-special(), but  without
              invoking the editor. For debugging purposes.

       x      [set-expert-mode()]  Toggles expert mode, in which the statusline, the scrollbars, the menu buttons, the toolbar (Motif only) and the page list are not shown.  Typing `1x' toggles the display
              of the statusline at the bottom of the window. Typing `2x' toggles the scrollbars (if available). For Xaw, `3x' toggles the menu buttons and the page list, for  Motif,  it  toggles  the  page
              list. In Motif, the additional bindings `4x' toggle the toolbar, and `5x' the menu bar.
              Without a prefix argument, all of the mentioned GUI elements are either switched on (if they had been invisible before) or off.
              Toggling  the scrollbars may behave erratically with the Xaw widgets; e.g. the scrollbars may reappear after resizing the window, and at certain window sizes one of the scrollbars may fail to
              disappear.
              See also the option -expertmode (the numbers above correspond to the bits in the argument to -expertmode).

MOUSE ACTIONS IN THE MAIN WINDOW
       The mouse actions can be customized by setting the X resource mouseTranslations.  Since there are three different mouse modes (see the section MODES below), there is  a  special  action  mouse-modes
       which  lists  the  actions  for  each  of the three modes: mouse-modes("ACTIONS-FOR-MODE1", "ACTIONS-FOR-MODE2", "ACTIONS-FOR-MODE3").  If only one argument is specified, this action is used for all
       modes.  The default bindings are as follows:

            xdvi.mouseTranslations: \
            Shift<Btn1Down>:mouse-modes("drag(+)")\n\
            Shift<Btn2Down>:mouse-modes("drag(|)")\n\
            Shift<Btn3Down>:mouse-modes("drag(-)")\n\
            Ctrl<Btn1Down>:mouse-modes("source-special()")\n\
            <Btn1Down>: mouse-modes("do-href()magnifier(*2)", "text-selection()", "ruler()")\n\
            <Btn2Down>: mouse-modes("do-href-newwindow()magnifier(*2)", "text-selection()", "ruler()")\n\
            <Btn3Down>: mouse-modes("magnifier(*3)")\n\
            <Btn4Down>: mouse-modes("wheel(-0.2)")\n\
            <Btn5Down>: mouse-modes("wheel(0.2)")\n\
            <Btn6Down>: mouse-modes("hwheel(-0.2)")\n\
            <Btn7Down>: mouse-modes("hwheel(0.2)")\n\

       All of these actions are described in more detail below.  Note the use of quote symbols around the action strings, which are necessary to group them into one argument.  Buttons 4, 5, 6, and 7  refer
       to wheel movements (wheel up/down/left/right) on wheel mice.  Not all mice support horizontal scrolling.

       The  X  Toolkit routines that implement translations do not support event types of Btn6Down or Btn7Down.  Because of this, xdvi implements its own parser for translations given in mouseTranslations.
       This parser is more limited than the parser built in to the X Toolkit.  The string given in mouseTranslations should not begin with ``#replace'', ``#augment'', or ``#override''.   Modifiers  of  the
       form @keysym are not supported, and the event type must be of the form BtnDown or BtnnDown, where n is a positive integer without leading zeroes.  Also, some limitations apply to the action field.

       do-href()

       do-href-newwindow()
              Usually,  if a binding specifies more then one action, all actions are executed in a sequence. The hyperlink bindings do-href() and do-href-newwindow() are special in that they are used as an
              alternative to other actions that might follow them if the mouse is currently located on a hyperlink.  In this case, none of the other actions will be executed; otherwise, only the other  ac‐
              tions are executed.
              The  action do-href() jumps to the link target in the current xdvi window (eventually switching to another page), and do-href-newwindow() opens a new instance of xdvi for the link target.  In
              both cases, the location of the target is indicated by a small arrow drawn in the same color as a visited link in the left corner of the window.

       magnifier(n x m)

       magnifier(*n)
              This action will pop up a ``magnifying glass'' which shows the unshrunk image of the region around the mouse pointer.  The magnifier disappears when the mouse button is released.  Moving  the
              mouse cursor while holding the button down will move the magnifier.
              Different  mouse buttons produce different sized windows, as indicated by the the argument of the magnifier() action. Its argument is either a string of the form widthxheight, as in the -mgsn
              command-line option, or one of the strings *1 through *5, referring to the value specified by the corresponding -mgsn option.

       drag(+)

       drag(|)

       drag(-)
              Drags the page with the mouse. This action should have one parameter, the character ``|'', ``-'', or ``+'', indicating vertical dragging only, horizontal dragging only, or dragging in all di‐
              rections.

       source-special()
              This  action starts a ``reverse search'', opening the editor at the location in the TeX file corresponding to the pointer location in the DVI file.  See the section on SOURCE SPECIALS, below,
              for more information on this.

       wheel()
              This action can be used to scroll the image with a wheel mouse, where it is usually bound to mouse button 4 (wheel up) or 5 (wheel down).  The action takes one parameter, giving the  distance
              to scroll the image.  If the parameter contains a decimal point, the distance is given in wheel units; otherwise, pixels.  A negative value scrolls up, a positive value scrolls down.

       hwheel()
              This action can be used to scroll the image horizontally with a wheel mouse, where it is usually bound to mouse button 6 (wheel left) or 7 (wheel right).  The action takes one parameter, giv‐
              ing the distance to scroll the image.  If the parameter contains a decimal point, the distance is given in wheel units; otherwise, pixels.  A negative value scrolls  left,  a  positive  value
              scrolls right.  Not all mice support horizontal scrolling; this is mostly for touchpads, trackpads, etc.

       text-selection()
              This  action  allows  you to mark a rectangular region of text in the DVI file.  The text is put into the X selection buffer and can be pasted into other applictions (e.g. text editors). This
              works similar to the Plain text option in the Save dialog; see the discussion there for more information on encoding issues.

       ruler()
              This action creates a cross-shaped ruler. Moving the mouse and holding the button down drags the ruler and lets you measure distances on the page.  See the section Ruler Mode for more  infor‐
              mation on this.

UNBOUND ACTIONS
       The following actions are not bound to a key by default, but are available for customization.

       quit-confirm()
              Pops up a confirmation window to quit xdvi. To bind it to the `q' key instead of the default `quit()' action, put the following into your ~/.Xdefaults file:

              xdvi.mainTranslations: #override\
              <Key>q: quit-confirm()\n

       down-or-next()
              Similar to unpause-or-next(): Moves down two-thirds of a window-full, or to the next page if already at the bottom of the page.

       shrink-to-dpi()
              This  action  takes  one  (required) argument.  It sets the shrink factor to an integer so as to approximate the use of fonts with the corresponding number of dots per inch.  If xdvi is using
              fonts scaled for p dots per inch, and the argument to shrink-to-dpi is n, then the corresponding shrink factor is the ratio p/n, rounded to the nearest integer.

CUSTOMIZATION
       Key and mouse button assignments can be changed by setting the mainTranslations resource to a string of translations as defined in the documentation for the X toolkit.  The actions should  take  the
       form of action names listed in the KEYSTROKES and MOUSE ACTIONS sections.

       An exception to this are the Motif keys osfPageUp (PgUp), osfPageDown (PgDown), osfBeginLine (Home) and osfEndLine (End) which are currently not customizable in the Motif version.

       Key actions will usually be without arguments; if they are passed an argument, it represents the optional number or `prefix argument' typed prior to the action.

       Some  key actions may take special arguments, as follows: The argument of goto-page may be the letter `e', indicating the action of going to the end of the document.  The argument of set-shrink-fac‐
       tor may be the letter `a', indicating that the shrink factor should be set to the smallest value such that the page will fit in the window, or one of the signs `+' or `-', indicating that the shrink
       factor should be increased or decreased, respectively.  Finally, actions that would perform a toggle, such as set-keep-flag, may receive an argument `t', indicating that the action should toggle re‐
       gardless of the current prefix argument.

       Mouse actions should refer only to ButtonPress events (e.g., <Btn1Down>:magnifier(*1)).  The corresponding motion and release events will be handled internally.  A key action may be bound to a mouse
       event, but not vice versa.

       Usually the string of translations should begin with ``#override'', indicating that the default key and mouse button assignments should not be discarded.

       When keys or mouse buttons involving modifiers (such as Ctrl or Shift) are customized together with their non-modified equivalents, the modified keys should come first, for example:

            xdvi.mainTranslations: #override \
            Shift<Key>s: select-dvi-file()\n\
            Ctrl<Key>s: save()\n\
            <Key>s: find()\n


       Because xdvi needs to capture pointer motion events, and because the X Toolkit translations mechanism cannot accommodate both motion events and double-click events at the same time, it is not possi‐
       ble to specify double-click actions in xdvi customizations.  For information on this and other aspects of translations, see the X Toolkit Intrinsics documentation.

       There is no command-line option to set the mainTranslations resource, since changing this resource on the command line would be cumbersome.  To set the resource for testing purposes,  use  the  -xrm
       command-line  option  provided  by  the  X toolkit.  For example, xdvi -xrm 'XDvi.mainTranslations: #override "z":quit()' ...  or xdvi -xrm 'XDvi.mainTranslations: #override <Key>z:quit()' ...  will
       cause the key `z' to quit xdvi.

       Some resources are provided to allow customization of the geometry of the Xaw command buttons.  Again, they are not changeable via command-line options, other than via the -xrm option.  All of these
       resources take integer values.

       buttonSideSpacing
              The number of pixels to be placed on either side of the buttons.  The default value is 6.

       buttonTopSpacing
              The number of pixels between the top button and the top of the window.  The default value is 50.

       buttonBetweenSpacing
              The number of pixels between the buttons.  The default value is 20.

       buttonBetweenExtra
              The number of pixels of additional space to be inserted if the buttonTranslations resource string contains an extra newline character.  The default value is 50.

       buttonBorderWidth
              The border width of the button windows.  The default value is 1.

PAGE LIST
       The scrollable page list on the right of the main window allows you to jump directly to a page in the DVI file.

       Mouse-1
              Jumps to the page the mouse is located on.

       Mouse-2
              [toggle-mark()] Toggle the mark of the current page. The marks are used by the `Print' and `Save to file' dialogs to select only marked pages from the DVI file.

       When the mouse pointer is inside the page list, the mouse wheel switches to the next or previous page.

SCROLLBARS
       The scrollbars (if present) behave in the standard way:  pushing Button 2 in a scrollbar moves the top or left edge of the scrollbar to that point and optionally drags it; pushing Button 1 moves the
       image up or right by an amount equal to the distance from the button press to the upper left-hand corner of the window; pushing Button 3 moves the image down or left by the same amount.

       The scrollbars can be removed via the -expertmode flag/keystroke (which see).

MAGNIFIER
       By default, the mouse buttons 1 to 5 will pop up a ``magnifying glass'' that shows an unshrunken image of the page (i.e. an image at the resolution determined by the option/X resource pixels or  mf‐
       mode)  at  varying  sizes.  When the magnifier is moved, small ruler-like tick marks are displayed at the edges of the magnifier (unless the X resource delayRulers is set to false, in which case the
       tick marks will always be displayed).  The unit of the marks is determined by the X resource tickUnits (mm by default). This unit can be changed at runtime via the  action  switch-magnifier-units(),
       by default bound to the keystroke `t' (see the description of that key, and of switch-magnifier-units() for more details on the units available).
       The length of the tick marks can be changed via the X resource tickLength (4 by default). A zero or negative value suppresses the tick marks.

PAGE HISTORY
       Xdvi  keeps  a  history of viewed pages, and you can move through the history and delete items using the keys [ (pagehistory-back()), ] (pagehistory-forward()), Ctr-[ (pagehistory-delete-backward())
       and Ctr-] (pagehistory-delete-forward()).

       When one of the history commands is used, the page history is displayed in the status line at the bottom of the window, with the current list item marked by square brackets `[', `]' and a  left  and
       right context of at most 10 items. File boundaries are marked by `#'.

       The size of the history can be customized with the X resource pageHistorySize (the default size is 1000 items). If the size is set to 0, the history commands are disabled.

HYPERLINKS
       The actions do-href() and do-href-newwindow() (by default bound to Mouse-1 and Mouse-2 if the pointer is currently located on a hyperlink) can be used to open the link target in the same window (do-
       href()) or in a new window (do-href-newwindow()).

       If the link target is not a file on the local disk, xdvi tries to launch a web browser (as specified by the -browser command line option, the BROWSER environment variable or  the  wwwBrowser  X  re‐
       source, in this order) to retrieve the document. See the description of the BROWSER environment variable, below, for an example setting.

       If  the file is a local file, xdvi tries to determine if it is a DVI file. If it is, xdvi will try to display the file; otherwise it will try to determine the MIME type of the file, and from that an
       application suitable for opening the file.  This is done by parsing the files specified by the environment variable EXTENSIONMAPS for a mapping of filename extensions to MIME types,  and  the  files
       determined  by  the environment variable MAILCAPS for a mapping of MIME types to application programs.  See the descriptions of these variables in the section ENVIRONMENT, below, for a more detailed
       description and the default values of these variables. If no suitable files are found, a set of built-in default MIME types and applications is used.

       Xdvi currently uses no heuristics apart from the filename suffix to determine the mime type of a file. If a filename has no suffix, the value of the resource noMimeSuffix is used (by default  appli‐
       cation/x-unknown).   If the suffix doesn't match any of the suffixes in mime.types, the value of the resource unknownMimeSuffix is used (by default application/x-unknown).  If the mailcap entries do
       not list a viewer for a given mime type, xdvi will show a warning popup. If you want to avoid this warning, and for example want to always use the netscape browser for unknown MIME types, you  could
       add the following line to your ~/.mailcap file:

           application/xdvi-unknown; \
               netscape -raise -remote 'openURL(%s,new-window)'


STRING SEARCH
       The  keystroke  Ctrl-f  or the menu entry File > Find ...  (or the `Binoculars' symbol in the toolbar, for Motif) opens a dialog window to search for a text string or a regular expression in the DVI
       file.  The keystroke Ctrl-g jumps to the next match (like pressing the `Find' button in the search window).

       By default, the matches are highlighted in inverted color.  If the display isn't running in TrueColor, or if the X resource matchHighlightInverted is set to false or  the  command-line  option  -no‐
       matchinverted is used, xdvi will instead draw a rectangle in highlight color (see the -hl option) around the match.

       If  a  match crosses a page boundary, only the part on the first page is highlighted.  Xdvi will scan up to 2 adjacent pages to match strings crossing page boundaries; but note that header or footer
       lines, or intervening float pages will be treated as parts of the scanned text. Such text will usually cause multi-page matching to fail.

       This emphasizes the fact that searching in the formatted text (the DVI output) works differently from searching in the source text: Searching in the DVI file makes it easier to skip  formatting  in‐
       structions,  and  makes  it possible to search for e.g.  hyphenation and equation numbers; but sometimes the formatting results can also get in the way, e.g. in the case of footnotes. In these cases
       it's better to search in the TeX source instead. The use of source specials will make switching between the xdvi display and the editor with the TeX source easier; see the  section  SOURCE  SPECIALS
       below for more information on this.

       The text extracted from the DVI file is in encoded in UTF-8 (you can view that text by saving the file in UTF-8 format via the File > Save as ...  menu item).  If xdvi has been compiled with locale,
       nl_langinfo() and iconv support, the search term is converted from the character set specified by the current locale into UTF-8. (See the output of locale -a for a list of locale settings  available
       on your system).  If nl_langinfo() is not available, but iconv is, you can specify the input encoding for iconv via the X resource textEncoding (see the output of iconv -l for a list of valid encod‐
       ings). If iconv support is not available, only the encodings ISO-8859-1 and UTF-8 are supported (these names are case-insensitive).

       Ideographic characters from CJKV fonts are treated specially: All white space (spaces and newlines) before and after such characters is ignored in the search string and in the DVI file.

       To match a newline character, use \n in the search string; to match the string \n, use \\n.

       If the checkbox Regular Expression is activated, the string is treated as a regular expression in extended POSIX syntax, with the following properties:

         - a? matches a zero or one times.

         - a* matches a zero or more times.

         - a+ matches a one or more times.  Note that * and + are greedy, i.e. they match the longest possible substring.

         - The pattern . matches any character except for newline. To also match a newline, use `(.|\n)'.

         - a{n} matches a exactly n times.

         - a{n,m} matches a at least n and no more than m times.

         - a|b matches a or b. Brackets can be used for grouping, e.g.: (a|b)|c.

         - The string matched by the nth group can be referenced by \n, e.g. \1 refers to the first match.

         - The characters ^ and $ match the beginning and the end of a line, respectively.

         - [abc] matches any of the letters a, b, c, and [a-z] matches all characters from a to z.

         - Each item in a regular expression can also be one of the following POSIX character classes:
           [[:alnum:]] [[:alpha:]] [[:blank:]] [[:cntrl:]] [[:digit:]]
           [[:graph:]] [[:lower:]] [[:print:]] [[:space:]] [[:upper:]]


           These can be negated by inserting a ^ symbol after the first bracket: [^[:alpha:]]

           For more details on POSIX regular expressions, see e.g. the IEEE Std 1003.1 standard definition available online from:

           http://www.opengroup.org/onlinepubs/007904975/basedefs/xbd_chap09.html

         - As a non-standard extension, the following Perl-like abbreviations can be used instead of the POSIX classes:

           Symbol   Meaning                       POSIX Class

               \w   an alphanumeric character     [[:alnum:]]
               \W   a non-alphanumeric character  [^[:alnum:]]
               \d   a digit character             [[:digit:]]
               \D   a non-digit character         [^[:digit:]]
               \s   a whitespace character        [[:space:]]
               \S   a non-whitespace character    [^[:space:]]


         - The following characters are special symbols; they need to be escaped with \ in order to match them literally:  ( ) [ ] . * ? + ^ $ \.

         - Matches of length zero are silently skipped.

       The dialog also provides checkboxes to:

         - search backwards;

         - match in a case-sensitive manner (the default is to ignore case, i.e. a search string Test will match both the strings test and TEST in the DVI file);

         - ignore line breaks and hyphens: This removes all hyphens at the ends of lines and the following newline characters, and replaces all remaining newline characters by white spaces.  So  hyphenated
           words will appear as one word to the search, and a search for two words with a space in between will also match the words if they are separated by a linebreak.
           Note  that  the hyphen removal may cause unwanted side effects for compound words containing hyphens that are wrapped after the hyphen, and that replacing the newlines affects the interpretation
           of regular expressions as follows: The . pattern will also match newlines, and ^ and $ won't match begin and end of lines any more. (Since currently there is no option for turning off the greed‐
           iness of * and +, turning on this option will usually result in matches that are longer than desired.)

       The current checkbox settings are saved in the ~/.xdvirc file.

PRINT DIALOG
       The  print  dialog  window allows you to print all pages, marked pages (click or drag Mouse-2 in the page list to mark them), or a range of pages. Note that the page numbers always refer to physical
       pages, so if you're using the option `use TeX pages', you may want to disable it to make it easier to determine the correct page numbers (or avoid this problem altogether by marking the pages to  be
       printed).

       The  value  of  the Printer text filed is passed to dvips via the -o!  mechanism, as a single argument after the `!'. Any arguments listed in the Dvips options field are segmented at whitespaces and
       passed as separate arguments to dvips.  If you e.g. want to print the file 2-up, you should enter the following string into the Printer field:

                psnup -2 -q | lpr -Plp


       There are several resources for customizing the behaviour and the default entries of the print dialog:

       dvipsPrinterString

       dvipsOptionsString
              These can be used to provide default entries for the Printer and the Dvips options text fields, respectively. If no paper size is specified in the DVI file (via e.g. \usepackage[dvips]{geome‐
              try}  -  this  is the preferred method), the input field is initialized with the current value of the command line option/X resource paper.  E.g., the option -paper a4r is translated into the
              dvips options -t a4 -t landscape.  Note that no check is performed whether dvips actually understands these options (it will ignore them if it can't); currently not all options used  by  xdvi
              are also covered by dvips.

       dvipsHangTime

       dvipsFailHangTime
              These  specify the time (in milliseconds) that the printing progress window will stay open after the dvips process has terminated. The value of dvipsHangTime is used if the process terminates
              successfully; dvipsFailHangTime is used if it terminates with an error. The default values are 1.5 and 5 seconds, respectively.  If both values are negative, the window will stay  open  until
              it is closed by the user.

SAVE DIALOG
       This dialog allows you to save all or selected/marked pages in the current DVI file. You can save in one of the following formats:

         - Postscript (uses dvips to convert the DVI file to a Postscript file, just like when printing to a Postscript file).

         - PDF (first uses dvips to convert the DVI file to a Postscript file, then uses ps2pdf to convert the Postscript file to PDF).

         - Plain  text  in  ISO-8859-1  or UTF-8 encoding. The latter will preserve more of the special LaTeX characters e.g. from mathematical mode. Note however that e.g. only few of LaTeX's mathematical
           symbols can be rendered correctly as text; so this funcionality works best for plain text documents.  If a character cannot be displayed in the selected charset, it is replaced by  `\'  followed
           by the hexadecimal character code.  If a character is not recognized at all, it is replaced by `?'.

       The  programs  for Postscript and PDF conversion can be customized via the command line options or X resources -dvipspath/.dvipsPath and -ps2pdfpath/.ps2pdfPath, respectively; see the explanation of
       these options above for more details.

MODES
       The keystroke Ctrl-m [switch-mode()] switches between three different mouse bindings, which can also be activated via the Modes menu (in Motif, this is a submenu of the  Options  menu  called  Mouse
       Mode).  The default mode at startup can be customized via the X resource mouseMode or the command-line option -mousemode.  The default startup mode is Magnifier Mode.

       Note:  The  modes  are implemented by changing the magnifier() action. Switching the mode will not work if Mouse-1 has been customized to an action sequence that does not contain the magnifier() ac‐
       tion.

       Magnifier Mode
              In this mode, the mouse buttons 1 to 5 pop up a ``magnifying glass'' that shows an unshrunken image of the page (i.e. an image at the resolution determined by the option/X resource pixels  or
              mfmode)  at  varying  sizes.  When the magnifier is moved, small ruler-like tick marks are displayed at the edges of the magnifier (unless the X resource delayRulers is set to false, in which
              case the tick marks are always displayed).  The unit of the marks is determined by the X resource tickUnits (mm by default). This unit can be changed at runtime via the action switch-magnifi‐
              er-units(), by default bound to the keystroke `t' (see the description of that key, and of switch-magnifier-units() for more details on the units available).
              The length of the tick marks can be changed via the X resource tickLength (4 by default). A zero or negative value suppresses the tick marks.

       Text Selection Mode
              This mode allows you to select a rectangular region of text in the DVI file by holding down Mouse-1 and moving the mouse. The text is put into the X primary selection so that it can be pasted
              into other X applications with Mouse-2 as usual.
              If xdvi has been compiled with locale, nl_langinfo() and iconv support, the selected text is converted into the character set of the current locale (see the output of locale -a for a list  of
              locale  settings  available  on your system).  If nl_langinfo() is not available, but iconv is, you can specify the input encoding for iconv via the X resource textEncoding (see the output of
              iconv -l for a list of valid encodings). If iconv support is not available, only the encodings ISO-8859-1 and UTF-8 are supported (these names are case-insensitive).
              Note that UTF-8 is the only encoding that can render all characters (e.g. mathematical symbols) of a DVI file. If ISO-8859-1 is active, characters that cannot be displayed are replaced by `\'
              followed by the hexadecimal character code.  For other encodings, such characters may trigger iconv error messages.  If a character is not recognized at all, it is replaced by `?'.
              To extract larger portions of text, you can alternatively save selected pages or the entire file in text format via the File > Save as ...  menu.

       Ruler Mode
              This mode provides a simple way of measuring distances on the page.
              When  this  mode is activated, the mouse cursor changes into a thin cross, and a larger, cross-shaped ruler is drawn in the highlight color at the mouse location. The ruler doesn't have units
              attached to it; instead, the current distance between the ruler and the mouse cursor is continuously printed to the statusline.
              When activating Ruler Mode, the ruler is at first attached to the mouse and can be moved around. It can then be positioned at a fixed place by clicking Mouse-1.  After that, the mouse  cursor
              can be moved to measure the horizontal (dx), vertical (dy) and direct (shortest) (dr) distance between the ruler center point and the mouse.
              Clicking Mouse-1 again will move the ruler to the current mouse position, and holding down Mouse-1 will drag the ruler around.
              In Ruler Mode, the following special keybindings extend or replace the default bindings:

              o      [ruler-snap-origin()] Snap the ruler back to the origin coordinate (0,0).

              t      [overrides switch-magnifier-units()] Toggle between various ruler units, which can be specified by the X resource tickUnits (`mm' by default).

              P      [overrides declare-page-number()] Print the distances shown in the statusline to standard output.

TOOLBAR (Motif only)
       The  Motif  toolbar  can  also be customized. The XPM file used for the toolbar icons can be specified via the resource toolbarPixmapFile, which should contain a filename that can be found in one of
       XFILESEARCHPATH or XDVIINPUTS (see the section FILE SEARCHING below for more information on these variables).  Xdvi will try to split this pixmap horizontally into n pieces, where each piece  is  as
       wide  as  the  pixmap is high and is treated as an image for toolbar button n.  This means that each icon should be a square, and that the entire pixmap should have width n x h if h is the height of
       the pixmap.

       The resource toolbarTranslations can be used to map icons/buttons to specific actions.  The resource should contain a string separated by newline characters, similar to  the  resources  mainTransla‐
       tions and menuTranslations.  Every line must contain either a spacer definition, or an icon definition:

       A spacer definition is a string SPACER(n), where n is the number of pixels inserted as separator to the following button.

       An icon definition is a colon-separated list containing the following elements:

         - the index of an icon in the pixmap file (starting from zero);

         - a long tooltip string, displayed in the status area;

         - a short tooltip string, displayed as popup;

         - a sequence of actions to be performed when the corresponding toolbar button is pushed.

       To illustrate this, the default value of toolbarTranslations looks as follows:

            xdvi.toolbarTranslations: \
               SPACER(5)\n\
               0:Open a new document   (Key\\: Ctrl-f):\
                    Open file:select-dvi-file()\n\
               SPACER(10)\n\
               1:Reread this document   (Key\\: R):\
                    Reread file:reread-dvi-file()\n\
               SPACER(10)\n\
               2:Go to the first page of this document   (Key\\: 1g):\
                    Go to first page:goto-page(1)\n\
               3:Go to the previous page of this document   (Key\\: p):\
                    Go to previous page:back-page(1)\n\
               4:Go to the next page of this document   (Key\\: n):\
                    Go to next page:forward-page(1)\n\
               5:Go to the last page of this document   (Key\\: g):\
                    Go to last page:goto-page()\n\
               SPACER(10)\n\
               6:Enlarge the display   (Key\\: Ctrl-+):Zoom in:\
                    set-shrink-factor(+)\n\
               7:Shrink the display   (Key\\: Ctrl--):Zoom out:\
                    set-shrink-factor(-)\n\
               SPACER(10)\n\
               8:Jump back to the previous hyperlink   (Key\\: B):\
                    Back hyperlink:htex-back()\n\
               SPACER(10)\n\
               10:Print this document:Print:print()\n\
               SPACER(10)\n\
               11:Toggle marks for odd pages   (Key\\: 1m):\
                    Toggle odd:toggle-mark(1)\n\
               12:Toggle marks for even pages   (Key\\: 2m):\
                    Toggle even:toggle-mark(2)\n\
               13:Toggle mark for current page   (Key\\: 2m):\
                    Toggle current:toggle-mark()\n\
               14:Unmark all pages   (Key\\: 0m):\
                    Unmark all:toggle-mark(0)\n\
               SPACER(10)\n\
               18:Display fonts darker   (Key\\: Alt-Ctrl-+):\
                    Fonts darker:change-density(5)\n\
               19:Display fonts lighter   (Key\\: Alt-Ctrl--):\
                    Fonts lighter:change-density(-5)\n


       When  the  mouse  remains over a toolbar button for a certain period, a `tooltip' window is shown, describing what the button does using the short tooltip string from the above resource. At the same
       time, the long tooltip string is displayed in the statusline.  The appearance and behaviour of these tooltips can be customized via the following resources:

       tipShell.background
              Background color of the tooltip window.

       tipShell.fontSet
              Font used for the tooltip.

       tipShell.waitPeriod
              The time (in milliseconds) the mouse pointer needs to be over the button before the tooltip is shown. Set it to a negative value to suppress the tooltips altogether.


GREYSCALING AND COLORMAPS
       The greyscale anti-aliasing feature in xdvi will not work at its best if the display does not have enough colors available.  This can happen if other applications are  using  most  of  the  colormap
       (even  if  they are iconified).  If this occurs, then xdvi will print an error message and turn on the -copy option.  This will result in overstrike characters appearing wrong; it may also result in
       poor display quality if the number of available colors is very small.

       Typically this problem occurs on displays that allocate eight bits of video memory per pixel.  To see how many bits per pixel your display uses, type xwininfo in an xterm window, and then click  the
       mouse on the root window when asked.  The ``Depth:'' entry will tell you how many bits are allocated per pixel.

       Displays using at least 15 bits per pixel are typically TrueColor visuals, which do not have this problem, since their colormap is permanently allocated and available to all applications.  (The vis‐
       ual class is also displayed by xwininfo.)  For more information on visual classes see the documentation for the X Window System.

       To alleviate this problem, therefore, one may (a) run with more bits per pixel (this may require adding more video memory or replacing the video card), (b) shut down other applications that  may  be
       using much of the colormap and then restart xdvi, or (c) run xdvi with the -install option.

       One  application  which is often the cause of this problem is Netscape.  In this case there are two more alternatives to remedying the situation.  One can run ``netscape -install'' to cause Netscape
       to install a private colormap.  This can cause colors to change in bizarre ways when the mouse is moved to a different window.  Or, one can run ``netscape -ncols 220'' to limit Netscape to a smaller
       number of colors.  A smaller number will ensure that other applications have more colors available, but will degrade the color quality in the Netscape window.


HANDLING OF POSTSCRIPT FIGURES
       Xdvi can display Encapsulated PostScript (EPS) files included in the dvi file.  Such files are first searched for in the directory where the dvi file is, and then using normal Kpathsea rules.  There
       is an exception to this, however:  if the file name begins with a backtick (`), then the remaining characters in the file name give a shell command (often zcat) which is executed; its standard  out‐
       put  is then sent to be interpreted as PostScript.  Since the execution of arbitrary shell commands with the user's permissions is a huge security risk, evaluation of these backtick commands is dis‐
       abled by default. It needs to be activated via the -allowshell command-line option.  NOTE: You should never use this option when viewing documents that you didn't compile yourself. The backtick spe‐
       cials  are  not needed for uncompressing gzipped Postscript files, since xdvi can do that on the fly if the filename ends with .eps.gz or .eps.Z (and if the first bytes of the file indicate that the
       file is indeed compressed).  This is both safer and more flexible than the backtick approach, since the default file searching rules will apply to such filenames too.

T1LIB
       Using T1Lib, a library written by Rainer Menzner (see ftp://sunsite.unc.edu/pub/Linux/libs/graphics/), xdvi can render Postscript<tm> Type1 fonts directly, without  the  route  via  TeX  pixel  (pk)
       fonts. The advantage of this is that only one size of each font needs to be stored on disk.  Unless the -not1lib option is used, xdvi will try to render every font using T1Lib. Only as a fallback it
       will invoke an external program (like mktexpk, which in turn may invoke utilities like ps2pk or gsftopk) to generate a pixel font from the Type1 source. The direct rendering of the  Computer  Modern
       fonts  should  work out-of-the box, whereas other Type1 fonts such as the 35 `standard' Postscript<tm> fonts resident in printers may need to be made accessible for use with xdvi, unless your system
       administrator or TeX distribution has already done so (which is the case e.g. for current teTeX systems). The xdvik distribution comes with a utility called t1mapper to make  these  fonts  available
       for xdvi; see the manual page for t1mapper(1) for usage details.

SPECIALS (GENERALLY)
       Any of the specials used by xdvi may be preceded by the characters ``xdvi:''.  Doing so does not change the behavior of the special under xdvi, but it tells other dvi drivers (such as e.g. dvips) to
       ignore the special.

SOURCE SPECIALS
       Some TeX implementations or macro packages provide the facility to automatically include so-called `source specials' into a DVI file.  These contain the line number, eventually a column number,  and
       the  filename  of  the  .tex source. This makes it possible to jump from a .dvi file to the corresponding place in the .tex source and vice versa (also called `inverse search' - jumping from the DVI
       file to the TeX file is also known as `reverse search', and jumping from the TeX file to the DVI file as `forward search').

       To be usable with xdvi, source specials in the dvi file must have one of the following formats:

                src:line[ ]filename
                src:line:col[ ]filename
                src:line
                src:line:col
                src::col

       If filename or line are omitted, the most recent values are used.  The first source special on each page must be in one of the first two forms, since defaults are not inherited across pages.

       You will need a TeX implementation that provides an appropriate switch (e.g.  -src) or a macro package (such as srcltx.sty or srctex.sty, available from  CTAN:macros/latex/contrib/supported/srcltx/)
       to insert such source specials into the DVI file.

       For  reverse  search, the combination Ctrl-Mouse 1 will make xdvi open an editor (the value of the -editor command line option) with the file and the line number of the .tex source. See the descrip‐
       tion of the -editor option for more information and example settings.

       For forward search, xdvi has a -sourceposition option that makes xdvi jump to the page in the DVI file corresponding to the given line (or the closest line having a source special) of the  specified
       file and highlight the found region. See the description of the -sourceposition option for more details.

       More information on setting up various editors for use with source specials can be found at:

            http://xdvi.sourceforge.net/inverse-search.html


PAPERSIZE SPECIALS
       xdvi accepts specials to set the paper size for the document.  These specials should be of the form

                papersize=[*]width,height


       where  width  and  height give the width and height of the paper, respectively.  Each of these should appear in the form of a decimal number followed by any of the two-letter abbreviations for units
       accepted by TeX (pt, pc, in, bp, cm, mm, dd, cc, or sp).  If an asterisk (*) appears just before the width, then the measurements refer to the document dimensions (e.g., pt as  opposed  to  truept).
       This allows a macro package to vary the page size according to elements of the document; e.g.,

            \special{xdvi: papersize=*\number\wd\mybox sp,
                     \number\ht\mybox sp}


       Except for the asterisk, this format is compatible with dvips.

       The  last papersize special on a page determines the size of that page.  If there is no such special on a given page, the most recent papersize is used, or, if there are no papersize specials on any
       preceding page, then the value of the paper resource (or -paper option on the command line) is used.  Thus the paper size may vary for different pages of the dvi file.

       If the paper resource (or -paper command-line option) begins with a plus sign (`+'), then all papersize specials in the dvi file are ignored.

COLOR SPECIALS
       The color specials supported by xdvi are the same as those supported by dvips, except that the literal PostScript color specification (as in the AggiePattern example in the dvips  documentation)  is
       not supported.  There are also some restrictions due to the way xdvi's  drawing  routines are implemented; e.g. the \colorbox and \fcolorbox macros don't work with xdvi.  See the section LIMITATIONS
       below for more information on these restrictions.  Xdvi supports the same list of named colors as dvips does, namely:

       Apricot, Aquamarine, Bittersweet, Black, Blue, BlueGreen, BlueViolet, BrickRed, Brown, BurntOrange, CadetBlue, CarnationPink, Cerulean, CornflowerBlue, Cyan, Dandelion, DarkOrchid, Emerald,  Forest‐
       Green,  Fuchsia,  Goldenrod,  Gray,  Green,  GreenYellow, JungleGreen, Lavender, LimeGreen, Magenta, Mahogany, Maroon, Melon, MidnightBlue, Mulberry, NavyBlue, OliveGreen, Orange, OrangeRed, Orchid,
       Peach, Periwinkle, PineGreen, Plum, ProcessBlue, Purple, RawSienna, Red, RedOrange, RedViolet, Rhodamine, RoyalBlue, RoyalPurple, RubineRed, Salmon, SeaGreen, Sepia, SkyBlue, SpringGreen, Tan, Teal‐
       Blue, Thistle, Turquoise, Violet, VioletRed, White, WildStrawberry, Yellow, YellowGreen, YellowOrange.

       Note that these names are case sensitive.

       The  documentation  of the LaTeX color package provides more details on how to use such specials with LaTeX; see the dvips documentation for a detailed description of the syntax and semantics of the
       color specials.

SIGNALS
       When xdvi receives a SIGUSR1 signal, it rereads the dvi file.

ENVIRONMENT
       Xdvik uses the same environment variables and algorithms for searching for font files as TeX and friends.  See the documentation for the Kpathsea library, kpathsea.dvi, for a detailed description of
       these.

       In addition, xdvik accepts the following variables:

       DISPLAY
              Specifies which graphics display terminal to use.

       KPATHSEA_DEBUG
              Trace Kpathsea lookups; set it to -1 (= all bits on) for complete tracing.

       EXTENSIONMAPS
              A  list of files to be searched for mime types entries (as for Acrobat Reader).  Earlier entries in one of these files override later ones.  If this variable is not set, the following default
              path is used:

              $HOME/.mime.types:/etc/mime.types:\
                  /usr/etc/mime.types:/usr/local/etc/mime.types



       MAILCAPS
              A list of files to be searched for mailcap entries, as defined by RFC 1343. See this RFC or the mailcap(4) manual page for a detailed description of the mailcap file format.  Currently,  only
              the following mailcap features are supported:

              test=command
                     The  entry  is only used if command can be executed via the system() call and if the system() call returns with value 0 (success).  The command string may contain the format string %s,
                     which will be replaced by the file name.

              needsterminal
                     If this flag is used, the command will be executed in a new xterm window by prepending ``xterm -e '' to the command string.

              All other fields in the mailcap entry are ignored by xdvi.  Earlier entries in one of these files override later ones.  If the variable is not defined, the following default path is used:

                  $HOME/.mailcap:/etc/mailcap:/usr/etc/mailcap:\
                      /usr/local/etc/mailcap

              For security reasons, some special characters (i.e.: ( ) ` \ ;) are escaped in the argument before passing it to system().

       BROWSER
              Determines the web browser used to open external links (i.e., all URLs that don't start with the `file:' scheme and are not relative links in the local DVI file), and to open links for  which
              no  viewer  has  been specified in the mailcap files. The value of this variable is a colon-separated list of commands. Xdvi will try each of them in sequence until one succeeds (i.e. doesn't
              immediately return with status 0). This allows you to specify your favourite browser at the beginning, and fallback browsers at the end. Every occurrence of %s in the string  is  replaced  by
              the target URL; every occurrence of %% is replaced by a single %.  If no %s is present, the URL string is added as an extra argument.
              An example setting is:

              netscape -raise -remote 'openURL(%s,new-window)':xterm -e lynx %s:xterm -e wget %s:lynx %s:wget %s

              See

              http://www.catb.org/~esr/BROWSER/

              for more details on the BROWSER environment variable.

       TMPDIR The directory to use for storing temporary files created when uncompressing PostScript files.

       XEDITOR
              Determines the editor command used for source special `reverse search', if neither the -editor command-line option nor the .editor resource are  specified.   See  the description of the -edi‐
              tor command line option for details on the format.

       VISUAL Determines an editor to be opened in an xterm window if neither of -editor, .editor, or XEDITOR is specified.

       EDITOR Determines an editor to be opened in an xterm window if neither of -editor, .editor, XEDITOR or VISUAL is specified.

       WWWBROWSER
              Obsolete; use BROWSER instead.

LIMITATIONS
       xdvi accepts many but not all types of PostScript specials accepted by dvips.  For example, it accepts most specials generated by epsf and psfig.  It does not, however, support bop-hook or eop-hook,
       nor  does  it  allow PostScript commands to affect the rendering of things that are not PostScript (for example, the ``NEAT'' and rotated ``A'' examples in the dvips manual).  These restrictions are
       due to the design of xdvi; in all likelihood they will always remain.

       LaTeX2e rotation specials are currently not supported.

       MetaPost files containing included text are not supported.

       Xdvi's color handling doesn't support the \colorbox and \fcolorbox macros;  this is not likely to change in the near future. This also means that  e.g. colored tables (as  created  by  the  colortbl
       package)  may  render incorrectly: Text in colors different from the default foreground color may not be displayed. When the page is redrawn (e.g. after using the magnifier), the background color of
       the cells may overdraw the text.

FILES
       $HOME/.xdvirc
              A file that holds all settings that the user changed via the keys, the `Options' and the Xaw `Modes' menu and the dialogs, as X resources. These resources override the settings in $HOME/.Xde‐
              faults.  This file is ignored if the -q option is used or the noInitFile X resource is set.

       xdvi.cfg
              A  configuration  file  for  the  T1  font  setup  which  needs  to  be  supplied  in the directory determined by the XDVIINPUTS environment variable.  Please see the file http://xdvi.source‐
              forge.net/README.t1fonts if that file is missing.

SEE ALSO
       X(1), dvips(1), mktexpk(1), ps2pk(1), gsftopk(1), t1mapper(1), mailcap(4), the Kpathsea documentation, and the Xdvik home page at http://xdvi.sourceforge.net/.

AUTHORS
       Eric Cooper, CMU, did a version for direct output to a QVSS. Modified for X by Bob Scheifler, MIT Laboratory for Computer Science. Modified for X11 by Mark Eichin, MIT SIPB. Additional  enhancements
       by many others.

       The current maintainer of the original xdvi is Paul Vojta, U.C. Berkeley.

       Code  for  the xdvik variant has been contributed by many people, whose names are scattered across the source files. Xdvik is hosted on CTAN:dviware/xdvik and on SourceForge; for the most up-to-date
       information, please visit:

       http://xdvi.sourceforge.net

       Please report all bugs to the SourceForge bug tracker:

       http://sourceforge.net/tracker/?func=add&group_id=23164&atid=377580

Xdvik 22.85                                                                                       2012-04-01                                                                                          XDVI(1)
