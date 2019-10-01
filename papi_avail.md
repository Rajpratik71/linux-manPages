papi_avail(1)                                                                                        PAPI                                                                                       papi_avail(1)



NAME
       papi_avail - papi_avail utility.

       file avail.c

Name
       papi_avail - provides availability and detail information for PAPI preset events.

Synopsis
       papi_avail [-adht] [-e event]

Description
       papi_avail is a PAPI utility program that reports information about the current PAPI installation and supported preset events. Using the -e option, it will also display information about specific
       native events.

Options
       · -a Display only the available PAPI preset events.
       · -d Display PAPI preset event information in a more detailed format.
       · -h Display help information about this utility.
       · -t Display the PAPI preset event information in a tabular format. This is the default.
       · -e < event > Display detailed event information for the named event. This event can be either a preset or a native event.
Bugs
       There are no known bugs in this utility. If you find a bug, it should be reported to the PAPI Mailing List at ptools-perfapi@ptools.org.



Version 5.2.0.0                                                                                Tue Oct 30 2018                                                                                  papi_avail(1)
