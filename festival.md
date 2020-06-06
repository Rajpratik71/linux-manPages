FESTIVAL(1)                                                                                General Commands Manual                                                                                FESTIVAL(1)



NAME
       festival - a text-to-speech system.

SYNOPSIS
       festival [options] [file0] [file1] ...



DESCRIPTION
       Festival  is  a  general purpose text-to-speech system.  As well as simply rendering text as speech it can be used in an interactive command mode for testing and developing various aspects of speech
       synthesis technology.

       Festival has two major modes, command and tts (text-to-speech).  When in command mode input (from file or interactively) is interpreted by the command interpreter.  When in tts mode  input  is  ren‐
       dered as speech.  When in command mode filenames that start with a left paranthesis are treated as literal commands and evaluated.


OPTIONS
       -q      Load no default setup files

       --libdir <string>
               Set library directory pathname

       -b      Run in batch mode (no interaction)

       --batch Run in batch mode (no interaction)

       --tts   Synthesize text in files as speech no files means read from stdin (implies no interaction by default)

       -i      Run in interactive mode (default)

       --interactive
               Run in interactive mode (default)

       --pipe  Run in pipe mode, reading commands from stdin, but no prompt or return values are printed (default if stdin not a tty)

       --language <string>
               Run in named language, default is english, spanish and welsh are available

       --server
               Run in server mode waiting for clients of server_port (1314)

       --script
               <ifile> Used in #! scripts, runs in batch mode on file and passes all other args to Scheme

       --heap <int> {1000000}
               Set size of Lisp heap, should not normally need to be changed from its default

       -v      Display version number and exit

       --version
               Display version number and exit

BUGS
       More than you can imagine.

       A manual with much detail (though not complete) is available in distributed as part of the system and is also accessible at
       http://www.cstr.ed.ac.uk/projects/festival/manual/

       Although we cannot guarantee the time required to fix bugs, we would appreciated it if they were reported to
       festival-bug@cstr.ed.ac.uk


AUTHOR
       Alan W Black, Richard Caley and Paul Taylor
       (C) Centre for Speech Technology Research, 1996-1998
       University of Edinburgh
       80 South Bridge
       Edinburgh EH1 1HN
       http://www.cstr.ed.ac.uk/projects/festival.html



                                                                                                 6th Apr 1998                                                                                     FESTIVAL(1)
