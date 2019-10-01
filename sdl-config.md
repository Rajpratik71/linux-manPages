sdl-config(1)                                                                              General Commands Manual                                                                              sdl-config(1)



NAME
       sdl-config - script to get information about the installed version of SDL

SYNOPSIS
       sdl-config [ --prefix[=DIR] ] [ --exec-prefix[=DIR] ] [ --version ] [ --cflags ] [ --libs ] [ --static-libs ]

DESCRIPTION
       sdl-config is a tool that is used to configure and determine the compiler and linker flags that should be used to compile and link programs, and libraries, and plugins that use SDL.  It is also used
       internally by the m4 macros that are included with SDL.

OPTIONS
       --cflags
              Print the compiler flags that are necessary to compile a program or library that uses SDL.

       --exec-prefix=DIR
              If specified, use DIR instead of the installation exec prefix that SDL was build with when computing the output for the --exec-prefix option. This option must be specified before any  of  the
              --cflags, and --libs options.

       --libs Print the linker flags that are necessary to link a program that uses SDL.

       --prefix=DIR
              If  specified, use DIR instead of the installation prefix that SDL was built with when computing the output for the --prefix, and --exec-prefix options.  This option is also used for the exec
              prefix if --exec-prefix was not specified. This option must be specified before any of the --cflags, and --libs options.

       --static-libs
              Print the linker flags that are necessary to statically link a program that uses SDL.

       --version
              Prints the currently installed version of SDL on standard output.

EXAMPLES
       gcc -o main.o $(sdl-config --cflags) main.c
              is how you might use sdl-config to compile a C source file for an executable program.

       gcc -o my_app $(sdl-config --libs) main.o util.o
              is how you might use sdl-config to link compiled objects into an executable program.

AUTHOR
       The Simple DirectMedia Layer (SDL) library was written by Sam Lantinga.

       This manual page was written by Branden Robinson, originally for Progeny Linux Systems, Inc., and the Debian Project.

       This manual page was modified by Petr Pisar to match original SDL distribution.



SDL 1.2                                                                                           2013-06-19                                                                                    sdl-config(1)
