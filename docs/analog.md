analog(1)                                                     General Commands Manual                                                    analog(1)

NAME
       analog - web server logfile analyser

SYNOPSIS
       analog --help
       analog  [(-|+)1]  [(-|+)4]  [(-|+)5]  [(-|+)6]  [(-|+)7]  [(-|+)A]  [(-|+)a] [-B|+B[options]] [-b|+b[options]] [(-|+)C'configuration-line']
       [-c|+c[options]] [(-|+)D] [(-|+)d] [-E|+E[options]] [-F|+Fdate]  [-f|+f[options]]  [-G]  [+gfilename]  [(-|+)H]  [(-|+)h]  [-I|+I[options]]
       [-i|+i[options]]  [-J|+J[options]]  [-j|+j[options]]  [-K|+K[options]]  [-k|+k[options]] [-L|+L[options]] [-l|+l[options]] [-M|+M[options]]
       [(-|+)m]  [-N|+N[options]]  [-n|+n[options]]  [+Ooutput-file]  [-o|+o[options]]  [(-|+)P]  [-p|+p[options]]  [(-|+)Q]   [-q|+q[[-|+]types]]
       [-R|+R[options]] [-r|+r[options]] [-S|+S[options]] [(-|+)S] [-T|+Tdate] [-t|+t[options]] [(-|+)Ucache] [-u|+u[options]] [-V|+V[[-|+]types]]
       [-v|+v[options]] [(-|+)W] [(-|+)w] [(-|+)X] [(-|+)x] [-Y|+Y[options]] [-y|+y[options]] [-Z|+Z[options]] [(-|+)z] [--settings] [logfile...]

       but normally just

       analog [-G] [+gfilename]

DESCRIPTION
       Analog is a program for analyzing log files, and is designed to be fast and to produce attractive statistics.

       The usual (and easier) way of configuring analog is through a configuration file, not command line options.   For  more  information  about
       writing  a configuration file or about the command line options see Readme.html in the analog documentation.  A description of what options
       are available for the non-time reports is available in othreps.html#othclarg in the analog documentation.

OPTIONS
       --help Display version and help information and exit.

       (-|+)1 Toggle the Yearly Report.

       (-|+)4 Toggle the Quarter-Hour Report.

       (-|+)5 Toggle the Five-Minute Report.

       (-|+)6 Toggle the Quarter-Hour Summary.

       (-|+)7 Toggle the Five-Minute Summary.

       (-|+)A Turn all the reports (except the General Summary) off or on.

       (-|+)a Toggle output style between HTML and PLAIN formats, respectively.

       -B|+B[options]
              Turn the Browser Report off or on, possibly setting options.

       -b|+b[options]
              Turn the Browser Summary off or on, possibly setting options.

       (-|+)C'configuration-line'
              Include configuration-line in the configuration commands.

       -c|+c[options]
              Turn the Status Code Report off or on, possibly setting options.

       (-|+)D Toggle the Daily Report.

       (-|+)d Toggle the Daily Summary.

       -E|+E[options]
              Turn the Redirection Report off or on, possibly setting options.

       -F|+Fdate
              Toggle or set the FROM date.  Use -F to turn the FROM date off, and use +Fdate to set the FROM date.

       -f|+f[options]
              Turn the Referrer Report off or on, possibly setting options.

       -G     Do not use the default configuration file.

       +gfilename
              Add filename to the list of configuration files.

       (-|+)H Turn the Hourly Report off or on, possibly setting options.

       (-|+)h Toggle the Hourly Summary.

       -I|+I[options]
              Turn the Failure Report off or on, possibly setting options.

       -i|+i[options]
              Turn the Directory Report off or on, possibly setting options.

       -J|+J[options]
              Turn the User Failure Report off or on, possibly setting options.

       -j|+j[options]
              Turn the User Redirection Report off or on, possibly setting options.

       -K|+K[options]
              Turn the Failed Referrer Report off or on, possibly setting options.

       -k|+k[options]
              Turn the Redirected Referrer Report off or on, possibly setting options.

       -L|+L[options]
              Turn the Host Failure Report off or on, possibly setting options.

       -l|+l[options]
              Turn the Host Redirection Report off or on, possibly setting options.

       -M|+M[options]
              Turn the Virtual Host Failure Report off or on, possibly setting options.

       (-|+)m Toggle the Monthly Report.

       -N|+N[options]
              Turn the Search Query Report off or on, possibly setting options.

       -n|+n[options]
              Turn the Search Word Report off or on, possibly setting options.

       (-|+)Ooutput-file
              Write output to output-file. Use - for stdout.

       -o|+o[options]
              Turn the Domain Report off or on, possibly setting options.

       (-|+)P Toggle the Processing Time Report.

       (-|+)p Toggle the Operating System Report.

       (-|+)Q Toggle the Quarterly Report.

       -q|+q[[-|+]types]
              Turn all warnings off/on, or remove/add/use exactly specified types of warnings.

       -R|+R[options]
              Turn the Virtual Host Redirection Report off or on, possibly setting options.

       -r|+r[options]
              Turn the Request Report off or on, possibly setting options.

       -S|+S[options]
              Turn the Host Report off or on, possibly setting options.

       -s|+s[options]
              Turn the Referring Site Report off or on, possibly setting options.

       -T|+Tdate
              Toggle or set the TO date.  Use -T to turn the TO date off, and use +Tdate to set the TO date.

       -t|+t[options]
              Turn the File Type Report off or on, possibly setting options.

       (-|+)Ucache
              Use file cache for cache output.

       -u|+u[options]
              Turn the User Report off or on, possibly setting options.

       -V|+V[[-|+]types]
              Turn all debugging off/on, or remove/add/use exactly specified types of debugging messages.

       -v|+v[options]
              Turn the Virtual Host Report off or on, possibly setting options.

       (-|+)W Toggle the Weekly Report.

       (-|+)w Toggle the Hour of the Week Report.

       (-|+)X Toggle GOTOS (on and off only).

       (-|+)x Toggle the General Summary.

       -Y|+Y[options]
              Turn the Internal Search Query Report off or on, possibly setting options.

       -y|+y[options]
              Turn the Internal Search Word Report off or on, possibly setting options.

       -Z|+Z[options]
              Turn the Organization Report off or on, possibly setting options.

       (-|+)z Toggle the File Size Report.

       --settings
              Instead of processing any files, display in English the settings analog would use if it ran  normally.  This  is  useful  for  trou‐
              bleshooting.

       logfile...
              The logfiles to be analysed. Use - for stdin.

SEE ALSO
       The analog home page at http://www.analog.cx/
       The analog documentation on your local machine, or from the analog home page.

BUGS
       An up to date list of known bugs and bug fixes can be found at http://www.analog.cx/bugs.html

AUTHORS
       Analog and related documentation was written by Stephen Turner <analog-author@lists.meer.net>, with contributions from other authors.  (See
       acknow.html in the analog documentation.)  This man page was written by Alexander Toth <alex@purificator.net>.

Analog                                                    Version 6.0    19 December 2004                                                analog(1)
