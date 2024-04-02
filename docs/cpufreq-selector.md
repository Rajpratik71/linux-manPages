cpufreq-selector(1)                                           General Commands Manual                                          cpufreq-selector(1)

NAME
       cpufreq-selector — tool to set CPU frequency

SYNOPSIS
       cpufreq-selector [-c CPU]  [-g GOV]  [-f FREQ]

DESCRIPTION
       cpufreq-selector is a command-line tool for choosing CPU frequency settings.

OPTIONS
       This program follows the usual GNU command line syntax, with long options starting with two dashes (`-').  A summary of options is included
       below.

       -?,    --help         " 10 Show summary of options.

       -c NUMBER,
              --cpu=NUMBER         " 10 number of CPU to set.  If omitted, zeroth CPU is implied.

       -g GOV,
              --governor=GOV         " 10 CPU governor to use, such as ``powersave'', ``performance''.

       -f FREQ,
              --freq=FREQ         " 10 CPU frequency to use, in kHz.

AUTHOR
       cpufreq-selector, as part of gnome-applets, was written by Carlos García Campos carlosgc@gnome.org and other GNOME contributors.

       This manual page was written by Theppitak Karoonboonyanan thep@linux.thai.net for the Debian system (but may be used by  others).   Permis‐
       sion is granted to copy, distribute and/or modify this document under the terms of the GNU General Public License, Version 2 any later ver‐
       sion published by the Free Software Foundation.

       On Debian systems, the complete text of the GNU General Public License can be found in /usr/share/common-licenses/GPL.

                                                                                                                               cpufreq-selector(1)
