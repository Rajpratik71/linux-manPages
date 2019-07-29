RADIFF2(1)                                                  BSD General Commands Manual                                                 RADIFF2(1)

NAME
     RADIFF2 — unified binary diffing utility

SYNOPSIS
     radiff2 [-AabcCdDhOrspxvz] [-t 0-100] [-g sym] [-S algo] file1 file2

DESCRIPTION
     radiff2 implements many binary diffing algorithms for data and code.

     -A          Analyze binary after loading it with RCore (see -C) and use -AA to run aaaa instead of aaa.

     -a          Specify architecture (x86, arm, ..)

     -b          Select register size bits for given arch

     -B          Binary output (GDIFF format)

     -c          Count number of differences.

     -e -[k=v]   Specify eval config vars for all RCore instances created.

     -C          Code diffing using graphdiff algorithm. Output columns are: file-a-address, percentage of most similar function in B file | file-
                 b-address. (Use with -A to analyze the binaries to find more functions)

     -d          Use delta diffing (slower).

     -D          Show disasm instead of hexpairs (honors -a arch and -b bits)

     -g sym | off1,off2
                 Graph diff output of given symbol, or between two functions, at given offsets: one for each binary.

     -h          Show usage help message.

     -i          Compare the list of imports

     -n          Suppress address names (show only addresses) when code diffing.

     -O          Do code diffing with all bytes instead of just the fixed opcode bytes

     -p          Use physical addressing (io.va=0)

     -q          Quiet mode: disable colors and reduce output

     -r          Output in radare commands as a binary patch.

     -x          Show two column hexdump diffing.

     -s          Calculate text distance from two files.

     -ss         Same as before but using the Levenstein algorithm (faster but sometimes buggy)

     -S [name, namelen, dist, size, ...]
                 Specify which column of the code diffing algo use for diffing

     -t 0-100    Choose matching threshold for binary code diffing

     -u          Unified diff output

     -U          Unified diff output using system´s diff program

     -v          Show version information.

     -V          Be verbose sometimes

     -z          Perform diff on extracted strings

SEE ALSO
     radare2(1), rafind2(1), rahash2(1), rabin2(1), rasm2(1), ragg2(1), rarun2(1), rax2(1),

AUTHORS
     pancake <pancake@nopcode.org>

                                                                   Feb 10, 2018
