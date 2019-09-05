AFL-ANALYZE(1)                                                          afl                                                         AFL-ANALYZE(1)

NAME
       afl-analyze - file format analyzer for American Fuzzy Lop (afl)

SYNOPSIS
       afl-analyze [options] -- /path/to/target_app [...]

DESCRIPTION
       afl-analyze  takes an input file, attempts to sequentially flip bytes, and observes the behavior of the tested program. It then color-codes
       the input based on which sections appear to be critical, and which are not. While not bulletproof, it can often offer quick  insights  into
       complex file formats.

       More info on this helper can be found in /usr/share/doc/afl-doc/docs/technical_details.txt.gz.

OPTIONS
       Run afl-analyze without any arguments to see a complete list of options.

SEE ALSO
       afl-fuzz(1),  afl-gcc(1),  afl-g++(1),  afl-clang(1),  afl-clang++(1), afl-clang-fast(1), afl-clang-fast++(1), afl-showmap(1), afl-cmin(1),
       afl-tmin(1), afl-gotcpu(1), afl-plot(1), afl-whatsup(1)

AUTHORS
       American Fuzzy Lop is written by Michal Zalewski <lcamtuf@google.com>.  This manpage was written by Daniel Stender <stender@debian.org>.

                                                                                                                                    AFL-ANALYZE(1)
