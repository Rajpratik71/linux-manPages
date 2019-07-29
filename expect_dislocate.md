DISLOCATE(1)                                                  General Commands Manual                                                 DISLOCATE(1)

NAME
       Dislocate - disconnect and reconnect processes

SYNOPSIS
       dislocate [ program args...  ]

INTRODUCTION
       Dislocate allows processes to be disconnected and reconnected to the terminal.  Possible uses:

              ·   You can disconnect a process from a terminal at work and reconnect from home, to continue working.

              ·   After having your line be dropped due to noise, you can get back to your process without having to restart it from scratch.

              ·   If  you  have  a problem that you would like to show someone, you can set up the scenario at your own terminal, disconnect, walk
                  down the hall, and reconnect on another terminal.

              ·   If you are in the middle of a great game (or whatever) that does not allow you to save, and someone else kicks you off the  ter‐
                  minal, you can disconnect, and reconnect later.

USAGE
       When run with no arguments, Dislocate tells you about your disconnected processes and lets you reconnect to one.  Otherwise, Dislocate runs
       the named program along with any arguments.

       By default, ^] is an escape that lets you talk to Dislocate itself.  At that point, you can disconnect (by pressing ^D) or  suspend  Dislo‐
       cate (by pressing ^Z).

       Any  Tcl  or  Expect  command  is also acceptable at this point.  For example, to insert the contents of a the file /etc/motd as if you had
       typed it, say:

            send -i $out [exec cat /etc/motd]

       To send the numbers 1 to 100 in response to the prompt "next #", say:

            for {set i 0} {$i<100} {incr i} {
                expect -i $in "next #"
                send -i $out "$i\r"
            }

       Scripts can also be prepared and sourced in so that you don't have to type them on the spot.

       Dislocate is actually just a simple Expect script.  Feel free to make it do what you want it to do or just  use  Expect  directly,  without
       going through Dislocate.  Dislocate understands a few special arguments.  These should appear before any program name.  Each should be sep‐
       arated by whitespace.  If the arguments themselves takes arguments, these should also be separated by whitespace.

       The -escape flag sets the escape to whatever follows.  The default escape is ^].

CAVEATS
       This program was written by the author as an exercise to show that communicating with disconnected processes is easy.  There are many  fea‐
       tures that could be added, but that is not the intent of this program.

SEE ALSO
       Tcl(3), libexpect(3)
       "Exploring Expect: A Tcl-Based Toolkit for Automating Interactive Programs" by Don Libes, O'Reilly and Associates, January 1995.

AUTHOR
       Don Libes, National Institute of Standards and Technology

                                                                  7 October 1993                                                      DISLOCATE(1)
