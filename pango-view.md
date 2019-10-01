PANGO-VIEW(1)                                                                                   User Commands                                                                                   PANGO-VIEW(1)



NAME
       pango-view - Pango text viewer

DESCRIPTION
   Usage:
              pango-view [OPTION?] - FILE

   Help Options:
       -h, --help
              Show help options

       --help-all
              Show all help options

       --help-cairo
              Options understood by the cairo backend

   Cairo backend options:
       --annotate=1 or 2
              Annotate the output

   Application Options:
       --no-auto-dir
              No layout direction according to contents

       --backend=cairo/xft/ft2
              Pango backend to use for rendering (default: cairo)

       --background=red/#rrggbb/#rrggbbaa/transparent
              Set the background color

       -q, --no-display
              Do not display (just write to file or whatever)

       --dpi=number
              Set the resolution

       --align=left/center/right
              Text alignment

       --ellipsize=start/middle/end
              Ellipsization mode

       --font=description
              Set the font description

       --foreground=red/#rrggbb/#rrggbbaa
              Set the text color

       --gravity=south/east/north/west/auto
              Base gravity: glyph rotation

       --gravity-hint=natural/strong/line
              Gravity hint

       --header
              Display the options in the output

       --height=+points/-numlines
              Height in points (positive) or number of lines (negative) for ellipsizing

       --hinting=none/auto/full
              Hinting style

       --indent=points
              Width in points to indent paragraphs

       --justify
              Align paragraph lines to be justified

       --language=en_US/etc
              Language to use for font selection

       --margin=CSS-style numbers in pixels
              Set the margin on the output in pixels

       --markup
              Interpret text as Pango markup

       -o, --output=file
              Save rendered image to output file

       --pixels
              Use pixel units instead of points (sets dpi to 72)

       --rtl  Set base direction to right-to-left

       --rotate=degrees
              Angle at which to rotate results

       -n, --runs=integer
              Run Pango layout engine this many times

       --single-par
              Enable single-paragraph mode

       -t, --text=string
              Text to display (instead of a file)

       --version
              Show version numbers

       --waterfall
              Create a waterfall display

       -w, --width=points
              Width in points to which to wrap lines or ellipsize

       --wrap=word/char/word-char
              Text wrapping mode (needs a width to be set)



pango-view (pango) 1.42.3                                                                       September 2019                                                                                  PANGO-VIEW(1)
