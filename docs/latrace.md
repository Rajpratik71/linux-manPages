LATRACE(1)                                                                                                                                                                                         LATRACE(1)



NAME
       latrace - LD_AUDIT 2.4+ libc frontend

SYNOPSIS
       latrace [-snltfvhiBdISbcCyYLpoaNADVTFERq] command [arg ... ]

DESCRIPTION
       The latrace tracer is able to run a command and display its dynamic library calls using a LD_AUDIT libc feature, available from libc version 2.4 onward. It is also capable to measure and display
       various statistics of dynamic calls. See the section called “DISCUSSION” for more details.

       If the header file with functions' declarations is provided, latrace will display functions’s arguments. The header file file syntax is similar to the C language, with several exceptions See the
       section called “HEADERS” for more details.

       The latrace by default fully operates inside of the traced program. However another "pipe mode" is available to move the main work to the tracer - the latrace binary. See the section called “PIPE
       mode” for more details.

       The latrace use is similar to strace(1) and ltrace(1).

OPTIONS
       -l, --libs lib1[,lib2,...]
           audit from and to lib1, lib2 ...

       -t, --libs-to lib1[,lib2,...]
           audit to lib1, lib2 ...

       -f, --libs-from lib1[,lib2,...]
           audit from lib1, lib2 ...

       -s, --sym sym1[,sym2,...]
           audit symbols sym1, sym2 ...

       -n, --sym-omit sym1[,sym2,...]
           omit symbols sym1, sym2 ...

       -L, --lib-subst s1[,s2,...]
           objsearch LD_AUDIT interface (See the section called “OBJSEARCH”)

       -c, --counts
           display statistics counts of symbols - implies pipe mode (see the section called “PIPE mode”) an no symbol output is displayed

       -C, --sort-counts stat
           implies -c, plus sort the statistics by stat with following values: time,per,call,ucall,lib,sym (default is call)

       -p, --pipe
           use pipe to latrace process to send audit data (see the section called “PIPE mode”)

       -N, --conf
           config file (see the section called “CONFIG”)

       -A, --enable-args
           enable arguments output (definitions from /etc/latrace.conf)

       -D, --detail-args
           display struct arguments in more detail

       -a, --args file
           specify arguments definition file, implies -A (without the default definition file of course)

       -y, --framesize number
           framesize for storing the stack before pltexit (default 100)

       -Y, --no-framesize-check
           disable framesize check

       -F, --no-follow-fork
           dont follow fork calls (childs). This is just supressing the latrace output from new childs. The nature of the LD_AUDIT feature prevents to disable it completely.

       -E, --no-follow-exec
           dont follow exec calls

       -S, --timestamp
           display timestamp for each symbol

       -b, --flow-below sym1[,sym2,...]
           display flow for sym1, sym2 ...

       -I, --no-indent-sym
           do no indent symbols based on the their stack depth

       -i, --indent-sym indent_size
           indent size specification in indent_size

       -B, --braces
           allways display {} for the around the symbol body

       -d, --demangle
           C++ demangle symbols on the output

       -T, --hide-tid
           dont display thread id

       -o, --output file
           store output to file

       -R, --ctl-config
           controled config feature

       -q, --disable
           run with disabled auditing

       -v, --verbose
           verbose output

       -V, --version
           display version

       -h, --help
           display help

EXAMPLES
       ·   The simplest way to run latrace is like this:

               latrace cat

       ·   To see the argument values specified by default config file run:

               latrace -A cat

       ·   Same as above but using the pipe mode to get all the end symbols printed:

               latrace -Ap cat

       ·   To see the argument values specified by specified config file run:

               latrace -a latrace.conf cat

       ·   To get output only for specified symbol (eg. read and write) run:

               latrace -A -s read,write cat

       ·   To get flow under the specified symbol (eg. sysconf) run:

               latrace -b sysconf kill

       ·   To get output only for specified library (eg. libproc) run:

               latrace -Al libproc w

       ·   To get symbol statistics run:

               latrace -c ls

       ·   To get symbol statistics sorted by time run:

               latrace -C time ls

       ·   To get output stored to the text file run:

               latrace -o output.latrace ls

       ·   To change the libkrava1.so dependency to the libkrava2.so run one of these:

               latrace -L krava1%krava2 ex

               latrace -L krava1~libkrava2.so ex

               latrace -L libkrava1.so=libkrava2.so ex

