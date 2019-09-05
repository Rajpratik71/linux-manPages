nemiver(1)                                                    General Commands Manual                                                   nemiver(1)

NAME
       nemiver - graphical debugger for GNOME

SYNOPSIS
       nemiver [options] [<prog-to-debug> [prog-args]]

DESCRIPTION
       This manual page documents briefly the nemiver command.

       nemiver  is  a  standalone graphical debugger that integrates well in the GNOME desktop environment.  It currently features a backend which
       uses the well known GNU Debugger gdb to debug C/C++ programs.

OPTIONS
       These programs follow the usual GNU command line syntax, with long options starting with  two  dashes  (`-').   A  summary  of  options  is
       included below.

       -?, --help
              Show help options.

       -v, --version
              Show version of program.

       --env=" var0=val0 var1=val1 var2=val2 ... "
              Display the value of an expression.

       --attach=<pid|process_name>
              Attach to a process.

       --listsessions
              List the saved debugging sessions.

       --purgesessions
              Erase the saved debugging sessions.

       --executesession=N
              Debug the program that was of session number N

       --log-domains=DOMAINS
              Enable logging domains DOMAINS

       --logdebuggeroutput
              Log the debugger output.

BUGS
       If you find a bug, please report it at http://bugzilla.gnome.org/enter_bug.cgi?product=nemiver.

AUTHOR
       nemiver was written by Dodji Seketeli <dodji@gnome.org> and Jonathon Jongsma <jjongsma@gnome.org>.

       This manual page was written by Luca Bruno <lucab@debian.org>, for the Debian project (but may be used by others).

                                                                  06 January 2008                                                       nemiver(1)
