RARUN2(1)                                                   BSD General Commands Manual                                                  RARUN2(1)

NAME
     rarun2 — radare2 utility to run programs in exotic environments

SYNOPSIS
     rarun2 [[directives]] [[script.rr2]] [[--] [program] [args]]

DESCRIPTION
     This program is used as a launcher for running programs with different environment, arguments, permissions, directories and overridden
     default filedescriptors.

     rarun2 -t will show the terminal name and wait for a connection from another process. try rarun2 stdio=<ttypath> program=/bin/sh

     The program just accepts a single argument which is the filename of the configuration file to run the program.

     It is useful when you have to run a program using long arguments or pass long data to stdin or things like that usually required for exploit‐
     ing crackmes :)

DIRECTIVES
     The rr2 (rarun2) configuration file accepts the following directives, described as key=value entries and comments defined as lines starting
     with '#'.

     arg[0-N]    set value for argument N passed to the program

     aslr        enable or disable ASLR

     bits        set 32 or 64 bit (if the architecture supports it)

     chdir       change directory before executing the program

     chroot      run the program in chroot. requires some previous setup

     clearenv    unset the whole environment

     core        set no limit the core file size

     connect     connect stdin/stdout/stderr to a socket

     pty         use a pty for connection over socket (with connect/listen)

     envfile     set a file with lines like `var=value` to be used as env

     fork        used with the listen option, allow to spawn a different process for each connection. Ignored when debugging.

     input       set string to be passed to the program via stdin

     libpath     override path where the dynamic loader will look for shared libraries

     listen      bound stdin/stdout/stderr to a listening socket

     maxstack    set the maximum size for the stack

     maxproc     set the maximum number of processes

     maxfd       set the maximum number of file descriptors

     nice        set the niceness level of the process

     preload     preload a library (not supported on Windows, only linux,osx,bsd)

     program     path to program to be executed

     execve      use execve instead of posix_spawn (osx tricks)

     runlib      path to the library to be executed

     runlib.fcn  function name to call from runlib library

     r2preload   preload with libr2, kill -USR1 to get an r2 shell or -USR2 to spawn a webserver in a thread

     r2preweb    run the webserver in a thread just at starting the r2preload

     setenv      set value for given environment variable

     setegid     set effective process group id

     seteuid     set effective process uid

     setgid      set process group id

     setuid      set process uid

     sleep       sleep for the given amount of seconds

     stdin       select file to read data from stdin

     stdout      select file to replace stdout file descriptor

     system      execute the given command

     timeout     set a timeout

     timeoutsig  signal to use when killing the child because the timeout happens

     unsetenv    unset one environment variable

VALUE PREFIXES
     Every value in this configuration file can contain a special

     @filename   Slurp contents of file and put them inside the key

     text        Escape characters useful for hex chars

     'string'    Escape characters useful for hex chars

     !cmd        Run command to store the output in the variable

     :102030     Parse hexpair string and store it in the variable

     :!cmd       Parse hexpair string from output of command and store it in the variable

     %1234       Parses the input string and returns it as integer

EXAMPLES
     Sample rarun2 script

       $ cat foo.rr2
       #!/usr/bin/rarun2
       program=./pp400
       arg0=10
       stdin=foo.txt
       chdir=/tmp
       clearenv=true
       setenv=EGG=eggsy
       setenv=NOFUN=nogames
       unsetenv=NOFUN
       # EGG will be the only env variable
       #chroot=.
       ./foo.rr2

     Connecting a program to a socket

       $ nc -l 9999
       $ rarun2 program=/bin/ls connect=localhost:9999

     Debugging a program redirecting io to another terminal

       ## open a new terminal and type 'tty' to get
       $ tty ; clear ; sleep 999999
       /dev/ttyS010
       ## in another terminal run r2
       $ r2 -e dbg.profile=foo.rr2 -d ls
       ## or you can use -R option
       $ r2 -R foo.rr2 -d ls
       $ cat foo.rr2
       #!/usr/bin/rarun2
       stdio=/dev/ttys010

     You can also use the -- flag to specify program and arguments in a more natural way:

       $ rarun2 timeout=2 -- sleep 4

     Run a library function

       $ rarun2 runlib=/lib/libc-2.25.so runlib.fcn=system arg1="ls /"

SEE ALSO
     radare2(1), rahash2(1), rafind2(1), rabin2(1), radiff2(1), ragg2(1), rasm2(1),

AUTHORS
     Written by pancake <pancake@nopcode.org>

                                                                    Feb 3, 2017
