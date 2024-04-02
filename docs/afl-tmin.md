AFL-TMIN(1)                                                             afl                                                            AFL-TMIN(1)

NAME
       afl-tmin - test case minimizer for American Fuzzy Lop (afl)

SYNOPSIS
       afl-tmin [options] -- /path/to/fuzzed/app [params]

DESCRIPTION
       afl-tmin  is simple test case minimizer that takes an input file and tries to remove as much data as possible while keeping the binary in a
       crashing state or producing consistent instrumentation output (the mode is auto-selected based on initially observed behavior).

OPTIONS
       Run afl-tmin without any arguments to see a complete list of options.

SEE ALSO
       afl-fuzz(1), afl-gcc(1), afl-g++(1), afl-clang(1), afl-clang++(1),  afl-clang-fast(1),  afl-clang-fast++(1),  afl-showmap(1),  afl-cmin(1),
       afl-analyze(1), afl-gotcpu(1), afl-plot(1), afl-whatsup(1)

AUTHORS
       American Fuzzy Lop is written by Michal Zalewski <lcamtuf@google.com>.  This manpage was written by Daniel Stender <stender@debian.org>.

                                                                                                                                       AFL-TMIN(1)
