EDB(1)                                                                                                                                      EDB(1)

NAME
       edb - graphical debugger and disassembler for executables

SYNOPSIS
        edb [OPTION]... [TARGET]

DESCRIPTION
       edb (Evan's Debugger) is a modular and modern disassembler and debugger for binary ELF files based on ptrace API and edisasm lib.

       --help Show usage and exit.

       --symbols <file>
              generate symbols map for file <file>

       --attach <pid>
              attach the process of PID <pid> to debugger

       --run <program> <args...>
              open <program> in debugger with optional <args...>

       --version
              show version string and exit.

       --dump-version
              show version and exit.

EXAMPLE
       edb --symbols /lib/libc.so.6 > libc.so.6.map

            Will generate symbols for libc and save it in a text file. It's useful if you store this map files in the symbols directory configured in edb's preferences.

       for i in $(ls /lib); do edb --symbols $i > $(basename $i).map; done

             Useful to generate maps for all libs you have in /lib.

       edb --run /bin/ls

             Will open the ls program binary in debugger.

       edb --attach 1720

            Attach the process of PID 1720 to debugger.

AUTHOR
       Written by Evan Teran <eteran@alum.rit.edu>

REPORTING BUGS
       Report any bugs or requests for features via BTS on http://bugs.codef00.com

COPYRIGHT
       Copyright  © 2008 CodeF00. Licensed GPLv2: GNU GPL version 2 <http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt>. This is free software:
       you are free to change and redistribute it. There is NO WARRANTY, to the extent permitted by law.

                                                                   December 2011                                                            EDB(1)
