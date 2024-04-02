papi_native_avail(1)                                                                                 PAPI                                                                                papi_native_avail(1)



NAME
       papi_native_avail - papi_native_avail utility.

       file native_avail.c

NAME
       papi_native_avail - provides detailed information for PAPI native events.

Synopsis
Description
       papi_native_avail is a PAPI utility program that reports information about the native events available on the current platform. A native event is an event specific to a specific hardware platform.
       On many platforms, a specific native event may have a number of optional settings. In such cases, the native event and the valid settings are presented, rather than every possible combination of
       those settings. For each native event, a name, a description, and specific bit patterns are provided.

Options
       · --help, -h print this help message
       · -d display detailed information about native events
       · -e EVENTNAME display detailed information about named native event
       · -i EVENTSTR include only event names that contain EVENTSTR
       · -x EVENTSTR exclude any event names that contain EVENTSTR
       · --noumasks suppress display of Unit Mask information
       Processor-specific options

       · --darr display events supporting Data Address Range Restriction
       · --dear display Data Event Address Register events only
       · --iarr display events supporting Instruction Address Range Restriction
       · --iear display Instruction Event Address Register events only
       · --opcm display events supporting OpCode Matching
       · --nogroups suppress display of Event grouping information
Bugs
       There are no known bugs in this utility. If you find a bug, it should be reported to the PAPI Mailing List at ptools-perfapi@ptools.org.



Version 5.2.0.0                                                                                Tue Oct 30 2018                                                                           papi_native_avail(1)
