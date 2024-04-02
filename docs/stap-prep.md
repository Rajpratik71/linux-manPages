STAP-PREP(1)                                                                               General Commands Manual                                                                               STAP-PREP(1)



NAME
       stap-prep - prepare system for systemtap use



SYNOPSIS
       stap-prep [ KERNEL_VERSION ]


DESCRIPTION
       The  stap-prep  executable  prepares the system for systemtap use by installing kernel headers, debug symbols and build tools that match the currently running kernel or optionally the kernel version
       given by the user.

       The exact behavior of stap-prep may be customized by the distribution maintainers. It might for example only give suggestions and not actually install the required packages if that is  difficult  to
       automate.


EXAMPLES
              $ stap-prep
              Please install linux-image-3.2.0-2-amd64-dbg



SEE ALSO
       stap(1)


BUGS
       Use the Bugzilla link of the project web page or our mailing list.  http://sourceware.org/systemtap/,<systemtap@sourceware.org>.



                                                                                                                                                                                                 STAP-PREP(1)
