DTRACE(1)                                                                                  General Commands Manual                                                                                  DTRACE(1)



NAME
       dtrace - Dtrace compatible user application static probe generation tool.



SYNOPSIS
       dtrace -s file [OPTIONS]


DESCRIPTION
       The dtrace command converts probe descriptions defined in file.d into a probe header file via the -h option or a probe description file via the -G option.


OPTIONS
       -h     generate a systemtap header file.


       -G     generate a systemtap probe definition object file.


       -o file
              is the name of the output file.  If the -G option is given then the output file will be called file.o; if the -h option is given then the output file will be called file.h.


       -C     run the cpp preprocessor on the input file when the -h option is given.


       -I file
              give this include path to cpp when the -C option is given.


       -k     keep temporary files, for example the C language source for the -G option.


EXAMPLES
       Systemtap is source compatible with dtrace user application static probe support.  Given a file test.d containing:

              provider sdt_probes
              {
                probe test_0 (int type);
                probe test_1 (struct astruct node);
              };
              struct astruct {int a; int b;};

       Then the command "dtrace -s test.d -G" will create the probe definition file test.o and the command "dtrace -stest.d -h" will create the probe header file test.h Subsequently the application can use
       the generated macros this way:

              #include "test.h"
               ...
              struct astruct s;
               ...
              SDT_PROBES_TEST_0(value);
               ...
              if (SDT_PROBES_TEST_1_ENABLED())
                  SDT_PROBES_TEST_1(expensive_function(s));



SEMAPHORES
       Semaphores are flag variables used by probes as a way of bypassing potentially costly processing to prepare arguments for probes that may not even be active.  They are automatically  set/cleared  by
       systemtap  when a relevant script is running, so the argument setup cost is only paid when necessary.  These semaphore variables are defined within the the "test.o" object file, which must therefore
       be linked into an application.

       Sometimes, semaphore variables are not necessary nor helpful.  Skipping them can simplify the build process, by omitting the extra "test.o" file.  To skip dependence upon  semaphore  variables,  in‐
       clude "<sys/sdt.h>" within the application before "test.h":

              #include <sys/sdt.h>
              #include "test.h"
               ...
              struct astruct s;
               ...
              SDT_PROBES_TEST_0(value);
               ...
              if (SDT_PROBES_TEST_1_ENABLED())
                 SDT_PROBES_TEST_1(cheap_function(s));

       In this mode, the ENABLED() test is fixed at 1.


SEE ALSO
       stap(1),
       stappaths(7)



BUGS
       Use the Bugzilla link of the project web page or our mailing list.  http://sourceware.org/systemtap/, <systemtap@sourceware.org>.

       error::reporting(7stap), https://sourceware.org/systemtap/wiki/HowToReportBugs



                                                                                                                                                                                                    DTRACE(1)
