AFL-FUZZ(1)                                                             afl                                                            AFL-FUZZ(1)

NAME
       afl-fuzz - code fuzzer for American Fuzzy Lop (afl)

SYNOPSIS
       afl-fuzz -i <testcase_dir> -o <findings_dir> [options] -- /path/to/fuzzed/app [params]

DESCRIPTION
       This program takes an binary and attempts a variety of fuzzing strategies, paying close attention on how they affect the execution path.

       To  operate correctly, the fuzzer requires one or more starting files containing the typical input normally expected by the targeted appli‐
       cation.

       For instrumentated fuzzing, the binary must be compiled using either one of the shipped gcc or clang wrappers. Put -n to fuzz  w/o  instru‐
       mentation in dumb mode.

       Please  regard  that  a  full  fuzzing  process  takes  a  lot  of  time.  For  exhaustive  information  on  afl,  see the documentation in
       /usr/share/doc/afl-doc.

OPTIONS
       Run afl-fuzz without any arguments to see a complete list of options.

SEE ALSO
       afl-gcc(1), afl-g++(1), afl-clang(1), afl-clang++(1), afl-clang-fast(1),  afl-clang-fast++(1),  afl-showmap(1),  afl-cmin(1),  afl-tmin(1),
       afl-analyze(1), afl-gotcpu(1), afl-plot(1), afl-whatsup(1)

AUTHORS
       American  Fuzzy  Lop  is  written by Michal Zalewski <lcamtuf@google.com>.  Forkserver design by Jann Horn <jannhorn@googlemail.com>.  This
       manpage was written by Daniel Stender <stender@debian.org>.

                                                                                                                                       AFL-FUZZ(1)
