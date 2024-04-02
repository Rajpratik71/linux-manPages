STAPDYN(8)                                                                                 System Manager's Manual                                                                                 STAPDYN(8)



NAME
       stapdyn - systemtap dyninst runtime


SYNOPSIS
       stapdyn [ OPTIONS ] MODULE [ MODULE-OPTIONS ]


DESCRIPTION
       The stapdyn program is the dyninst back-end of the Systemtap tool.  It expects a shared library produced by the front-end stap tool, when run with --dyninst.


       Splitting  the systemtap tool into a front-end and a back-end allows a user to compile a systemtap script on a development machine that has the debugging information (need to compile the script) and
       then transfer the resulting shared object to a production machine that doesn't have any development tools or debugging information installed.

       Please refer to stappaths (7) for the version number, or run rpm -q systemtap (fedora/red hat) apt-get -v systemtap (ubuntu)


OPTIONS
       The stapdyn program supports the following options.  Any other option prints a list of supported options.

       -v     Verbose mode.

       -V     Print version number and exit.

       -w     Suppress warnings from the script.

       -c CMD Command CMD will be run and the stapdyn program will exit when CMD does.  The '_stp_target' variable will contain the pid for CMD.

       -x PID The '_stp_target' variable will be set to PID.

       -o FILE
              Send output to FILE. If the module uses bulk mode, the output will be in percpu files FILE_x(FILE_cpux in background and bulk mode) where 'x' is the cpu number. This supports strftime(3) for‐
              mats for FILE.

       -C WHEN
              Control coloring of error messages. WHEN must be either "never", "always", or "auto" (i.e. enable only if at a terminal). If the option is missing, then "auto" is assumed. Colors can be modi‐
              fied using the SYSTEMTAP_COLORS environment variable. See the stap(1) manual page for more information on syntax and behaviour.

       var1=val
              Sets the value of global variable var1 to val. Global variables contained within a script are treated as options and can be set from the stapdyn command line.


ARGUMENTS
       MODULE is either a module path or a module name.  If it is a module name, the module will be looked for in the following directory (where 'VERSION' is the output of "uname -r"):

              /lib/modules/VERSION/systemtap

        $ stap --dyninst -p4 -m mod1 -e 'global var1="foo"; probe begin{printf("%s\n", var1); exit()}'

       Running this with an additional module argument:

        $ stapdyn mod1.so var1="HelloWorld"
        HelloWorld

       Spaces and exclamation marks currently cannot be passed into global variables this way.


EXAMPLES
       See the stapex(3stap) manual page for a collection of sample scripts.

       Here is a very basic example of how to use stapdyn.  First, use stap to compile a script.  The stap program will report the pathname to the resulting module.

        $ stap --dyninst -p4 -e 'probe begin { printf("Hello World!\n"); exit() }'
        /home/user/.systemtap/cache/85/stap_8553d83f78c_265.so

       Run stapdyn with the pathname to the module as an argument.

        $ stapdyn /home/user/.systemtap/cache/85/stap_8553d83f78c_265.so
        Hello World!


SAFETY AND SECURITY
       Systemtap, in DynInst mode, is a developer tool, and runs completely unprivileged.  The Linux kernel will only permit one's own processes to be accessed, which is enforced by  the  ptrace(2)  system
       call.  See the stap(1) manual page for additional information on safety and security.


SEE ALSO
       stap(1), stapprobes(3stap), stap-server(8), staprun(8), stapex(3stap)


BUGS
       Use the Bugzilla link of the project web page or our mailing list.  http://sourceware.org/systemtap/, <systemtap@sourceware.org>.




                                                                                                                                                                                                   STAPDYN(8)
