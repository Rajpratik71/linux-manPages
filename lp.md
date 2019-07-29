lp(1)                             Apple Inc.                            lp(1)

NAME
       lp - print files

SYNOPSIS
       lp  [  -E  ] [ -U username ] [ -c ] [ -d destination[/instance] ] [ -h
       hostname[:port] ] [ -m ] [ -n num-copies ] [ -o option[=value] ] [  -q
       priority ] [ -s ] [ -t title ] [ -H handling ] [ -P page-list ] [ -- ]
       [ file(s) ]
       lp [ -E ] [ -U username ] [ -c ] [ -h hostname[:port] ] [ -i job-id  ]
       [ -n num-copies ] [ -o option[=value] ] [ -q priority ] [ -t title ] [
       -H handling ] [ -P page-list ]

DESCRIPTION
       lp submits files for printing or alters a pending job.  Use a filename
       of "-" to force printing from the standard input.

   THE DEFAULT DESTINATION
       CUPS provides many ways to set the default destination. The LPDEST and
       PRINTER environment variables are consulted  first.   If  neither  are
       set,  the  current default set using the lpoptions(1) command is used,
       followed by the default set using the lpadmin(8) command.

OPTIONS
       The following options are recognized by lp:

       --   Marks the end of options; use this to print  a  file  whose  name
            begins with a dash (-).

       -E   Forces encryption when connecting to the server.

       -U username
            Specifies the username to use when connecting to the server.

       -c   This option is provided for backwards-compatibility only. On sys‐
            tems that support it, this option forces the  print  file  to  be
            copied  to  the  spool directory before printing.  In CUPS, print
            files are always sent to the scheduler via IPP which has the same
            effect.

       -d destination
            Prints files to the named printer.

       -h hostname[:port]
            Chooses an alternate server.

       -i job-id
            Specifies an existing job to modify.

       -m   Sends an email when the job is completed.

       -n copies
            Sets the number of copies to print.

       -o "name=value [ ... name=value ]"
            Sets one or more job options.  See "COMMON JOB OPTIONS" below.

       -q priority
            Sets  the  job  priority  from  1 (lowest) to 100 (highest).  The
            default priority is 50.

       -s   Do not report the resulting job IDs (silent mode.)

       -t "name"
            Sets the job name.

       -H hh:mm

       -H hold

       -H immediate

       -H restart

       -H resume
            Specifies when the job should be printed.  A value  of  immediate
            will  print  the  file immediately, a value of hold will hold the
            job indefinitely, and a UTC time value (HH:MM) will hold the  job
            until  the specified UTC (not local) time.  Use a value of resume
            with the -i option to resume a held job.  Use a value of  restart
            with the -i option to restart a completed job.

       -P page-list
            Specifies  which  pages  to  print in the document.  The list can
            contain a list of numbers and ranges (#-#) separated  by  commas,
            e.g., "1,3-5,16".  The page numbers refer to the output pages and
            not the document's original pages - options like "number-up"  can
            affect the numbering of the pages.

   COMMON JOB OPTIONS
       Aside  from  the printer-specific options reported by the lpoptions(1)
       command, the following generic options are available:

       -o collate=true
            Prints collated copies.

       -o fit-to-page
            Scales the print file to fit on the page.

       -o job-hold-until=when
            Holds the job until the specified  local  time.   "when"  can  be
            "indefinite"  to hold the until released, "day-time" to print the
            job between 6am and 6pm local time,  "night"  to  print  the  job
            between  6pm  and 6am local time, "second-shift" to print the job
            between 4pm and 12am local time, "third-shift" to print  the  job
            between 12am and 8am local time, or "weekend" to print the job on
            Saturday or Sunday.

       -o job-hold-until=hh:mm
            Holds the job until the specified time in hours and minutes UTC.

       -o job-priority=priority
            Set the priority to a value from 1  (lowest)  to  100  (highest),
            which  influences  when  a  job  is  scheduled for printing.  The
            default priority is typically 50.

       -o job-sheets=name
            Prints a cover page (banner) with the document.  The  "name"  can
            be  "classified",  "confidential",  "secret", "standard", "topse‐
            cret", or "unclassified".

       -o job-sheets=start-name,end-name
            Prints cover pages (banners) with the document.

       -o media=size
            Sets the page size to size. Most printers support  at  least  the
            size names "a4", "letter", and "legal".

       -o mirror
            Mirrors each page.

       -o number-up={2|4|6|9|16}
            Prints  2,  4,  6, 9, or 16 document (input) pages on each output
            page.

       -o number-up-layout=layout
            Specifies the layout of pages with the "number-up"  option.   The
            "layout"  string  can  be "btlr", "btrl", "lrbt", "lrtb", "rlbt",
            "rltb", "tblr", or "tbrl" - the first two letters  determine  the
            column  order  while  the  second  two  letters determine the row
            order.  "bt" is bottom-to-top, "lr"  is  left-to-right,  "rl"  is
            right-to-left, and "tb" is top-to-bottom.

       -o orientation-requested=4
            Prints  the  job  in landscape (rotated 90 degrees counter-clock‐
            wise).

       -o orientation-requested=5
            Prints the job in landscape (rotated 90 degrees clockwise).

       -o orientation-requested=6
            Prints the job in reverse portrait (rotated 180 degrees).

       -o outputorder=reverse
            Prints pages in reverse order.

       -o page-border=border
            Prints a border around each document page.  "border" is "double",
            "double-thick", "single", or "single-thick".

       -o page-ranges=page-list
            Specifies  which  pages  to  print in the document.  The list can
            contain a list of numbers and ranges (#-#) separated  by  commas,
            e.g., "1,3-5,16".  The page numbers refer to the output pages and
            not the document's original pages - options like "number-up"  can
            affect the numbering of the pages.

       -o sides=one-sided
            Prints on one side of the paper.

       -o sides=two-sided-long-edge
            Prints on both sides of the paper for portrait output.

       -o sides=two-sided-short-edge
            Prints on both sides of the paper for landscape output.

CONFORMING TO
       Unlike the System V printing system, CUPS allows printer names to con‐
       tain any printable character except SPACE, TAB, "/",  or  "#".   Also,
       printer and class names are not case-sensitive.

       The  -q option accepts a different range of values than the Solaris lp
       command, matching the IPP job priority values (1-100, 100  is  highest
       priority) instead of the Solaris values (0-39, 0 is highest priority).

EXAMPLES
       Print two copies of a document to the default printer:

           lp -n 2 filename

       Print a double-sided legal document to a printer called "foo":

           lp -d foo -o media=legal -o sides=two-sided-long-edge filename

       Print a presentation document 2-up to a printer called "foo":

           lp -d foo -o number-up=2 filename

SEE ALSO
       cancel(1),   lpadmin(8),   lpoptions(1),   lpq(1),   lpr(1),  lprm(1),
       lpstat(1), CUPS Online Help (http://localhost:631/help)

COPYRIGHT
       Copyright © 2007-2017 by Apple Inc.

2 May 2016                           CUPS                               lp(1)
