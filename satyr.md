SATYR(1)                                                                                   General Commands Manual                                                                                   SATYR(1)



NAME
       satyr - create and manipulate problem reports

SYNOPSIS
       satyr <command> [option...]

DESCRIPTION
       satyr is a command line tool that creates anonymous reports of software problems that are suitable for automated processing.

       The tool has to be invoked with a <command> that specifies the action to be performed. The available commands are documented below.


OPTIONS
       Commands

       abrt-print-report-from-dir <directory>

              Creates report from ABRT problem directory directory and prints it to standard output.


       abrt-create-core-stacktrace <directory>

              Creates stacktrace from ABRT problem directory directory that contains a core dump.



satyr 0.13                                                                                        2013-03-18                                                                                         SATYR(1)
