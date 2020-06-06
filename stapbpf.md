STAPBPF(8)                                                                                 System Manager's Manual                                                                                 STAPBPF(8)



NAME
       stapbpf - systemtap bpf runtime




SYNOPSIS
       stapbpf [ OPTIONS ] MODULE


DESCRIPTION
       The stapbpf program is the BPF back-end of the Systemtap tool.  It expects a bpf-elf file produced by the front-end stap tool, when run with --runtime=bpf.


       Splitting  the systemtap tool into a front-end and a back-end allows a user to compile a systemtap script on a development machine that has the debugging information needed to compile the script and
       then transfer the resulting shared object to a production machine that doesn't have any development tools or debugging information installed.

       Please refer to stappaths(7) for the version number, or run

        $ rpm -q systemtap # (for Fedora/RHEL)
        $ apt-get -v systemtap # (for Ubuntu)


OPTIONS
       The stapbpf program supports the following options.  Any other option prints a list of supported options.

       -v     Verbose mode.

       -V     Print version number and exit.

       -w     Suppress warnings from the script.

       -h     Print help message.

       -o FILE
              Send output to FILE.


ARGUMENTS
       MODULE is the path of a bpf-elf file produced by the front-end stap tool, when run with --runtime=bpf.


EXAMPLES
       Here is a very basic example of how to generate a stapbpf module.  First, use stap to compile a script.  The stap program will report the name of the resulting module in the current  working  direc‐
       tory.

        $ stap --runtime=bpf -p4 -e 'probe begin { printf("Hello World!\n"); exit() }'
        stap_28784.bo

       Run stapbpf with the pathname to the module as an argument.

        $ stapbpf ./stap_28784.bo
        Hello World!

       If the -p4 option is omitted, stap will invoke stapbpf automatically.


LIMITATIONS
       This runtime is in an early stage of development and it currently lacks support for a number of features available in the default runtime.  A subset of the following probe points is supported:


              begin
              end
              kernel.*
              process.*
              timer.*
              perf.*


       In  general, probes based on the kprobes, uprobes, tracepoint and perf infrastructures are supported. See stapprobes(3stap) for more information on the probe points and which tracing infrastructures
       they are based on.

       for loops, foreach loops and while loops are usable only in begin and end probes.  try statements are not supported. There is limited support for string operations. String variables and literals are
       limited  to 64 characters, except for printf format strings, which are limited to 256 characters. Additionally, printf is limited to no more than 3 format specifiers and the name of the bpf-elf file
       produced by the front-end stap tool should not be changed.


SAFETY AND SECURITY
       See the stap(1) manual page for additional information on safety and security.


SEE ALSO
       stap(1), stapprobes(3stap), staprun(8), stapex(3stap)


BUGS
       Use the Bugzilla link of the project web page or our mailing list.  http://sourceware.org/systemtap/, <systemtap@sourceware.org>.



                                                                                                                                                                                                   STAPBPF(8)
