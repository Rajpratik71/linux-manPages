initctl2dot(8)                                                                           System Manager's Manual                                                                           initctl2dot(8)

NAME
       initctl2dot - manual page for initctl2dot

SYNOPSIS
       initctl2dot [OPTIONS]

DESCRIPTION
       Convert initctl(8) output to GraphViz dot(1) format.

       With no options, initctl(8) will be invoked automatically and the output written to file upstart.dot. If run from within an Upstart user session, unless --system is specified, the data generated
       will be for the user session.

OPTIONS
       -f INFILE , --infile=INFILE
              File to read initctl(8) output from ("initctl show-config -e"). If not specified, initctl(8) will be run automatically.

       -h     Display usage statement.

       -r RESTRICTIONS , --restrict-to-jobs=RESTRICTIONS
              Limit display of start on and stop on conditions to comma-separated list of jobs.

       -w OUTFILE , --outfile=OUTFILE
              File to write output to.

       --color-emits=COLOR_EMITS
              Specify color for 'emits' lines.

       --color-start-on=COLOR_START_ON
              Specify color for 'start on' lines.

       --color-stop-on=COLOR_STOP_ON
              Specify color for 'stop on' lines.

       --color-event=COLOR_EVENT
              Specify color for event boxes.

       --color-text=COLOR_TEXT
              Specify color for summary text.

       --color-bg=COLOR_BG
              Specify background color for diagram.

       --color-event-text=COLOR_EVENT_TEXT
              Specify color for text in event boxes.

       --color-job-text=COLOR_JOB_TEXT
              Specify color for text in job boxes.

       --color-job=COLOR_JOB
              Specify color for job boxes.

       --system
              Connect to the Upstart system session.

       --user Connect to the Upstart user session.

AUTHOR
       Written by James Hunt <james.hunt@ubuntu.com>

REPORTING BUGS
       Report bugs at <https://launchpad.net/upstart/+bugs>

COPYRIGHT
       Copyright © 2011 Canonical Ltd.
       This is free software; see the source for copying conditions.  There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

SEE ALSO
       init(8) initctl(8)

Upstart                                                                                         2013-03-22                                                                                 initctl2dot(8)
