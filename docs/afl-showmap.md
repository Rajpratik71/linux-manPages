AFL-SHOWMAP(1)                                                          afl                                                         AFL-SHOWMAP(1)

NAME
       afl-showmap - map display utility for American Fuzzy Lop (afl)

SYNOPSIS
       afl-showmap [options] -- /path/to/fuzzed/app [params]

DESCRIPTION
       afl-showmap  is a simple tool that runs the targeted binary and displays the contents of the trace bitmap in a human-readable form.  Useful
       in scripts to eliminate redundant inputs and perform other checks.

       Exit code is 2 if the target program crashes; 1 if it times out or there is a problem executing it; or 0 if execution is successful.

OPTIONS
       Run afl-showmap without any arguments to see a complete list of options.

SEE ALSO
       afl-fuzz(1), afl-gcc(1), afl-g++(1), afl-clang(1), afl-clang++(1), afl-clang-fast(1), afl-clang-fast++(1), afl-cmin(1),  afl-tmin(1),  afl-
       analyze(1), afl-gotcpu(1), afl-plot(1), afl-whatsup(1)

AUTHORS
       American Fuzzy Lop is written by Michal Zalewski <lcamtuf@google.com>.  This manpage was written by Daniel Stender <stender@debian.org>.

                                                                                                                                    AFL-SHOWMAP(1)
