lpr(1)                            Apple Inc.                           lpr(1)

NAME
       lpr - print files

SYNOPSIS
       lpr  [  -E  ]  [  -H  server[:port]  ]  [  -U username ] [ -P destina‐
       tion[/instance] ] [ -# num-copies  [  -h  ]  [  -l  ]  [  -m  ]  [  -o
       option[=value]  ]  [ -p ] [ -q ] [ -r ] [ -C title ] [ -J title ] [ -T
       title ] [ file(s) ]

DESCRIPTION
       lpr submits files for printing.  Files named on the command  line  are
       sent to the named printer or the default destination if no destination
       is specified.  If no files are listed on the command-line,  lpr  reads
       the print file from the standard input.

   THE DEFAULT DESTINATION
       CUPS provides many ways to set the default destination. The LPDEST and
       PRINTER environment variables are consulted  first.   If  neither  are
       set,  the  current default set using the lpoptions(1) command is used,
       followed by the default set using the lpadmin(8) command.

OPTIONS
       The following options are recognized by lpr:

       -E   Forces encryption when connecting to the server.

       -H server[:port]
            Specifies an alternate server.

       -C "name"

       -J "name"

       -T "name"
            Sets the job name/title.

       -P destination[/instance]
            Prints files to the named printer.

       -U username
            Specifies an alternate username.

       -# copies
            Sets the number of copies to print.

       -h   Disables  banner  printing.  This  option  is  equivalent  to  -o
            job-sheets=none.

       -l   Specifies that the print file is already formatted for the desti‐
            nation and should be sent  without  filtering.   This  option  is
            equivalent to -o raw.

       -m   Send an email on job completion.

       -o option[=value]
            Sets a job option.  See "COMMON JOB OPTIONS" below.

       -p   Specifies  that  the print file should be formatted with a shaded
            header with the date, time, job  name,  and  page  number.   This
            option  is  equivalent  to -o prettyprint and is only useful when
            printing text files.

       -q   Hold job for printing.

       -r   Specifies that the named print files should be deleted after sub‐
            mitting them.

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

NOTES
       The  -c,  -d, -f, -g, -i, -n, -t, -v, and -w options are not supported
       by CUPS and produce a warning message if used.

EXAMPLES
       Print two copies of a document to the default printer:

           lpr -# 2 filename

       Print a double-sided legal document to a printer called "foo":

           lpr -P foo -o media=legal -o sides=two-sided-long-edge filename

       Print a presentation document 2-up to a printer called "foo":

           lpr -P foo -o number-up=2 filename

SEE ALSO
       cancel(1),   lp(1),   lpadmin(8),   lpoptions(1),   lpq(1),   lprm(1),
       lpstat(1), CUPS Online Help (http://localhost:631/help)

COPYRIGHT
       Copyright © 2007-2017 by Apple Inc.

2 May 2016                           CUPS                              lpr(1)
