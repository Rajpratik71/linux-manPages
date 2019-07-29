AUVIRT(8)                                                 System Administration Utilities                                                AUVIRT(8)

NAME
       auvirt - a program that shows data related to virtual machines

SYNOPSIS
       auvirt [ OPTIONS ]

DESCRIPTION
       auvirt  shows  a  list of guest sessions found in the audit logs. If a guest is specified, only the events related to that guest is consid‐
       ered. To specify a guest, both UUID or VM name can be given.

       For each guest session the tool prints a record with the domain name, the user that started the guest, the time when the guest was  started
       and the time when the guest was stoped.

       If  the  option  "--all-events"  is given a more detailed output is shown. In this mode other records are shown for guest's stops, resource
       assignments, host shutdowns and AVC and anomaly events. The first field indicates the event type and can have the following values:  start,
       stop, res, avc, anom and down (for host shutdowns).

       Resource  assignments have the additional fields: resource type, reason and resource. And AVC records have the following additional fields:
       operation, result, command and target.

       By default, auvirt reads records from the system audit log file. But --stdin and --file options can be specified to change this behavior.

OPTIONS
       --all-events
              Show records for all virtualization related events.

       --debug
              Print debug messages to standard output.

       -f, --file file
              Read records from the given file instead from the system audit log file.

       -h, --help
              Print help message and exit.

       --proof
              Add after each event a line containing all the identifiers of the audit records used to calculate the event.  Each  identifier  con‐
              sists of unix time, milliseconds and serial number.

       --show-uuid
              Add the guest's UUID to each record.

       --stdin
              Read records from the standard input instead from the system audit log file.  This option cannot be specified with --file.

       --summary
              Print  a  summary  with  information  about the events found. The summary contains the considered range of time, the number of guest
              starts and stops, the number of resource assignments, the number of AVC and anomaly events, the number of  host  shutdowns  and  the
              number of failed operations.

       -te, --end [end-date] [end-time]
              Search for events with time stamps equal to or before the given end time. The format of end time depends on your locale. If the date
              is omitted, today is assumed. If the time is omitted, now is assumed. Use 24 hour clock time rather than AM or PM to  specify  time.
              An example date using the en_US.utf8 locale is 09/03/2009. An example of time is 18:00:00. The date format accepted is influenced by
              the LC_TIME environmental variable.

              You may also use the word: now, recent, today, yesterday, this-week, week-ago, this-month,  this-year.  Today  means  starting  now.
              Recent  is  10 minutes ago. Yesterday is 1 second after midnight the previous day.  This-week means starting 1 second after midnight
              on day 0 of the week determined by your locale (see localtime). This-month means 1 second after midnight on  day  1  of  the  month.
              This-year means the 1 second after midnight on the first day of the first month.

       -ts, --start [start-date] [start-time]
              Search  for events with time stamps equal to or after the given end time. The format of end time depends on your locale. If the date
              is omitted, today is assumed. If the time is omitted, midnight is assumed. Use 24 hour clock time rather than AM or  PM  to  specify
              time.  An example date using the en_US.utf8 locale is 09/03/2009. An example of time is 18:00:00. The date format accepted is influ‐
              enced by the LC_TIME environmental variable.

              You may also use the word: now, recent, today, yesterday, this-week, this-month, this-year.  Today means starting at 1 second  after
              midnight.  Recent is 10 minutes ago. Yesterday is 1 second after midnight the previous day.  This-week means starting 1 second after
              midnight on day 0 of the week determined by your locale (see localtime). This-month means 1 second after midnight on day  1  of  the
              month. This-year means the 1 second after midnight on the first day of the first month.

       -u, --uuid  UUID
              Only show events related to the guest with the given UUID.

       -v, --vm  name
              Only show events related to the guest with the given name.

EXAMPLES
       To see all the records in this month for a guest

       auvirt --start this-month --vm GuestVmName --all-events

SEE ALSO
       aulast(8), ausearch(8), aureport(8).

AUTHOR
       Marcelo Cerri

IBM Corp                                                             Dec 2011                                                            AUVIRT(8)
