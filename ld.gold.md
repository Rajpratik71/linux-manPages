GOLD(1)                                                            User Commands                                                           GOLD(1)

NAME
       gold - The GNU ELF linker

SYNOPSIS
       ld.gold [options] file...

OPTIONS
       --help Report usage information

       -v, --version
              Report version information

       -V     Report version and target information

       --add-needed
              Not supported

       --no-add-needed
              Do not copy DT_NEEDED tags from shared libraries

       --allow-multiple-definition Allow multiple definitions of symbols

       --no-allow-multiple-definition
              Do not allow multiple definitions

       --allow-shlib-undefined
              Allow unresolved references in shared libraries

       --no-allow-shlib-undefined
              Do not allow unresolved references in shared libraries

       --as-needed
              Only set DT_NEEDED for shared libraries if used

       --no-as-needed
              Always DT_NEEDED for shared libraries

       -assert [ignored]
              Ignored

       -b [elf,binary], --format [elf,binary]
              Set input format

       -Bdynamic                   -l searches for shared libraries

       -Bstatic                    -l does not search for shared libraries

       -dy    alias for -Bdynamic

       -dn    alias for -Bstatic

       -Bgroup
              Use group name lookup rules for shared library

       -Bsymbolic
              Bind defined symbols locally

       -Bsymbolic-functions
              Bind defined function symbols locally

       --build-id [=STYLE]
              Generate build ID note

       --build-id-chunk-size-for-treehash SIZE
              Chunk size for '--build-id=tree'

       --build-id-min-file-size-for-treehash SIZE
              Minimum output file size for '--build-id=tree' to work differently than '--build-id=sha1'

       --check-sections
              Check segment addresses for overlaps (default)

       --no-check-sections
              Do not check segment addresses for overlaps

       --compress-debug-sections [none,zlib]
              Compress .debug_* sections in the output file

       --copy-dt-needed-entries
              Not supported

       --no-copy-dt-needed-entries Do not copy DT_NEEDED tags from shared libraries

       --cref
              Output cross reference table

       --no-cref
              Do not output cross reference table

       --ctors-in-init-array
              Use DT_INIT_ARRAY for all constructors (default)

       --no-ctors-in-init-array
              Handle constructors as directed by compiler

       -d, --define-common
              Define common symbols

       --no-define-common
              Do not define common symbols

       -dc    Alias for -d

       -dp    Alias for -d

       --debug [all,files,script,task][,...]
              Turn on debugging

       --defsym SYMBOL=EXPRESSION
              Define a symbol

       --demangle [=STYLE]
              Demangle C++ symbols in log messages

       --no-demangle
              Do not demangle C++ symbols in log messages

       --detect-odr-violations
              Look for violations of the C++ One Definition Rule

       --no-detect-odr-violations
              Do not look for violations of the C++ One Definition Rule

       -x, --discard-all
              Delete all local symbols

       -X, --discard-locals
              Delete all temporary local symbols

       --dynamic-list-data
              Add data symbols to dynamic symbols

       --dynamic-list-cpp-new
              Add C++ operator new/delete to dynamic symbols

       --dynamic-list-cpp-typeinfo Add C++ typeinfo to dynamic symbols

       --dynamic-list FILE
              Read a list of dynamic symbols

       -e ADDRESS, --entry ADDRESS Set program start address

       --exclude-libs lib,lib ...
              Exclude libraries from automatic export

       -E, --export-dynamic
              Export all dynamic symbols

       --no-export-dynamic
              Do not export all dynamic symbols (default)

       --export-dynamic-symbol SYMBOL
              Export SYMBOL to dynamic symbol table

       -EB    Link big-endian objects.

       -EL    Link little-endian objects.

       --eh-frame-hdr
              Create exception frame header

       --no-enum-size-warning
              (ARM only) Do not warn about objects with incompatible enum sizes

       -f SHLIB, --auxiliary SHLIB Auxiliary filter for shared object symbol table

       -F SHLIB, --filter SHLIB
              Filter for shared object symbol table

       --fatal-warnings
              Treat warnings as errors

       --no-fatal-warnings
              Do not treat warnings as errors

       -fini SYMBOL
              Call SYMBOL at unload-time

       --fix-cortex-a8
              (ARM only) Fix binaries for Cortex-A8 erratum.

       --no-fix-cortex-a8
              (ARM only) Do not fix binaries for Cortex-A8 erratum.

       --fix-arm1176
              (ARM only) Fix binaries for ARM1176 erratum.

       --no-fix-arm1176
              (ARM only) Do not fix binaries for ARM1176 erratum.

       --merge-exidx-entries
              (ARM only) Merge exidx entries in debuginfo.

       --no-merge-exidx-entries
              (ARM only) Do not merge exidx entries in debuginfo.

       --fix-v4bx
              (ARM only) Rewrite BX rn as MOV pc, rn for ARMv4

       --fix-v4bx-interworking
              (ARM only) Rewrite BX rn branch to ARMv4 interworking veneer

       -g     Ignored

       --gdb-index
              Generate .gdb_index section

       --no-gdb-index
              Do not generate .gdb_index section

       --gnu-unique
              Enable STB_GNU_UNIQUE symbol binding (default)

       --no-gnu-unique
              Disable STB_GNU_UNIQUE symbol binding

       -h FILENAME, -soname FILENAME
              Set shared library name

       --hash-bucket-empty-fraction FRACTION
              Min fraction of empty buckets in dynamic hash

       --hash-style [sysv,gnu,both]
              Dynamic hash style

       -I PROGRAM, --dynamic-linker PROGRAM
              Set dynamic linker path

       --incremental
              Do an incremental link if possible; otherwise, do a full link and prepare output for incremental linking

       --no-incremental
              Do a full link (default)

       --incremental-full
              Do a full link and prepare output for incremental linking

       --incremental-update
              Do an incremental link; exit if not possible

       --incremental-base FILE
              Set base file for incremental linking (default is output file)

       --incremental-changed
              Assume files changed

       --incremental-unchanged
              Assume files didn't change

       --incremental-unknown
              Use timestamps to check files (default)

       --incremental-startup-unchanged
              Assume startup files unchanged (files preceding this option)

       --incremental-patch PERCENT Amount of extra space to allocate for patches

       -init SYMBOL
              Call SYMBOL at load-time

       --just-symbols FILE
              Read only symbol values from FILE

       --map-whole-files
              Map whole files to memory (default on 64-bit hosts)

       --no-map-whole-files
              Map relevant file parts to memory (default on 32-bit hosts)

       --keep-files-mapped
              Keep files mapped across passes (default)

       --no-keep-files-mapped
              Release mapped files after each pass

       --ld-generated-unwind-info
              Generate unwind information for PLT (default)

       --no-ld-generated-unwind-info
              Do not generate unwind information for PLT

       -l LIBNAME, --library LIBNAME
              Search for library LIBNAME

       -L DIR, --library-path DIR
              Add directory to search path

       --text-reorder
              Enable text section reordering for GCC section names (default)

       --no-text-reorder
              Disable text section reordering for GCC section names

       -nostdlib
              Only search directories specified on the command line.

       --rosegment
              Put read-only non-executable sections in their own segment

       --rosegment-gap OFFSET
              Set offset between executable and read-only segments

       -m EMULATION
              Set GNU linker emulation; obsolete

       --mmap-output-file
              Map the output file for writing (default).

       --no-mmap-output-file
              Do not map the output file for writing.

       -M, --print-map
              Write map file on standard output

       -Map MAPFILENAME
              Write map file

       -n, --nmagic
              Do not page align data

       -N, --omagic
              Do not page align data, do not make text readonly

       --no-omagic
              Page align data, make text readonly

       --enable-new-dtags
              Enable use of DT_RUNPATH and DT_FLAGS

       --disable-new-dtags
              Disable use of DT_RUNPATH and DT_FLAGS

       --noinhibit-exec
              Create an output file even if errors occur

       --no-undefined
              Report undefined symbols (even with --shared)

       -o FILE, --output FILE
              Set output file name

       -O LEVEL, -optimize LEVEL
              Optimize output file size

       --oformat [binary]
              Set output format

       -p     (ARM only) Ignore for backward compatibility

       -pie   Create a position independent executable

       -no-pie
              Do not create a position independent executable

       --pic-executable
              Create a position independent executable

       --no-pic-executable
              Do not create a position independent executable

       -no-pipeline-knowledge
              (ARM only) Ignore for backward compatibility

       --plt-align [=P2ALIGN]
              (PowerPC64 only) Align PLT call stubs to fit cache lines

       --plt-static-chain
              (PowerPC64 only) PLT call stubs should load r11

       --no-plt-static-chain
              (PowerPC64 only) PLT call stubs should not load r11

       --plt-thread-safe
              (PowerPC64 only) PLT call stubs with load-load barrier

       --no-plt-thread-safe
              (PowerPC64 only) PLT call stubs without barrier

       --plugin PLUGIN
              Load a plugin library

       --plugin-opt OPTION
              Pass an option to the plugin

       --posix-fallocate
              Use posix_fallocate to reserve space in the output file (default).

       --no-posix-fallocate
              Use fallocate or ftruncate to reserve space.

       --preread-archive-symbols
              Preread archive symbols when multi-threaded

       --print-output-format
              Print default output format

       --print-symbol-counts FILENAME
              Print symbols defined and used for each input

       -Qy    Ignored for SVR4 compatibility

       -q, --emit-relocs
              Generate relocations in output

       -r, -relocatable
              Generate relocatable output

       -i     Synonym for -r

       --relax
              Relax branches on certain targets

       --retain-symbols-file FILE
              keep only symbols listed in this file

       -R DIR Add DIR to runtime search path

       -rpath DIR
              Add DIR to runtime search path

       --rpath-link DIR
              Add DIR to link time shared library search path

       --section-ordering-file FILENAME
              Layout sections in the order specified.

       --section-start SECTION=ADDRESS
              Set address of section

       --sort-common [={ascending,descending}]
              Sort common symbols by alignment

       --sort-section [none,name]
              Sort sections by name.  '--no-text-reorder' will override '--sort-section=name' for .text

       --spare-dynamic-tags COUNT
              Dynamic tag slots to reserve (default 5)

       -s, --strip-all
              Strip all symbols

       -S, --strip-debug
              Strip debugging information

       --strip-debug-non-line
              Emit only debug line number information

       --strip-debug-gdb
              Strip debug symbols that are unused by gdb (at least versions <= 7.4)

       --strip-lto-sections
              Strip LTO intermediate code sections

       --stub-group-size SIZE
              (ARM,  PowerPC  only)  The maximum distance from instructions in a group of sections to their stubs.  Negative values mean stubs are
              always after (PowerPC before) the group.  1 means use default size.

       --no-keep-memory
              Use less memory and more disk I/O (included only for compatibility with GNU ld)

       -G, -shared
              Generate shared library

       -Bshareable
              Generate shared library

       --split-stack-adjust-size SIZE
              Stack size when -fsplit-stack function calls non-split

       -static
              Do not link against shared libraries

       --icf [none,all,safe]
              Identical Code Folding. '--icf=safe' Folds ctors, dtors and functions whose pointers are definitely not taken.

       --icf-iterations COUNT
              Number of iterations of ICF (default 2)

       --print-icf-sections
              List folded identical sections on stderr

       --no-print-icf-sections
              Do not list folded identical sections

       --keep-unique SYMBOL
              Do not fold this symbol during ICF

       --gc-sections
              Remove unused sections

       --no-gc-sections
              Don't remove unused sections (default)

       --print-gc-sections
              List removed unused sections on stderr

       --no-print-gc-sections
              Do not list removed unused sections

       --stats
              Print resource usage statistics

       --sysroot DIR
              Set target system root directory

       -t, --trace
              Print the name of each input file

       -T FILE, --script FILE
              Read linker script

       --threads
              Run the linker multi-threaded

       --no-threads
              Do not run the linker multi-threaded

       --thread-count COUNT
              Number of threads to use

       --thread-count-initial COUNT
              Number of threads to use in initial pass

       --thread-count-middle COUNT Number of threads to use in middle pass

       --thread-count-final COUNT
              Number of threads to use in final pass

       -Tbss ADDRESS
              Set the address of the bss segment

       -Tdata ADDRESS
              Set the address of the data segment

       -Ttext ADDRESS
              Set the address of the text segment

       -Ttext-segment ADDRESS
              Set the address of the text segment

       -Trodata-segment ADDRESS
              Set the address of the rodata segment

       --toc-optimize
              (PowerPC64 only) Optimize TOC code sequences

       --no-toc-optimize
              (PowerPC64 only) Don't optimize TOC code sequences

       --toc-sort
              (PowerPC64 only) Sort TOC and GOT sections

       --no-toc-sort
              (PowerPC64 only) Don't sort TOC and GOT sections

       -u SYMBOL, --undefined SYMBOL
              Create undefined reference to SYMBOL

       --unresolved-symbols ignore-all,report-all,ignore-in-object-files,ignore-in-shared-libs
              How to handle unresolved symbols

       --verbose
              Synonym for --debug=files

       --version-script FILE
              Read version script

       --warn-common
              Warn about duplicate common symbols

       --no-warn-common
              Do not warn about duplicate common symbols (default)

       --warn-constructors
              Ignored

       --no-warn-constructors
              Ignored

       --warn-execstack
              Warn if the stack is executable

       --no-warn-execstack
              Do not warn if the stack is executable (default)

       --no-warn-mismatch
              Don't warn about mismatched input files

       --warn-multiple-gp
              Ignored

       --warn-search-mismatch
              Warn when skipping an incompatible library

       --no-warn-search-mismatch
              Don't warn when skipping an incompatible library

       --warn-shared-textrel
              Warn if text segment is not shareable

       --no-warn-shared-textrel
              Do not warn if text segment is not shareable (default)

       --warn-unresolved-symbols
              Report unresolved symbols as warnings

       --error-unresolved-symbols
              Report unresolved symbols as errors

       --no-wchar-size-warning
              (ARM only) Do not warn about objects with incompatible wchar_t sizes

       --whole-archive
              Include all archive contents

       --no-whole-archive
              Include only needed archive contents

       --wrap SYMBOL
              Use wrapper functions for SYMBOL

       -y SYMBOL, --trace-symbol SYMBOL
              Trace references to symbol

       --undefined-version
              Allow unused version in script (default)

       --no-undefined-version
              Do not allow unused version in script

       -Y PATH
              Default search path for Solaris compatibility

       -(, --start-group
              Start a library search group

       -), --end-group
              End a library search group

       --start-lib
              Start a library

       --end-lib
              End a library

       -fuse-ld
              Ignored for GCC linker option compatibility

       -z combreloc
              Sort dynamic relocs

       -z nocombreloc
              Do not sort dynamic relocs

       -z common-page-size=SIZE
              Set common page size to SIZE

       -z defs
              Report undefined symbols (even with --shared)

       -z execstack
              Mark output as requiring executable stack

       -z initfirst
              Mark DSO to be initialized first at runtime

       -z interpose
              Mark object to interpose all DSOs but executable

       -z lazy
              Mark object for lazy runtime binding (default)

       -z loadfltr
              Mark object requiring immediate process

       -z max-page-size=SIZE
              Set maximum page size to SIZE

       -z muldefs
              Allow multiple definitions of symbols

       -z nocopyreloc
              Do not create copy relocs

       -z nodefaultlib
              Mark object not to use default search paths

       -z nodelete
              Mark DSO non-deletable at runtime

       -z nodlopen
              Mark DSO not available to dlopen

       -z nodump
              Mark DSO not available to dldump

       -z noexecstack
              Mark output as not requiring executable stack

       -z now Mark object for immediate function binding

       -z origin
              Mark DSO to indicate that needs immediate $ORIGIN processing at runtime

       -z relro
              Where possible mark variables read-only after relocation

       -z norelro
              Don't mark variables read-only after relocation

       -z text
              Do not permit relocations in read-only segments

       -z notext
              Permit relocations in read-only segments (default)

       -z textoff
              Permit relocations in read-only segments (default)

       -z buildd
              Dummy z option

       ld.gold: supported targets: elf32-i386 elf32-i386-freebsd elf32-i386-nacl elf32-x86-64 elf32-x86-64-freebsd elf32-x86-64-nacl  elf64-x86-64
       elf64-x86-64-freebsd  elf64-x86-64-nacl  ld.gold:  supported  emulations:  elf_i386 elf_i386_nacl elf32_x86_64 elf32_x86_64_nacl elf_x86_64
       elf_x86_64_nacl

REPORTING BUGS
       Report bugs to <http://www.sourceware.org/bugzilla/>

COPYRIGHT
       Copyright © 2014 Free Software Foundation, Inc.  This program is free software; you may redistribute it under the terms of the GNU  General
       Public License version 3 or (at your option) a later version.  This program has absolutely no warranty.

gold (GNU Binutils for Ubuntu 2.25) 1.11                            April 2015                                                             GOLD(1)