DISCUSSION
   NAMES CHECK
       For options "-l -t -f -s -n -b" the * symbol can be used to switch to the substring search. If it is not specified, the exact search for the name is done.

       Examples:

           -s "*krava" checks for symbols with "krava" substring.

           -s "krava"  checks only for "krava" symbol

   LD_AUDIT
       This is just a brief and vague description of the LD_AUDIT feature. For more information look to rtld-audit(7) man done by Petr Baudis or study the glibc/latrace source code. Very brief explanation
       follows.

       The libc dynamic linker audit feature allows to trace/audit program’s symbols/libraries. The feature is enabled by the LD_AUDIT environment variable. This variable must contain path to the audit
       shared library. This audit library needs to follow specific interface. The interface functions will be then called by the dynamic linker appropriatelly.

       The audit library needs to export following symbols (the "la_PLTENTER" and "la_PLTEXIT" names are architecture dependent).

           "la_activity"
           "la_objsearch"
           "la_objopen"
           "la_preinit"
           "la_symbind32"
           "la_symbind64"
           "la_PLTENTER"
           "la_PLTEXIT"
           "la_objclose"

       As for the latrace package the audit shared library is called libltaudit.so.

   OBJSEARCH
       The objsearch LD_AUDIT interface provide means for changing traced program shared object names/locations. The -L option argument should have following form:

       -L s1[,s2,...] where sN is src [=%~] dst

       The src is the source pattern/name and dst is the destination name/pattern.


       =   Comparing src with the library name. If matched, replace the library
           name with dst.
                      library name         - /lib/krava1.so
                      src                  - /lib/krava1.so
                      dst                  - /lib/krava2.so

                      final library name   - /lib/krava2.so


       %   Looking for the src in the library name. If found, replace the src
           with dst part.
                      library name         - /lib/krava1.so
                      src                  - krava1
                      dst                  - krava2

                      final library name   - /lib/krava2.so


       ~   Looking for the src in the library name. If found, replace the
           library name with dst.
                      library name         - /lib/krava1.so
                      src                  - krava1
                      dst                  - /lib/krava2.so

                      final library name   - /lib/krava2.so



   PIPE mode
       The latrace can work in two modes. The first one native does does the output directly in the traced program process. The other one, pipe mode use the IPC fifo mechanism to send the data from the
       traced process to the latrace process. The latrace process is then responsible for the output. Using the pipe mode you loose the traced program standard output context with printed symbols.

       By using the pipe mode, the latrace is not dependent on the trace program usage/manipulation of the standard output descriptor. Also the symbol statistics counts -c, -C options use the pipe mode to
       transfer symbol information to the latrace binary, and the latrace binary does the counts at the end.

   CONFIG
       The latrace provide possibility to enable/disable some of the options by means of configuration file. Some of the options are linked to the command line arguments some of them are not. When latrace
       starts the global configuration file is read. This file is usually being placed in here:

           /etc/latrace.d/latrace.conf

       Having default values read from this file, user can overload any of them by command line options or by supling another config file via -N, --conf option.

       The configuration file syntax is roughly:

           INCLUDE <anotherconfigfile>

           OPTIONS {
                   OPTION1 = VALUE
                   OPTION2 = YES|NO
                   ...
                   OPTIONN = VALUE
           }

           # comment

       Configuration file options

       HEADERS = FILE
           -a, --args

       INDENT_SYM = VALUE
           -i, --indent-sym

       PIPE = BOOL
           -p, --pipe

       TIMESTAMP = BOOL
           -S, --timestamp

       FRAMESIZE = VALUE
           -y, --framesize

       FRAMESIZE_CHECK = BOOL
           -Y, --no-framesize-check

       HIDE_TID = BOOL
           -T, --hide-tid

       FOLLOW_FORK = BOOL
           -F, --no-follow-fork

       FOLLOW_EXEC = BOOL
           -E, --no-follow-exec

       DEMANGLE = BOOL
           -d, --demangle

       BRACES = BOOL
           -B, --braces

       ENABLE_ARGS = BOOL
           -A, --enable-args

       DETAIL_ARGS = BOOL
           -D, --detail-args

       OUTPUT_TTY = FILE

           ·   stores tracee terminal output to the file

       LIBS = LIB1[,LIB2,...]
           -l, --libs

       LIBS_TO = LIB1[,LIB2,...]
           -t, --libs-to

       LIBS_FROM = LIB1[,LIB2,...]
           -f, --libs-from

       SYM = SYM1[,SYM2,...]
           -s, --sym

       SYM_OMIT = SYM1[,SYM2,...]
           -n, --sym-omit

       SYM_BELOW = SYM1[,SYM2,...]
           -b, --flow-below

       SYM_NOEXIT = SYM1[,SYM2,...]

           ·   symbols which do no run exit callback (plt_exit)

       ARGS_STRING_POINTER_LENGTH = BOOL

           ·   function arguments - display string length and pointer value

   HEADERS
       The latrace header file allows user to define symbols as an classic C functions with arguments. Argument names will be displayed together with values as the latrace output. The more arguments are
       defined, the more performance and memory penalties should be expected.

       The package is delivered with several predefined header files for the most commonly used functions. List of the glibc header files used follows (the list mostly follows the ltrace header files list,
       and author is willing to update it according to the needs)

           ctype.h dirent.h dlfcn.h fcntl.h getopt.h inet.h ioctl.h
           libintl.h libio.h locale.h misc.h mman.h ncurses.h netdb.h
           pthread.h pwd.h resource.h signal.h socket.h stat.h stdio.h
           stdlib.h string.h syslog.h term.h termios.h time.h typedefs.h
           unistd.h utmp.h wait.h

       The latrace header files are usually stored under directory:

           /etc/latrace.d/headers/

       User can specify single header file using command line option or configuration file. This file then can include other needed headers. As already mentioned, the latrace config file syntax lightly
       follows the C language syntax. Following part describes the latrace config file language.

       ·   Several POD types (plain old data), are hardcoded in latrace. Size of those arguments is determined by the sizeof macro. The list follows.

               void
               char    u_char
               short   u_short
               int     u_int
               long    u_long
               llong   u_llong  # (long long)
               float   double

       ·   The typedef keyword allows to specify new type based on the already existing one (POD or typedefed). Eventhough there’s a way for multiple pointer layers in the type definition (*), only one is
           taken.

               typedef base_type new_type;
               typedef base_type * new_type;
               typedef base_type ** new_type;

       ·   Comments follow the C style /\* \*/ logic.

           /\* comments \*/

       ·   The include keyword allows to include another config file.

           #include "filename"

       ·   The struct keyword allows to define the structure. The syntax folows following grammar rules.

               START::         struct NAME { STRUCT_DEF };
               STRUCT_DEF::    DEF | EMPTY
               DEF::           NAME NAME |
                               NAME '*' NAME |
                               struct NAME NAME |
                               struct NAME '*' NAME
               NAME::          [-0-9a-zA-Z_]+

       ·   The function definition follows following syntax (DEF and NAME are the same as for struct definition).

               START::         DEF '(' ARGS ')' ';'
               ARGS::          ARGS ',' DEF | DEF | EMPTY

       ·   The enum definition follows following syntax (NAME is same as for struct definition).

               START::         ENUM NAME '{' ENUM_DEF '}' ';'
               ENUM_DEF::      ENUM_DEF ',' ENUM_ELEM | ENUM_ELEM
               ENUM_ELEM::     NAME '=' NAME | NAME

       ·   Example of a simple latrace config file.

               ---[ cut here ]-----------------------------
               enum krava {
                       krava1 = 1,
                       krava2,
                       krava3 = 100
               };

               #include "krava.conf"

               typedef u_int pid_t;

               struct ex_st {
                       pid_t   p;
                       int     cnt;
                       char   *name;
               };

               int f1(pid_t p, struct ex_st *k);
               int f2(char* name, struct ex_st k, int k = krava);
               struct ex_st* f3(pid_t *p, struct ex_st k);
               ---[ cut here ]-----------------------------

       ·   Arrays are not supported yet, so there’s no way to define some structures. For such a structures use void* type where the structure argu- ment is passed by pointer. If it is passed by value,
           there’s no workaround so far (aside from filling the structure body with POD types up to the actual length of the structure :).

       ·   Variable argument lists (va_list/...) are not supported yet. The function definition needs to stop before the first variable argument list argument.

