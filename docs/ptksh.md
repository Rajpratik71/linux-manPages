PTKSH(1p)                                                      perl/Tk Documentation                                                     PTKSH(1p)

NAME
       ptksh - Perl/Tk script to provide a graphical user interface for testing Perl/Tk commands and scripts.

SYNOPSIS
         % ptksh  ?scriptfile?
         ... version information ...
         ptksh> $b=$mw->Button(-text=>'Hi',-command=>sub{print 'Hi'})
         ptksh> $b->pack
         ptksh> o $b
         ... list of options ...
         ptksh> help
         ... help information ...
         ptksh> exit
         %

DESCRIPTION
       ptksh is a perl/Tk shell to enter perl commands interactively.  When one starts ptksh a MainWindow is automatically created, along with a
       ptksh command window.  One can access the main window by typing commands using the variable $mw at the 'ptksh> ' prompt of the command
       window.

       ptksh supports command line editing and history.  Just type "<Up>" at the command prompt to see a history list.  The last 50 commands
       entered are saved, then reloaded into history list the next time you start ptksh.

       ptksh supports some convenient commands for inspecting Tk widgets.  See below.

       To exit ptksh use: "exit".

       ptksh is *not* a full symbolic debugger.  To debug perl/Tk programs at a low level use the more powerful perl debugger.  (Just enter ``O
       tk'' on debuggers command line to start the Tk eventloop.)

FEATURES
   History
       Press <Up> (the Up Arrow) in the perlwish window to obtain a gui-based history list.  Press <Enter> on any history line to enter it into
       the perlwish window.  Then hit return.  So, for example, repeat last command is <Up><Enter><Enter>.  You can quit the history window with
       <Escape>.  NOTE: history is only saved if exit is "graceful" (i.e. by the "exit" command from the console or by quitting all main
       windows--NOT by interrupt).

   Debugging Support
       ptksh provides some convenience function to make browsing in perl/Tk widget easier:

       ?, or h
           displays a short help summary.

       d, or x ?args, ...?
           Dumps recursively arguments to stdout. (see Data::Dumper).  You must have <Data::Dumper> installed to support this feature.

           x was introduced for perl debugger compatibility.

       p ?arg, ...?
           appends "|\n" to each of it's arguments and prints it.  If value is undef, '(undef)' is printed to stdout.

       o $widget ?-option ...?
           prints the option(s) of $widget one on each line.  If no options are given all options of the widget are listed.  See Tk::options for
           more details on the format and contents of the returned list.

       o $widget /regexp/
           Lists options of $widget matching the regular expression regexp.

       u ?class?
           If no argument is given it lists the modules loaded by the commands you executed or since the last time you called "u".

           If argument is the empty string lists all modules that are loaded by ptksh.

           If argument is a string, ``text'' it tries to do a ``use Tk::Text;''.

   Packages
       Ptksh compiles into package Tk::ptksh.  Your code is eval'ed into package main.  The coolness of this is that your eval code should not
       interfere with ptksh itself.

   Multiline Commands
       ptksh will accept multiline commands.  Simply put a "\" character immediately before the newline, and ptksh will continue your command onto
       the next line.

   Source File Support
       If you have a perl/Tk script that you want to do debugging on, try running the command

         ptksh> do 'myscript';

          -- or  (at shell command prompt) --

         % ptksh myscript

       Then use the perl/Tk commands to try out different operations on your script.

ENVIRONMENT
       Looks for your .ptksh_history in the directory specified by the $HOME environment variable ($HOMEPATH on Win32 systems).

FILES
       .ptksh_init
           If found in current directory it is read in an evaluated after the mainwindow $mw is created. .ptksh_init can contain any valid perl
           code.

       ~/.ptksh_history
           Contains the last 50 lines entered in ptksh session(s).

PITFALLS
       It is best not to use "my" in the commands you type into ptksh.  For example "my $v" will make $v local just to the command or commands
       entered until <Return> is pressed.  For a related reason, there are no file-scopy "my" variables in the ptksh code itself (else the user
       might trounce on them by accident).

BUGS
       Tk::MainLoop function interactively entered or sourced in a init or script file will block ptksh.

SEE ALSO
       Tk perldebug

VERSION
       VERSION 2.03

AUTHORS
       Mike Beller <beller@penvision.com>, Achim Bohnet <ach@mpe.mpg.de>

       Copyright (c) 1996 - 1998 Achim Bohnet and Mike Beller. All rights reserved.  This program is free software; you can redistribute it and/or
       modify it under the same terms as Perl itself.

Tk804.033                                                           2015-12-18                                                           PTKSH(1p)
