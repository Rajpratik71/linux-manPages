SOFDSNOOP(8)                                                  System Manager's Manual                                                 SOFDSNOOP(8)

NAME
       sofdsnoop - traces FDs passed by sockets

SYNOPSIS
       usage: sofdsnoop [-h] [-T] [-p PID] [-t TID] [-n NAME] [-d DURATION]

DESCRIPTION
       Trace file descriptors passed via socket

   optional arguments:
       -h, --help
              show this help message and exit

       -T, --timestamp
              include timestamp on output

       -p PID, --pid PID
              trace this PID only

       -t TID, --tid TID
              trace this TID only

       -n NAME, --name NAME
              only print process names containing this name

       -d DURATION, --duration DURATION
              total duration of trace in seconds

EXAMPLES
       Trace passed file descriptors
              # sofdsnoop

       Include timestamps
              # sofdsnoop -T

       Only trace PID 181
              # sofdsnoop -p 181

       Only trace TID 123
              # sofdsnoop -t 123

       Trace for 10 seconds only
              # sofdsnoop -d 10

       Only print process names containing "main"
              # sofdsnoop -n main

SOURCE
       This is from bcc.

              https://github.com/iovisor/bcc

       Also look in the bcc distribution for a companion _examples.txt file containing example usage, output, and commentary for this tool.

OS
       Linux

STABILITY
       Unstable - in development.

USER COMMANDS                                                       2019-07-29                                                        SOFDSNOOP(8)
