rendercheck(1)                                                                           General Commands Manual                                                                           rendercheck(1)

NAME
       rendercheck - simple tests of the X Render extension.

SYNOPSIS
       rendercheck [-d|--display display] [-i|--iter] [--sync] [-t|--tests test1,test2,test3,...] [-o|--ops op1,op2,op3,...]
       [-v|--verbose] [--minimalrendering]

DESCRIPTION
       rendercheck is a set of simple tests of the X Render extension.  It is designed for authors of Render implementations in X Servers.

OPTIONS
       -d|--display display
              Specifies the display to test against.

       -i|--iter iterations
              Specifies  the  number  of  times to repeat each operation before sampling results.  Some X Servers may behave differently (hardware vs software rendering paths) depending on the previous
              operations done, so this may be used to influence the server's choices.

       --sync Enables synchronous xlib operation, for debugging.

       -t|--tests test1,test2,test3...
              Enables only a specific subset of the possible tests.  Test names include fill, dcoords, scoords, mcoords, tscoords, tmcoords, blend, composite, cacomposite, gradients, repeat, triangles,
              and bug7366.  Names must be separated by commas and have no spaces.

       -f|--formats format1,format2,format3...
              Enables only a specific subset of the possible formats.  Only formats listed in the server-supported format list are available.  Names must be separated by commas and have no spaces.

       -o|--ops
              Enables only a specific subset of the Render operators.

       -v|--verbose
              Enables verbose printing of information on tests run, and successes and failures.

       --minimalrendering
              Disables copying of offscreen destinations to the window, which is on by default to provide the user with visual feedback.

BUGS
       Several limitations are documented in the TODO file accompanying the source.  Please report any further bugs you find to http://bugs.freedesktop.org/.

AUTHORS
       Eric Anholt, with help from Keith Packard.

X Version 11                                                                                 rendercheck 1.4                                                                               rendercheck(1)
