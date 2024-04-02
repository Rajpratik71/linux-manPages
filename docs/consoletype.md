CONSOLETYPE(1)                                                                             General Commands Manual                                                                             CONSOLETYPE(1)



NAME
       consoletype - print type of the console connected to standard input

SYNOPSIS
       consoletype [stdout] [fg]

DESCRIPTION
       consoletype prints the type of console connected to standard input, and checks whether the console connected to standard input is the current foreground virtual console. With no arguments, it prints
       vt if console is a virtual terminal (/dev/tty* or /dev/console device if not on a serial console), serial if standard input is a serial console (/dev/console or /dev/ttyS*) and pty if standard input
       is a pseudo terminal.

RETURN VALUE
       consoletype when passed no arguments returns

       0      if on virtual terminal

       1      if on serial console

       2      if on a pseudo terminal.

       When passed the stdout argument, consoletype returns

       0      in all cases, and prints the console type to stdout.

       When passed the fg argument, consoletype returns

       0      if the console connected to standard input is the current virtual terminal

       1      otherwise.



RH                                                                                               Red Hat, Inc                                                                                  CONSOLETYPE(1)
