dwz(1)                                  General Commands Manual                                 dwz(1)

NAME
       dwz - DWARF optimization and duplicate removal tool

SYNOPSIS
       dwz [OPTION...] [FILES]

DESCRIPTION
       dwz  is a program that attempts to optimize DWARF debugging information contained in ELF shared
       libraries and ELF executables for size, by  replacing  DWARF  information  representation  with
       equivalent  smaller representation where possible and by reducing the amount of duplication us‐
       ing techniques from DWARF standard appendix E - creating DW_TAG_partial_unit compilation  units
       (CUs)  for duplicated information and using DW_TAG_imported_unit to import it into each CU that
       needs it.

       The tool handles DWARF 32-bit format debugging sections of versions 2, 3 and 4 and  GNU  exten‐
       sions on top of those, though using DWARF 4 or worst case DWARF 3 is strongly recommended.

       The  tool  has two main modes of operation, without the -m option it attempts to optimize DWARF
       debugging information in each given object (executable or shared  library)  individually,  with
       the  -m  option it afterwards attempts to optimize even more by moving DWARF debugging informa‐
       tion entries (DIEs), strings and macro descriptions duplicated in more than one object  into  a
       newly  created ELF ET_REL object whose filename is given as -m option argument.  The debug sec‐
       tions in the executables and shared libraries specified on the command line are  then  modified
       again, referring to the entities in the newly created object.

OPTIONS
       -m FILE --multifile FILE
              Multifile mode.  After processing all named executables and shared libraries, attempt to
              create ELF object FILE and put debugging information duplicated in more than one  object
              there,  afterwards optimize each named executable or shared library even further if pos‐
              sible.

       -h --hardlink
              Look for executables or shared libraries hardlinked together, instead of rewriting  them
              individually rewrite just one of them and hardlink the rest to the first one again.

       -M NAME --multifile-name NAME
              Specify  the  name of the common file that should be put into the .gnu_debugaltlink sec‐
              tion alongside with its build ID.  By default dwz puts there the argument of the -m  op‐
              tion.

       -r --relative
              Specify that the name of the common file to be put into the .gnu_debugaltlink section is
              supposed to be relative path from the directory containing the executable or shared  li‐
              brary to the file named in the argument of the -m option.  Either -M or -r option can be
              specified, but not both.

       -q --quiet
              Silence up some of the most common messages.

       -o FILE --output FILE
              This option instructs dwz not to overwrite the specified file, but instead store the new
              content  into  FILE.   Nothing  is written if dwz exits with non-zero exit code.  Can be
              used only with a single executable or shared library (if there are no arguments at  all,
              a.out is assumed).

       -l COUNT --low-mem-die-limit COUNT
              Handle  executables or shared libraries containing more than COUNT debugging information
              entries in their .debug_info section using a slower and more memory usage friendly  mode
              and  don't attempt to optimize that object in multifile mode.  The default is 10 million
              DIEs.  There is a risk that for very large amounts of debugging information in a  single
              shared  library or executable there might not be enough memory (especially when dwz tool
              is 32-bit binary, it might run out of available virtual address space even sooner).

       -L COUNT --max-die-limit COUNT
              Don't attempt to optimize executables or shared libraries  containing  more  than  COUNT
              DIEs at all.  The default is 50 million DIEs.

       -? --help
              Print short help and exit.

       -v --version
              Print version number and short licensing notice and exit.

ARGUMENTS
       Command-line  arguments  should  be the executables, shared libraries or their stripped to file
       separate debug information objects.

EXAMPLES
              $ dwz -m .dwz/foobar-1.2.debug -rh \
                bin/foo.debug bin/foo2.debug foo/lib/libbar.so.debug
       will attempt to optimize debugging information in bin/foo.debug,  bin/foo2.debug  and  lib/lib‐
       bar.so.debug  (by  modifying the files in place) and when beneficial also will create .dwz/foo‐
       bar-1.2.debug  file.   .gnu_debugaltlink  section  in  the  first  two  files  will  refer   to
       ../.dwz/foobar-1.2.debug  and  in  the  last  file  to  ../../.dwz/foobar-1.2.debug.   If  e.g.
       bin/foo.debug and bin/foo2.debug were hardlinked together initially, they  will  be  hardlinked
       again and for multifile optimizations considered just as a single file rather than two.
              $ dwz -o foo.dwz foo
       will  not  modify  foo but instead store the ELF object with optimized debugging information if
       successful into foo.dwz file it creates.
              $ dwz *.debug foo/*.debug
       will attempt to optimize debugging information in *.debug  and  foo/*.debug  files,  optimizing
       each file individually in place.
              $ dwz
       is equivalent to dwz a.out command.

SEE ALSO
       http://dwarfstd.org/doc/DWARF4.pdf , gdb(1).

AUTHORS
       Jakub Jelinek <jakub@redhat.com>.

                                             15 June 2012                                       dwz(1)
