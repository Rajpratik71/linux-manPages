OPREPORT(1)                                                                                General Commands Manual                                                                                OPREPORT(1)



NAME
       opreport - produce symbol or binary image summaries

SYNOPSIS
       opreport [ options ] [profile specification]

DESCRIPTION
       opreport outputs binary image summaries, or per-symbol data, from OProfile profiling sessions. See oprofile(1) for how to write profile specifications.


OPTIONS
       --accumulated / -a
              Accumulate sample and percentage counts in the symbol list.

       --debug-info / -g
              Show source file and line for each symbol.

       --demangle / -D none|smart|normal
              none: no demangling. normal: use default demangler (default) smart: use pattern-matching to make C++ symbol demangling more readable.

       --callgraph / -c
              Show call graph information if available.

       --details / -d
              Show per-instruction details for all selected symbols.

       --exclude-dependent / -x
              Do not include application-specific images for libraries, kernel modules and the kernel. This option only makes sense if the profile session used --separate.

       --exclude-symbols / -e [symbols]
              Exclude all the symbols in the given comma-separated list.

       --global-percent / -%
              Make all percentages relative to the whole profile.

       --help / -? / --usage
              Show help message.

       --image-path / -p [paths]
              Comma-separated list of additional paths to search for binaries.  This is needed to find modules in kernels 2.6 and upwards.

       --root / -R [path]
              A path to a filesystem to search for additional binaries.

       --include-symbols / -i [symbols]
              Only include symbols in the given comma-separated list.

       --long-filenames / -f
              Output full paths instead of basenames.

       --merge / -m [lib,cpu,tid,tgid,unitmask,all]
              Merge any profiles separated in a --separate session.

       --no-header / -n
              Don't output a header detailing profiling parameters.

       --output-file / -o [file]
              Output to the given file instead of stdout.

       --reverse-sort / -r
              Reverse the sort from the default.

       --session-dir=dir_path
              Use  sample  database  from  the specified directory dir_path instead of the default locations. If --session-dir is not specified, then opreport will search for samples in <current_dir>/opro‐
              file_data first. If that directory does not exist, the standard session-dir of /var/lib/oprofile is used.

       --show-address / -w
              Show each symbol's VMA address.

       --sort / -s [vma,sample,symbol,debug,image]
              Sort the list of symbols by, respectively, symbol address, number of samples, symbol name, debug filename and line number, binary image filename.

       --symbols / -l
              List per-symbol information instead of a binary image summary.
              Usually, the total of all per-symbols samples for a given binary image equals the summary count for the binary image (shown by running opreport with no options).  However, it's  possible  for
              some sample addresses to fall outside the range of any symbols for a given binary image.  In such cases, the total number of per-symbols samples for the binary image may be less than the sum‐
              mary count for the image. Running opreport with the --verbose=debug option will display an informational message when this difference is detected.  This difference is typically very small and
              can be ignored.

       --threshold / -t [percentage]
              Only output data for symbols that have more than the given percentage of total samples.

       --verbose / -V [options]
              Give verbose debugging output.

       --version / -v
              Show version.

       --xml / -X
              Generate XML output.


ENVIRONMENT
       No special environment variables are recognized by opreport.


FILES
       <current_dir>/oprofile_data/samples
              Or
       /var/lib/oprofile/samples/

              The location of the generated sample files.


VERSION
       This man page is current for oprofile-0.9.9.


SEE ALSO
       /usr/share/doc/oprofile/, oprofile(1)



4th Berkeley Distribution                                                                    Fri 02 November 2018                                                                                 OPREPORT(1)
