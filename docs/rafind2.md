RAFIND2(1)                                                  BSD General Commands Manual                                                 RAFIND2(1)

NAME
     rafind2 — Advanced commandline hexadecimal editor

SYNOPSIS
     rafind2 [-izZXnrhqv] [-b size] [-f from] [-t to] [-[m|s|e] str] [-x hex] file|dir

DESCRIPTION
     rafind2 is a program to find byte patterns into files

     The options are:

     -z          Search for zero-terminated strings

     -a align    Only accept aligned hits

     -s str      Search for a specific string

     -S str      Search for a specific wide string

     -e regex    Search for a regular expression string matches

     -x hex      Search for an hexpair string

     -i          Identify filetype (like file, uses r2 -qcpm)

     -m          Carve for known file-types using the r_magic signatures

     -M mask     Set binary mask to be applied

     -f from     Specify the source adddress

     -t to       Specify the target adddress

     -X          Display hexdump of search results

     -Z          Display zero-terminated strings results

     -n          Do not stop the search when a read error occurs

     -r          Show output in radare commands

     -b size     Define block size

     -q          Quiet mode - do not show headings (filenames) above matching contents (default for searching a single file)

     -h          Show help message

     -v          Print version and exit

SEE ALSO
     radare2(1), rahash2(1), rabin2(1), radiff2(1), rasm2(1), ragg2(1), rarun2(1), rax2(1),

AUTHORS
     pancake <pancake@nopcode.org>

                                                                   Oct 19, 2015
