synctex(1)                                                                     BSD General Commands Manual                                                                     synctex(1)

NAME
     synctex — command line client tool to support the Synchronize TeXnology available in most TeX engines.

SYNOPSIS
     synctex command [options] [args]

OVERVIEW
     The Synchronization TeXnology is a feature of recent TeX engines.  It allows to synchronize between input and output, which means to navigate from the source document to the type‐
     set material and vice versa.

     Run `synctex help' to access the built-in tool documentation.

TEX ENGINE OPTION -synctex=NUMBER
     ·   If NUMBER=0 or no option is given, no synctex file is created.

     ·   If NUMBER<0, synctex files are text files.

     ·   If NUMBER>0, synctex files are compressed with gz.

     ·   If NUMBER&2, no .gz extension is used.

     ·   If NUMBER&4, activate form support, useful for pdftex.

     ·   If NUMBER&8, better file compression.

     Use for example `pdftex -synctex=15 foo.tex' to activate all the options.

     Notice that LuaTeX option is `--synctex=NUMBER' with two dashes.

SEE ALSO
     synctex(5) tex(1)

AUTHOR
     The Synchronize TeXnology is essentially due to Jerome Laurens, with useful suggestions by some well known actors of the TeX world.

HISTORY
     Revised on Sun Apr 23 09:54:20 UTC 2017.

                                                                                      July 30, 2019
