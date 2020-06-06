papi_command_line(1)                                                                                 PAPI                                                                                papi_command_line(1)



NAME
       papi_command_line - executes PAPI preset or native events from the command line.

Synopsis
       papi_command_line < event > < event > ...

Description
       papi_command_line is a PAPI utility program that adds named events from the command line to a PAPI EventSet and does some work with that EventSet. This serves as a handy way to see if events can be
       counted together, and if they give reasonable results for known work.

Options
       · -u Display output values as unsigned integers
       · -x Display output values as hexadecimal
       · -h Display help information about this utility.
Bugs
       There are no known bugs in this utility. If you find a bug, it should be reported to the PAPI Mailing List at ptools-perfapi@ptools.org.



Version 5.2.0.0                                                                                Tue Oct 30 2018                                                                           papi_command_line(1)
