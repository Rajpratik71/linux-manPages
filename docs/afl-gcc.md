AFL-GCC(1)                                                              afl                                                             AFL-GCC(1)

NAME
       afl-gcc - gcc wrapper for American Fuzzy Lop (afl)

SYNOPSIS
       CC=/usr/bin/afl-gcc ./configure

DESCRIPTION
       This  is  a  helper application which serves as a drop-in replacement for gcc, used to recompile third-party code with the required runtime
       instrumentation for afl-fuzz.

       A common pattern would be to use this with the CC environment variable.

SEE ALSO
       afl-fuzz(1), afl-g++(1), afl-clang(1), afl-clang++(1), afl-clang-fast(1), afl-clang-fast++(1),  afl-showmap(1),  afl-cmin(1),  afl-tmin(1),
       afl-analyze(1), afl-gotcpu(1), afl-plot(1), afl-whatsup(1)

AUTHORS
       American Fuzzy Lop is written by Michal Zalewski <lcamtuf@google.com>.  This manpage was written by Daniel Stender <stender@debian.org>.

                                                                                                                                        AFL-GCC(1)
