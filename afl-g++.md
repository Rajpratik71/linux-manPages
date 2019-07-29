AFL-G++(1)                                                              afl                                                             AFL-G++(1)

NAME
       afl-g++ - g++ wrapper for American Fuzzy Lop (afl)

SYNOPSIS
       CXX=/usr/bin/afl-g++ ./configure

DESCRIPTION
       This  is  a  helper application which serves as a drop-in replacement for g++, used to recompile third-party code with the required runtime
       instrumentation for afl-fuzz.

       A common pattern would be to use this with the CXX environment variable.

SEE ALSO
       afl-fuzz(1), afl-gcc(1), afl-clang(1), afl-clang++(1), afl-clang-fast(1), afl-clang-fast++(1),  afl-showmap(1),  afl-cmin(1),  afl-tmin(1),
       afl-analyze(1), afl-gotcpu(1), afl-plot(1), afl-whatsup(1)

AUTHORS
       American Fuzzy Lop is written by Michal Zalewski <lcamtuf@google.com>.  This manpage was written by Daniel Stender <stender@debian.org>.

                                                                                                                                        AFL-G++(1)
