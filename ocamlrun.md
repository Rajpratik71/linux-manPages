OCAMLRUN(1)                                                   General Commands Manual                                                  OCAMLRUN(1)

NAME
       ocamlrun - The OCaml bytecode interpreter

SYNOPSIS
       ocamlrun [ options ] filename argument ...

DESCRIPTION
       The ocamlrun(1) command executes bytecode files produced by the linking phase of the ocamlc(1) command.

       The  first  non-option  argument is taken to be the name of the file containing the executable bytecode. (That file is searched in the exe‐
       cutable path as well as in the current directory.) The remaining arguments are passed to the OCaml program, in the string  array  Sys.argv.
       Element 0 of this array is the name of the bytecode executable file; elements 1 to n are the remaining arguments.

       In  most  cases,  the bytecode executable files produced by the ocamlc(1) command are self-executable, and manage to launch the ocamlrun(1)
       command on themselves automatically.

OPTIONS
       The following command-line options are recognized by ocamlrun(1).

       -b     When the program aborts due to an uncaught exception, print a detailed "back trace" of the execution, showing  where  the  exception
              was  raised and which function calls were outstanding at this point.  The back trace is printed only if the bytecode executable con‐
              tains debugging information, i.e. was compiled and linked with the -g option to ocamlc(1) set.  This option is equivalent to setting
              the b flag in the OCAMLRUNPARAM environment variable (see below).

       -I dir Search the directory dir for dynamically-loaded libraries, in addition to the standard search path.

       -p     Print the names of the primitives known to this version of ocamlrun(1) and exit.

       -v     Direct  the  memory  manager  to  print verbose messages on standard error.  This is equivalent to setting v=63 in the OCAMLRUNPARAM
              environment variable (see below).

       -version
              Print version string and exit.

       -vnum  Print short version number and exit.

ENVIRONMENT VARIABLES
       The following environment variable are also consulted:

       CAML_LD_LIBRARY_PATH
              Additional directories to search for dynamically-loaded libraries.

       OCAMLLIB
              The directory containing the OCaml standard library.  (If OCAMLLIB is not set, CAMLLIB will be used instead.)  Used  to  locate  the
              ld.conf configuration file for dynamic loading.  If not set, default to the library directory specified when compiling OCaml.

       OCAMLRUNPARAM
              Set the runtime system options and garbage collection parameters.  (If OCAMLRUNPARAM is not set, CAMLRUNPARAM will be used instead.)
              This variable must be a sequence of parameter specifications.  A parameter specification is an option letter followed by an =  sign,
              a  decimal  number (or a hexadecimal number prefixed by 0x), and an optional multiplier.  The options are documented below; the last
              six correspond to the fields of the control record documented in The OCaml user's manual, chapter "Standard Library", section "Gc".

       b      Trigger the printing of a stack backtrace when an uncaught exception aborts the program.  This option takes no argument.

       p      Turn on debugging support for ocamlyacc-generated parsers.  When this option is on, the pushdown automaton that executes the parsers
              prints a trace of its actions.  This option takes no argument.

       R      Turn on randomization of all hash tables by default (see the Hashtbl module of the standard library). This option takes no argument.

       h      The initial size of the major heap (in words).

       a (allocation_policy)
              The  policy  used  for allocating in the OCaml heap.  Possible values are 0 for the next-fit policy, and 1 for the first-fit policy.
              Next-fit is usually faster, but first-fit is better for avoiding fragmentation and the associated heap compactions.

       s (minor_heap_size)
              The size of the minor heap (in words).

       i (major_heap_increment)
              The default size increment for the major heap (in words).

       o (space_overhead)
              The major GC speed setting.

       O (max_overhead)
              The heap compaction trigger setting.

       l (stack_limit)
              The limit (in words) of the stack size.

       v (verbose)
              What GC messages to print to stderr.  This is a sum of values selected from the following:

              0x001 Start of major GC cycle.

              0x002 Minor collection and major GC slice.

              0x004 Growing and shrinking of the heap.

              0x008 Resizing of stacks and memory manager tables.

              0x010 Heap compaction.

              0x020 Change of GC parameters.

              0x040 Computation of major GC slice size.

              0x080 Calling of finalisation functions.

              0x100 Startup messages (loading the bytecode executable file, resolving shared libraries).

              0x200 Computation of compaction-triggering condition.

              The multiplier is k, M, or G, for multiplication by 2^10, 2^20, and 2^30 respectively.  For example, on a 32-bit machine under bash,
              the  command  export  OCAMLRUNPARAM='s=256k,v=1' tells a subsequent ocamlrun to set its initial minor heap size to 1 megabyte and to
              print a message at the start of each major GC cycle.

       CAMLRUNPARAM
              If OCAMLRUNPARAM is not found in the environment, then CAMLRUNPARAM will be used instead.  If CAMLRUNPARAM is not  found,  then  the
              default values will be used.

       PATH   List of directories searched to find the bytecode executable file.

SEE ALSO
       ocamlc(1).
       The OCaml user's manual, chapter "Runtime system".

                                                                                                                                       OCAMLRUN(1)
