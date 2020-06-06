AMPLOT(8)                                                                               System Administration Commands                                                                              AMPLOT(8)



NAME
       amplot - visualize the behavior of Amanda

SYNOPSIS
       amplot [-b] [-c] [-e] [-g] [-l] [-p] [-t T] amdump_files


DESCRIPTION
       Amplot reads an amdump output file that Amanda generates each run (e.g.  amdump.1) and translates the information into a picture format that may be used to determine how your installation is doing
       and if any parameters need to be changed.  Amplot also prints out amdump lines that it either does not understand or knows to be warning or error lines and a summary of the start, end and total time
       for each backup image.

       Amplot is a shell script that executes an awk program (amplot.awk) to scan the amdump output file. It then executes a gnuplot program (amplot.g) to generate the graph. The awk program is written in
       an enhanced version of awk, such as GNU awk (gawk(1) version 2.15 or later) or nawk(1).

       During execution, amplot generates a few temporary files that gnuplot uses. These files are deleted at the end of execution.

       See the amanda(8) man page for more details about Amanda.

OPTIONS
       -b
           Generate b/w postscript file (need -p).

       -c
           Compress amdump_files after plotting.

       -e
           Extend the X (time) axis if needed.

       -g
           Direct gnuplot output directly to the X11 display (default).

       -p
           Direct postscript output to file YYYYMMDD.ps (opposite of -g).

       -l
           Generate landscape oriented output (needs -p).

       -t T
           Set the right edge of the plot to be T hours.

       The amdump_files may be in various compressed formats (compress, gzip, pact, compact).

INTERPRETATION
       The figure is divided into a number of regions. There are titles on the top that show important statistical information about the configuration and from this execution of amdump. In the figure, the
       X axis is time, with 0 being the moment amdump was started. The Y axis is divided into 5 regions:

       QUEUES: How many backups have not been started, how many are waiting on space in the holding disk and how many have been transferred successfully to tape.

       %BANDWIDTH: Percentage of allowed network bandwidth in use.

       HOLDING DISK: The higher line depicts space allocated on the holding disk to backups in progress and completed backups waiting to be written to tape. The lower line depicts the fraction of the
       holding disk containing completed backups waiting to be written to tape including the file currently being written to tape. The scale is percentage of the holding disk.

       TAPE: Tape drive usage.

       %DUMPERS: Percentage of active dumpers.

       The idle period at the left of the graph is time amdump is asking the machines how much data they are going to dump. This process can take a while if hosts are down or it takes them a long time to
       generate estimates.

BUGS
       Reports lines it does not recognize, mainly error cases but some are legitimate lines the program needs to be taught about.

SEE ALSO
       amanda(8), amdump(8), gnuplot(1), compress(1), gzip(1)

       The Amanda Wiki: : http://wiki.zmanda.com/

AUTHORS
       Olafur Gudmundsson <ogud@tis.com>
           Trusted Information Systems

       Stefan G. Weichinger <sgw@amanda.org>



Amanda 3.3.3                                                                                      01/10/2013                                                                                        AMPLOT(8)
