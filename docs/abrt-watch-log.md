ABRT-WATCH-LOG(1)                                                                                ABRT Manual                                                                                ABRT-WATCH-LOG(1)



NAME
       abrt-watch-log - Watch log file and run command when it grows or is replaced

SYNOPSIS
       abrt-watch-log [-vs] [-F STR] ... FILE PROG [ARGS]

OPTIONS
       -F STR
           Don’t run PROG if STRs aren’t found

       -v, --verbose
           Be more verbose. Can be given multiple times.

       -s
           Log to syslog

       FILE
           Watched file

       PROG
           Path to an executable

       ARGS
           Arguments for PROG

AUTHORS
       ·   ABRT team



abrt 2.1.11                                                                                       08/12/2019                                                                                ABRT-WATCH-LOG(1)