PORTS
       The latrace should work on any glibc system with LD_AUDIT support. However arguments details are architecture specific and need special support inside latrace itself.

       Author is willing to port the latrace to any architecture, as long as he got an access to corresponding system. Currently functional ports are:


       x86      ok

       x86_64   ok

       arm      ok


BUGS
       MANY, plz report bugs to <latrace@lists.fedorahosted.org[1]> or <olsajiri@gmail.com[2]>.

       You can also visit the http://people.redhat.com/jolsa/latrace/ page to see the latest release notes information.

       LD_AUDIT related glibc bugs:

       ·   Bug 7055 (no longer reproducible)

       ·   Bug 9893 (FIXED in 2.10)

       ·   Bug 3924 (FIXED in 2.7-2)

AUTHOR
       Jiri Olsa <olsajiri@gmail.com[2]>

CONTRIBUTORS
       ·   Nix <nix@esperi.org.uk[3]>

       ·   Akos Pasztory <akos.pasztory@gmail.com[4]>

       ·   Artur Skawina <art.08.09@gmail.com[5]>

       ·   Dr. David Alan Gilbert <david.gilbert@linaro.org[6]>

       ·   Sebastian Pipping <sping@gentoo.org[7]>

LICENSE
       This is free software, distributed under the GPLv3 license.

SEE ALSO
       strace(1), ltrace(1)

AUTHOR
       Jiri Olsa <olsajiri@gmail.com>
           Author.

NOTES
        1. latrace@lists.fedorahosted.org
           mailto:latrace@lists.fedorahosted.org

        2. olsajiri@gmail.com
           mailto:olsajiri@gmail.com

        3. nix@esperi.org.uk
           mailto:nix@esperi.org.uk

        4. akos.pasztory@gmail.com
           mailto:akos.pasztory@gmail.com

        5. art.08.09@gmail.com
           mailto:art.08.09@gmail.com

        6. david.gilbert@linaro.org
           mailto:david.gilbert@linaro.org

        7. sping@gentoo.org
           mailto:sping@gentoo.org



  0.5.11                                                                                        November 2015                                                                                      LATRACE(1)
