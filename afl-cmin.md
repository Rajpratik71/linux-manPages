AFL-CMIN(1)                                                             afl                                                            AFL-CMIN(1)

NAME
       afl-cmin - corpus minimization tool for American Fuzzy Lop (afl)

SYNOPSIS
       afl-cmin [options] -- /path/to/fuzzed/app [params]

DESCRIPTION
       afl-cmin tries to find the smallest subset of files in the input directory that still trigger the full range of instrumentation data points
       seen in the starting corpus.

       If a large corpus of data is available for screening, afl-cmin can be used to reject redundant files, ideally, with an  aggressive  timeout
       (set by -t).

       Note that the tool doesn't modify the files themselves. For that, you want afl-tmin.

OPTIONS
       Run afl-cmin without any arguments to see a complete list of options.

SEE ALSO
       afl-fuzz(1),  afl-gcc(1),  afl-g++(1),  afl-clang(1),  afl-clang++(1), afl-clang-fast(1), afl-clang-fast++(1), afl-showmap(1), afl-tmin(1),
       afl-analyze(1), afl-gotcpu(1), afl-plot(1), afl-whatsup(1)

AUTHORS
       American Fuzzy Lop is written by Michal Zalewski <lcamtuf@google.com>.  This manpage was written by Daniel Stender <stender@debian.org>.

                                                                                                                                       AFL-CMIN(1)
