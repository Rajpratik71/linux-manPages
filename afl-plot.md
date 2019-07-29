AFL-PLOT(1)                                                             afl                                                            AFL-PLOT(1)

NAME
       afl-plot - progress plotting utility for American Fuzzy Lop (afl)

SYNOPSIS
       afl-plot <afl_state_dir> <graph_output_dir>

DESCRIPTION
       afl-plot generated gnuplot images from afl-fuzz output data.

       The <afl_state_dir> parameter should point to an existing state directory for any active or stopped instance of afl-fuzz; while <graph_out‐
       put_dir> should point to an empty directory where this tool can write the resulting plots to.

       The program will put index.html and three PNG images in the output directory; you should be able to view it with any web  browser  of  your
       choice.

SEE ALSO
       afl-fuzz(1),  afl-gcc(1),  afl-g++(1),  afl-clang(1),  afl-clang++(1), afl-clang-fast(1), afl-clang-fast++(1), afl-showmap(1), afl-cmin(1),
       afl-tmin(1), afl-analyze(1), afl-gotcpu(1), afl-whatsup(1)

AUTHORS
       American Fuzzy Lop is written by Michal Zalewski <lcamtuf@google.com>.  This manpage was written by Daniel Stender <stender@debian.org>.

                                                                                                                                       AFL-PLOT(1)
