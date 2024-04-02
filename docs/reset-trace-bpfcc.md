reset-trace(8)                                                System Manager's Manual                                               reset-trace(8)

NAME
       reset-trace - reset the state of tracing.

SYNOPSIS
       reset-trace [-F] [-h] [-q] [-v]

DESCRIPTION
       You will probably never need this tool. If you kill -9 a bcc tool (plus other signals, like SIGTERM), or if a bcc tool crashes, then kernel
       tracing can be left in a semi-enabled state. It's not as bad as it sounds: there may just be overhead for writing to ring buffers that  are
       never read. This tool can be used to clean up the tracing state, and reset and disable active tracing.

       Make sure no other tracing sessions are active. This tool might stop them from functioning (perhaps ungracefully).

       This  specifically clears the state in at least the following files in /sys/kernel/debug/tracing: kprobe_events, uprobe_events, trace_pipe.
       Other tracing facilities (ftrace) are checked, and if not in an expected state, a note is printed. All tracing files can be reset  with  -F
       for force, but this will interfere with any other running tracing sessions (eg, ftrace).

REQUIREMENTS
       /sys/kernel/debug mounted as debugfs

OPTIONS
       -F     Force. Will reset all tracing facilities, including those not used by bcc (ftrace). You shouldn't need to use this.

       -h     USAGE message.

       -q     Quiet. No output while working.

       -v     Verbose: print what it is doing.

EXAMPLES
       Reset the state of tracing:
              # reset-trace

       Verbose:
              # reset-trace -v

       SOURCE
              This is from bcc.

              https://github.com/iovisor/bcc

       Also look in the bcc distribution for a companion _examples.txt file containing example usage, output, and commentary for this tool.

OS
       Linux

STABILITY
       Unstable - in development.

AUTHOR
       Brendan Gregg

USER COMMANDS                                                       2016-10-18                                                      reset-trace(8)
