FCGISTARTER(8)                                                      fcgistarter                                                     FCGISTARTER(8)

NAME
       fcgistarter - Start a FastCGI program

SYNOPSIS
       fcgistarter -c command -p port [ -i interface ] -N num

SUMMARY
NOTE
       Currently only works on Unix systems.

OPTIONS
       -c command
              FastCGI program

       -p port
              Port which the program will listen on

       -i interface
              Interface which the program will listen on

       -N num Number of instances of the program

Apache HTTP Server                                                  2018-07-06                                                      FCGISTARTER(8)
