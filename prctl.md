PRCTL(1)                                                                                   General Commands Manual                                                                                   PRCTL(1)



NAME
       prctl - Process operations

SYNOPSIS
       prctl [-v] [-h|--help] [--version] <-q|<options....>> [command]

       where <options> are:

       --unaligned=[silent|signal|always-signal|default]

       --fpemu=[silent|signal|default]

DESCRIPTION
       prctl  allows  you  to query or control certain process behavior.  Supported options are handling of unaligned memory accesses and floating point assistance faults by a process.  When a process per-
       forms an unaligned memory access, by default the kernel would emulate the unaligned access correctly and log the unaligned access in syslog. This behavior can be changed so the kernel  could  either
       emulate  the  unaligned access correctly without logging an error or send SIGBUS to the process. Similarly when a process encounters a floating point assist fault, kernel would invoke floating point
       emulator and log the floating point assist fault. This behavior can be changed so the kernel could either emulate floating point operation without logging an error or send SIGFPE  to  the  offending
       process.

       prctl  can  optionally be followed by a command. If a command is specified, prctl will exec the command with the processor behavior set to as specified by the options. If a command is not specified,
       prctl will fork a new shell unless the command only queried the current settings.  The shell started by prctl will be as defined by the environment variable SHELL. If environment variable  SHELL  is
       not defined, shell in the password entry for the user will be started. If a shell is not found in the password entry, bash will be started.

   OPTIONS
       -v     Verbose mode. In verbose mode, any new settings are confirmed with a message on stdout.


       --help Print usage information and exit.


       --version
              Print software version and exit.


       -q     Query the current settings for the process options controllable by prctl.


       --unaligned=[silent|signal|always-signal|default]]
              Set  unaligned memory access behavior to not log the access (silent), send SIGBUS to the process (signal), or do the default (default). On IA-64 architecture an additional value always-signal
              is supported which causes a SIGBUS to be generated every time an unaligned access occurs. Refer to the section titled "Memory Datum Alignment and Atomicity" in "Intel IA-64 Architecture Soft-
              ware Developer's Manual: Volume 2" for details on when an unaligned access would not generate signal normally. If a value is not specified after "=", current setting is returned.


       --fpemu=[silent|signal|default]]
              Set  floating point assist fault behavior to not log the faulti (silent), send SIGFPE to the process (signal), or do the default (default). If a value is not specified after "=", current set-
              ting is returned.


       If an option is specified multiple times, the last one takes effect.


EXAMPLES
       prctl --unaligned=signal
              starts up a shell (as defined by the environment variable SHELL) and sets up any process running under this shell to be sent SIGBUS upon an unaligned memory access.


       prctl --unaligned=signal gdb tst
              starts up a gdb session for the program "tst" with the process set to receive SIGBUS upon unligned memory access.


       prctl --unaligned=
              displays the current setting for unaligned memory access handling.


       prctl --unaligned= gdb tst
              displays the current setting for unaligned memory access handling and starts up a gdb session for the program "tst".


NOTES
       prctl works on 2.4.0 and above kernels only.

       --fpemu= option is specific to IPF (Itanium Processor Family, previously known as IA-64) and is supported on kernels 2.4.11 and above. Other architectures and kernels may return  "Invalid  argument"
       error.


SEE ALSO
       prctl(2)

AUTHOR
       Khalid Aziz <khalid_aziz@hp.com>

LICENSE
       This software is made available under the GNU General Public License (GPL) Version 2.  This software comes with NO WARRANTY.



                                                                                              Process operations                                                                                     PRCTL(1)
