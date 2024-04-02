bbrun(1)                                                              bbtools                                                             bbrun(1)

NAME
       bbrun - An elegant tool for the Blackbox window manager that runs commands

SYNTAX
       bbrun [OPTIONS] [-- [-display <display>]]...

DESCRIPTION
       bbrun  is  a small but very useful application. It makes it convenient to quickly execute commands from the blackbox or fluxbox window man‐
       agers. bbrun is very similar to KDE's Alt+F2 Run Command dialog box. When launched, it occupies a small portion of the  desktop  and  docks
       itself to the right side of the screen.  The run dialog is opened by clicking on the tiny bbrun window.

       You  don't necessarily need blackbox for this program to work. It looks just as good in fluxbox, but it won't look the same in other window
       managers.

FILES
       ~/.bbrun_history

OPTIONS
       -a, --advanced - advanced mode, shows more options than the normal command entry box.  The default is  for  it  to  be  in  normal  (tradi‐
       tional/simple) mode.

       -h, --help - this help screen

       -i, --history-file=<history file> - set the history file to use. (default:
        ~/.bbrun_history)

       -v, --version - print the version number

       -w, --withdraw - withdrawn mode, will go straight to command entry box

       Options that must occur after '--' if they are used:

       -display <display> - set the display that the gearbox should show up on

GENERAL USAGE INFO
       bbrun can be run in normal mode where it creates an icon that sits in the slit.  You can then click on the gear icon to make the text entry
       window popup.  You can also run bbrun in withdrawn mode by specifying the -w flag. This is ideal for use  with  the  key  shortcut  program
       bbkeys  since  it will jump straight to the text entry screen.  bbrun also supports the 'escape' and 'enter' keys for those of you who like
       to use the mouse as little as possbile.

       bbrun keeps a history of your most recent commands. The history list is stored in the '.bbrun_history' file in your home directory. If  the
       file does not exist it is created automatically.

       Also keep in mind that you need quotes when you specify arguments with spaces in them.  eg. mpg123 '/mp3/Creed - Higher.mp3'

       This file was updated by Kevin Coyner <kcoyner@debian.org> on February 12, 2007.

Josh King <jking@dwave.net>                                             1.6                                                               bbrun(1)
