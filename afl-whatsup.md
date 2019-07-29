AFL-WHATSUP(1)                                                          afl                                                         AFL-WHATSUP(1)

NAME
       afl-whatsup - status check tool for American Fuzzy Lop (afl)

SYNOPSIS
       afl-whatsup [ -s ] <afl_sync_dir>

DESCRIPTION
       afl-whatsup summarizes the status of any locally-running synchronized instances of afl-fuzz.

       It  checks  if  the  fuzzer  is  alive, displays the total run time, number of execs, cumulative speed and pending paths, and the number of
       crashed found.

       The -s option causes the tool to skip all the per-fuzzer trivia and show just the summary results.

SEE ALSO
       afl-fuzz(1), afl-gcc(1), afl-g++(1), afl-clang(1), afl-clang++(1),  afl-clang-fast(1),  afl-clang-fast++(1),  afl-showmap(1),  afl-cmin(1),
       afl-tmin(1), afl-analyze(1), afl-gotcpu(1), afl-plot(1)

AUTHORS
       American Fuzzy Lop is written by Michal Zalewski <lcamtuf@google.com>.  This manpage was written by Daniel Stender <stender@debian.org>.

                                                                                                                                    AFL-WHATSUP(1)
