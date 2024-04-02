ABRT-ACTION-GENERA(1)                                                                            ABRT Manual                                                                            ABRT-ACTION-GENERA(1)



NAME
       abrt-action-generate-backtrace - Analyzes coredump, generates and saves backtrace.

SYNOPSIS
       abrt-action-generate-backtrace [-v] [-d DIR] [-i DIR1[:DIR2]...] [-t NUM]

DESCRIPTION
       This tool runs gdb(1) on a file named coredump in problem directory DIR. gdb(1) generates backtrace and other diagnostic information about the state of the application at the moment when coredump
       was generated. Then the tool saves it as new element backtrace in this problem directory.

   Integration with libreport events
       abrt-action-generate-backtrace can be used as an analyzer for application crashes which dump core.

       Example usage in report_event.conf:

           EVENT=analyze analyzer=CCpp
                   abrt-action-generate-backtrace

OPTIONS
       -d DIR
           Path to problem directory.

       -v
           Be more verbose. Can be given multiple times.

       -i DIR1[:DIR2]
           Additional debuginfo directories

       -t NUM
           Kill gdb if it runs for more than NUM seconds

AUTHORS
       ·   ABRT team



abrt 2.1.11                                                                                       08/12/2019                                                                            ABRT-ACTION-GENERA(1)
