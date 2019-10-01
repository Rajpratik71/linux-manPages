OPHELP(1)                                                                                  General Commands Manual                                                                                  OPHELP(1)



NAME
       ophelp - list OProfile events

SYNOPSIS
       ophelp [ options ] [event name]

DESCRIPTION
       By default, ophelp lists the available performance counter options. If you give it a symbolic event name, it will return the hardware value (e.g. "ophelp DATA_MEM_REFS").


OPTIONS
       --cpu-type / -c
              Show the events for the given numerical CPU type.

       --get-cpu-type / -r
              Show the symbolic CPU name.

       --get-default-event / -d
              Show the default event for the specified CPU type.

       --check-events / -e [events]
              Check the given space-separated event descriptions for validity.  If the events are valid, show which pmu counter each event would be assigned to.

       --callgraph [callgraph_depth]
              Use the callgraph depth to compute the higher minimum sampling intervals for the events.

       --unit-mask / -u [event]
              Show the default unit mask for the given event.

       --symbolic-unit-mask / -U [event]
              Show the numerical unit and extra mask for given event.

       --extra-mask / -E [event]
              Show the extra unit mask for given event.

       --xml / -X
              List events in XML format.

       --help / -? / --usage
              Show help message.

       --version / -v
              Show version.


ENVIRONMENT
       No special environment variables are recognised by ophelp.


FILES
       $prefix/share/oprofile/
              Event description files used by OProfile.

       /var/lib/oprofile/samples/
              The location of the generated sample files.


VERSION
       This man page is current for oprofile-0.9.9.


SEE ALSO
       /usr/share/doc/oprofile/, oprofile(1)



4th Berkeley Distribution                                                                    Fri 02 November 2018                                                                                   OPHELP(1)
