wordview(1)                                                   General Commands Manual                                                  wordview(1)

NAME
       wordview - displays text contained in MS-Word file in X window

SYNOPSIS
       wordview [ filename]

DESCRIPTION
       wordview  is simple GUI wrapper around catdoc(1) which allows to browse through word file interactively. It doesn't allow to edit file, but
       allows to save plain text representation (or version with some TeX commands) into the file.

       If for some reason catdoc doesn't recognize file encoding properly, wordview allows to specify encoding interactively.

OPTIONS
       wordview supports standard X options, supported by wish(1)

X RESOURCES
       Following X resources can be used to customize wordviewlook:

       Wordview.Text.Background
               background color for main window

       Wordview.Text.Foreground
               Foreground color for main window

       Wordview.Text.selectBackground
               Background color of selected text

       Wordview.Text.selectForeground
               Foreground color of selected text

       Wordview.Text.Font
               Font to display text. We recommend to use fixed-width font, such as Courier, becouse catdoc(1) is intended  to  convert  Word  into
               text.  Either  XLFD font names or Tk-style font specifications like {Courier 12pt} can be used for specifying font. If you use XLFD
               font names, usage of unicode (iso10646-1) fonts is recommended.

       Wordview.Text.findMode
               How to search text. This option can have value either exact or regexp and specifis whether text is searched for exact match or  for
               regular expression by default. This behavoir can be toggled interactively via checkbox in the search dialog.

       Wordview.Text.findCase
               This boolean option controls whether search is case-sensitive.  Default is no.

       Wordview.Menu.highlightBackground
               Background color for highlighted menu item

       Wordview.Menu.highlightThickness

       Wordview.Menu.activeBackground
               Background color of active menu item.

       Wordview.Menu.activeBorderWidth
               Width  (in  pixels) of  border around highlighted menu item. Default is 0, which differs from Tk global default. See options(n) for
               more details.

       A lot of other resource options which affect behavoir of standard Tk widgets can affect wordview. See Tcl/Tk manual pages for more informa‐
       tion.

SEE ALSO
       catdoc(1),wish(1),options(n)

AUTHOR
       Victor Wagner <vitus@45.free.net>.

MS-Word reader                                                    Version 0.94.3                                                       wordview(1)
