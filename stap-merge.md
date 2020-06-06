STAP-MERGE(1)                                                                              General Commands Manual                                                                              STAP-MERGE(1)



NAME
       stap-merge - systemtap per-cpu binary merger



SYNOPSIS
       stap-merge [ OPTIONS ] [ INPUT FILENAMES ]


DESCRIPTION
       The  stap-merge  executable applies when the -b option has been used while running a stap script.  The -b option will generate files per-cpu, based on the timestamp field. Then stap-merge will merge
       and sort through the per-cpu files based on the timestamp field.


OPTIONS
       The systemtap merge executable supports the following options.

       -v     Verbose mode, displays three extra fields per set of collected data.

              [cpunumber,sequencenumberofdata,thelengthofthedataset]


       -o OUTPUT_FILENAME

              Specify the name of the file you would like the output to be redirected into.  If this option is not specified than the output will be pushed to standard out.


EXAMPLES
              $ stap -v -b -e 'probe syscall.open { printf("%s(%d) open\n",
              execname(), pid()) }'



       This should result in several stpd_cpu files (each labled with a number representing which cpu the file was produced from).


              $ stap-merge -v stpd_cpu0 stpd_cpu1



       Running the stap-merge program in the same directory as the stap script earlier in the example, will produce an ordered sequence of packets with the three part label for each set of data.  This  re‐
       sult will be pushed through the standard output.  An output file could have been specified using the "-o" option.


FILES
       Important files and their corresponding paths can be located in the
              stappaths (7) manual page.


SEE ALSO
       stapprobes(3stap),
       stappaths(7),
       staprun(8),
       stapvars(3stap),
       stapex(3stap),
       stap-server(8),
       gdb(1)


BUGS
       Use the Bugzilla link of the project web page or our mailing list.  http://sourceware.org/systemtap/,<systemtap@sourceware.org>.



                                                                                                                                                                                                STAP-MERGE(1)
