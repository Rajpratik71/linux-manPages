EXTRESSO(1)                                                   General Commands Manual                                                  EXTRESSO(1)

NAME
       extresso - wrapper for wrestool and icotool

SYNOPSIS
       extresso [OPTIONS]... [FILE]...

DESCRIPTION
       This manual page documents briefly the extresso command.  This manual page was written for the Debian GNU distribution because the original
       program does not have a manual page.

       Extresso reads resource scripts, and uses wrestool to extract the listed resources and icotool to convert them (if necessary).

OPTIONS
       These programs follow the usual GNU command line syntax, with long options starting with two dashes (`-').

       -o,--output=DIR
              Where to place extracted files (default `.').

       --format=FORMAT
              Extraction format of icon resources, passed to icotool.

       -b,--base=DIR
              Base directory of local files in scripts. (This will be appended to ``file'' lines in the scripts.)

       -i,--interactive
              Prompt before extraction.

       -v,--verbose
              Explain what is being done.

       --help Display a help message and exit.

       --version
              Output version information and exit.

EXAMPLES
       Extract all resources from shell32.dll using the resource script ``win98_shell32'', assuming it  is  available  in  ``/windows/windows/sys‐
       tem/shell32.dll'', and placing output in ``out/'':

         $ extresso ../data/resscripts/win98_shell32 --base=/windows/windows --output=out/
         $ find out/ -type f | wc -l
         339
         $

SEE ALSO
       genresscript(1), icotool(1), wrestool(1).

AUTHOR
       This manual page was written by Colin Watson <cjwatson@debian.org> and Oskar Liljeblad <oskar@osk.mine.nu>.

COPYRIGHT
       Copyright © 2001 Colin Watson

       Copyright © 2001 Oskar Liljeblad

       This is free software; see the source for copying conditions.  There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICU‐
       LAR PURPOSE.

extresso (icoutils)                                               April 18, 2005                                                       EXTRESSO(1)
