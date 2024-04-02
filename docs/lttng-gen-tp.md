LTTNG-GEN-TP(1)                                                                                                                                                                               LTTNG-GEN-TP(1)



NAME
       lttng-gen-tp — LTTng UST 2.x tracepoint code generator


SYNOPSIS
       lttng-gen-tp [OPTIONS] TEMPLATE_FILE

DESCRIPTION
       The LTTng project aims at providing highly efficient tracing tools for Linux.  Its tracers help in tracking down performance issues and debugging problems involving multiple concurrent processes and
       threads. Tracing across multiple systems is also possible.

       The lttng-gen-tp tool simplifies the generation of the UST tracepoint files. It takes a simple template file and generates the necessary code to use the defined tracepoints in your application.  The
       section TEMPLATE FILE FORMAT describes the content of the template file.

       Currently,  the  tool  can generate the .h, .c and .o associated with your tracepoint. The generated .h can be directly included in your application.  You can let the tool generate the .o or compile
       the .c yourself.  You can compile the .c into a .o, .a or .so at your choice and link it with your application.  Refer to the UST documentation for the advantages and disadvantage of each form.   To
       compile the resulting .c file, you need to add the options "-llttng-ust -I.".


OPTIONS
       This program follows the usual GNU command line syntax with long options starting with two dashes. Below is a summary of the available options.

       -h, --help
              Show summary of possible options and commands.

       -v, --verbose
              Increase verbosity.

       -o, --output
              Specify the generated file. The type of the generated file depend on the file extension (.h, .c, .o).  This option can be specified multiple times to generate different file type.


       When no output is specified the default files are generated with the same base filename as the template file. The default files are: .h, .c, .o.


TEMPLATE FILE FORMAT
       The  template file, which has the usual extension .tp, contains a list of TRACEPOINT_EVENT definitions and other optional definition entries like TRACEPOINT_LOGLEVEL.  (See lttng-ust(3) for the com-
       plete list of available definition.)

       You write them as you would write them in a C header file. You can add comments with /* */, // and #.

       The provider name (the first field of TRACEPOINT_EVENT) must be the same for the whole file.



       Example

       TRACEPOINT_EVENT(
                  sample_tracepoint,
                  message, // Comment
                  TP_ARGS(char *, text),
                  /* Next are the fields */
                  TP_FIELDS(
                      ctf_string(message, text)
                  )
              )

ENVIRONMENT VARIABLES
       When the tool generates a .o file, it will look for the following environment variables

       CC     Specify which C compiler to use. If the variable is not specified, the tool will try "cc" and "gcc"


       CFLAGS Flags directly passed to the compiler

SEE ALSO
       lttng-ust(3), lttng(1)

BUGS
       If you encounter any issues or usability problem, please report it on our mailing list <lttng-dev@lists.lttng.org> to help improve this project.

CREDITS
       lttng-gen-tp is distributed under the GNU General Public License version 2. See the file COPYING for details.

       A Web site is available at http://lttng.org for more information on the LTTng project.

       You can also find our git tree at http://git.lttng.org.

       Mailing lists for support and development: <lttng-dev@lists.lttng.org>.

       You can find us on IRC server irc.oftc.net (OFTC) in #lttng.

AUTHORS
       lttng-gen-tp is written by Yannick Brosseau <yannick.brosseau@gmail.com>.

                                                                                              February 16, 2012                                                                               LTTNG-GEN-TP(1)
