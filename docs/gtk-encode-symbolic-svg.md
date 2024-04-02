GTK-ENCODE-SYMBOLI(1)                                                                           User Commands                                                                           GTK-ENCODE-SYMBOLI(1)



NAME
       gtk-encode-symbolic-svg - Symbolic icon conversion utility

SYNOPSIS
       gtk-encode-symbolic-svg [OPTION...] PATH WIDTHxHEIGHT

DESCRIPTION
       gtk-encode-symbolic-svg converts symbolic svg icons into specially prepared png files. GTK+ can load and recolor these pngs, just like original svgs, but loading them is much faster.

       PATH is the name of a symbolic svg file, WIDTHxHEIGHT are the desired dimensions for the generated png file.

       To distinguish them from ordinary pngs, the generated files have the extension .symbolic.png.

OPTIONS
       -o DIRECTORY, --output DIRECTORY
           Write png files to DIRECTORY instead of the current working directory.



GTK+                                                                                                                                                                                    GTK-ENCODE-SYMBOLI(1)
