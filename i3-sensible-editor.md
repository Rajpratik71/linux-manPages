I3-SENSIBLE-EDITOR(1)                                                i3 Manual                                               I3-SENSIBLE-EDITOR(1)

NAME
       i3-sensible-editor - launches $EDITOR with fallbacks

SYNOPSIS
       i3-sensible-editor [arguments]

DESCRIPTION
       i3-sensible-editor is used by i3-nagbar(1) when you click on the edit button.

       It tries to start one of the following (in that order):

       ·   $VISUAL

       ·   $EDITOR

       ·   nano

       ·   vim

       ·   vi

       ·   emacs

       ·   pico

       ·   qe

       ·   mg

       ·   jed

       ·   gedit

       ·   mc-edit

       Please don’t complain about the order: If the user has any preference, they will have $VISUAL or $EDITOR set.

SEE ALSO
       i3(1)

AUTHOR
       Michael Stapelberg and contributors

i3 4.11                                                             10/24/2015                                               I3-SENSIBLE-EDITOR(1)
