openipmi_eventd(1)                                                                            IPMI event handler                                                                           openipmi_eventd(1)



NAME
       openipmi_eventd - An IPMI event handler


SYNOPSIS
       openipmi_eventd <domain name> <connection parms> <options> <program> [<parm1> [<parm2> [...]]]

DESCRIPTION
       The openipmi_eventd program listens for IPMI events for the given connection and sends them to another program to process, or to a file.


PARAMETERS
       <domain name>
              The name to use for the OpenIPMI domain.  This will appear in logs and some names.


       <connection parms>
              The parameters for the connection depend on the connection type.  These are all described in openipmi_conparms (7)


       <options>
              Zero or more of the options defined in OPTIONS below.


       <program> [<parm1> [<parm2> [...]]]
              The program to run.  This must be the full path to the program.  Any given parameters are passed to the program before any IPMI parameters.


OPTIONS
       -f filename, --outfile filename
              Send all events to the given file


       -k, --exec-now
              Immediately spawn the given program and send the event information to that program's standard input.  The program should not quit, if it does then this program will exit with an error.


       -i, --event-stdin
              Send the event information to the program's standard input instead of the commandline.


       -e, --delete-events
              Delete  events  from  the  SEL (System Event Log) once they have been processed.  Note that the program has to have handled the event without error for the event to be deleted.  Otherwise the
              events are not deleted from the SEL.


       -b, --dont-daemonize
              Do not daemonize the program, run it as a foreground process.


       -d, --debug
              Debug the program, turn on output, send all logs to stderr, and do not run the process as a daemon.


USAGE
       When started, this program will connect to the given IPMI domain, ignore all existing logs, and set up to listen from logs from all sources.  When an event comes in, it will handle the event depend-
       ing on how it is configured.

       By  default the program will be called on each log and the event information passed on the program's command line. The first parameter (after the ones given on the openipmi_eventd command line) will
       be the event type, the rest are key-value pairs as defined below.

       If -i is given on the commandline, instead of passing in the event information on the command line, it will be passed into the program's standard input.  The first line will be the event  type,  and
       each line will have a key-value pair up until the last line, which will be endevent.

       If -k is given on the command line, the program will be started immediately and expected to take events on its standard input as they come in.  Each event will start with an event type, contain key-
       value pairs, and end in endevent.


EVENT KEY-VALUE PAIRS
       The first line and parameter of an event is always the event type (either threshold , discrete , or unknown ).  Then the following then the following, in no particular  order.   When  sending  to  a
       file, or another program via standard input, endevent will mark the end of an event.


              assert true|false
                     If true, the event is being asserted (the alarm present).  If false, the alarm was present but has now gone away.

              eventtype <num>
                     The event type, per the IPMI specification.

              eventtime <num>
                     The time (in seconds) for the IPMI event.  It is 64 bits.

              eventdata <vals>
                     The raw event data, vals is a list of hex numbers.

              id <name>
                     The  OpenIPMI  id of the sensor.  This is in the format: <entity_id>.<entity_instance>.<sensor_name> where the entity id and instance identify the object being monitored and the sensor
                     names comes from the sensor.  Only for discrete and threshold events.

              val <floatnum>
                     The sensor value that cause the event, in floating point format.  Optional and only present for threshold sensors.

              raw <hexnum>
                     The sensor value that cause the event, in raw (hex) format.  Optional and only present for threshold sensors.

              off <num>
                     The bit in the sensor that caused the event, only present for discrete sensors.

              severity
                     The severity of the event.  For discrete sensors this optional and is a number between 0 and 14.  Them meaning depends on the specific sensor type.  For threshold sensors this  is  one
                     of:

                     lower_non_critical

                     lower_critical

                     lower_non_recoverable

                     upper_non_critical

                     upper_critical

                     upper_non_recoverable

              prevseverity
                     for discrete sensors.

              direction
                     The  direction of the event, only for threshold sensors.  This can be difficult to understand and is not consistent on IPMI systems.  The IPMI specifiation does define what this means.
                     For instance, what does an assertion of an upper critcal event going low mean?


SEE ALSO
       openipmi_conparms(7)


KNOWN PROBLEMS
       None


AUTHOR
       Corey Minyard <cminyard@mvista.com>



OpenIPMI                                                                                           03/4/15                                                                                 openipmi_eventd(1)
