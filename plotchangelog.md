PLOTCHANGELOG(1)                                                                         General Commands Manual                                                                         PLOTCHANGELOG(1)

NAME
       plotchangelog - graph Debian changelogs

SYNOPSIS
       plotchangelog [options] changelog ...

DESCRIPTION
       plotchangelog  is  a tool to aid in visualizing a Debian changelog. The changelogs are graphed with gnuplot(1) , with the X axis of the graph denoting time of release and the Y axis denoting the
       Debian version number of the package. Each individual release of the package is represented by a point, and the points are color coded to indicate who released that version of the  package.  The
       upstream version number of the package can also be labeled on the graph.

       Alternatively,  the  Y  axis can be configured to display the size of the changelog entry for each new version. Or it can be configured to display approximately how many bugs were fixed for each
       new version.

       Note that if the package is a Debian-specific package, the entire package version will be used for the Y axis. This does not always work perfectly.

READING THE GRAPH
       The general outline of a package's graph is typically a series of peaks, starting at 1, going up to n, and then returning abruptly to 1. The higher the peaks, the more  releases  the  maintainer
       made  between new upstream versions of the package. If a package is Debian-only, it's graph will just grow upwards without ever falling (although a bug in this program may cause it to fall some‐
       times, if the version number goes from say, 0.9 to say, 0.10 - this is interpreted wrong...)

       If the graph dips below 1, someone made a NMU of the package and upgraded it to a new upstream version, thus setting the Debian version to 0. NMU's in general appear as  fractional  points  like
       1.1,  2.1, etc. A NMU can also be easily detected by looking at the points that represent which maintainer uploaded the package -- a solitary point of a different type than the points before and
       after it is typically a NMU.

       It's also easy to tell by looking at the points when a package changes maintainers.

OPTIONS
       -l, --linecount
              Instead of using the Debian version number as the Y axis, use the number of lines in the changelog entry for each version.  Cannot be used together with --bugcount.

       -b, --bugcount
              Instead of using the Debian version number as the Y axis, use the number of bugs that were closed by each changelog entry. Note that this number is obtained by searching  for  "#dddd"  in
              the changelog, and so it may be inaccurate.  Cannot be used together with --linecount.

       -c, --cumulative
              When used together with either --bugcount or --linecount, graphs the cumulative count rather than the count in each individual changelog entry.

       -v, --no-version
              Do not show upstream version labels. Useful if the graph gets too crowded.

       -m, --no-maint
              Do not differentiate between different maintainers of the package.

       -s file, --save=file
              Save the graph to file in PostScript format instead of immediately displaying it.

       -u, --urgency
              Use larger points when displaying higher-urgency package uploads.

       --verbose
              Output the gnuplot script that is fed into gnuplot (for debugging purposes).

       -gcommands, --gnuplot=commands
              This  allows  you to insert gnuplot(1) commands into the gnuplot script that is used to generate the graph. The commands are placed after all initialization but before the final plot com‐
              mand. This can be used to override the default look provided by this program in arbitrary ways. You can also use things like "set terminal png color" to change the output file type, which
              is useful in conjunction with the -s option.

       --help Show a usage summary.

       --version
              Display version, author and copyright information.

       --noconf, --no-conf
              Do not read any configuration files (see below).

       changelog ...
              The  changelog  files to graph. If multiple files are specified they will all be displayed on the same graph. The files may be compressed with gzip. Any text in them that is not in Debian
              changelog format will be ignored.

CONFIGURATION VARIABLES
       The two configuration files /etc/devscripts.conf and ~/.devscripts are sourced by a shell in that order to set configuration variables.  The --no-conf option can be used to prevent reading these
       files.  Environment variable settings are ignored when these configuration files are read.  The currently recognised variables are:

       PLOTCHANGELOG_OPTIONS
              This is a space-separated list of options to always use, for example -l -b.  Do not include -g or --gnuplot among this list as it may be ignored; see the next variable instead.

       PLOTCHANGELOG_GNUPLOT
              These are gnuplot commands which will be prepended to any such commands given on the command line.

SEE ALSO
       devscripts.conf(5)

AUTHOR
       Joey Hess <joey@kitenet.net>

DEBIAN                                                                                       Debian Utilities                                                                            PLOTCHANGELOG(1)
