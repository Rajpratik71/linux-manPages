papi_xml_event_info(1)                                                                               PAPI                                                                              papi_xml_event_info(1)



NAME
       papi_xml_event_info - papi_xml_event_info utility.

       file event_info.c

NAME
       papi_xml_event_info - provides detailed information for PAPI events in XML format

Synopsis
Description
       papi_native_avail is a PAPI utility program that reports information about the events available on the current platform in an XML format.

       It will attempt to create an EventSet with each event in it, which can be slow.

Options
       · -h print help message
       · -p print only preset events
       · -n print only native events
       · -c COMPONENT print only events from component number COMPONENT event1, event2, ... Print only events that can be created in the same event set with the events event1, event2, etc.
Bugs
       There are no known bugs in this utility. If you find a bug, it should be reported to the PAPI Mailing List at ptools-perfapi@ptools.org.



Version 5.2.0.0                                                                                Tue Oct 30 2018                                                                         papi_xml_event_info(1)
