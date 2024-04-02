
cdck(1)                                                 User Contributed Perl Documentation                                                cdck(1)

NAME
              cdck - simple CD/DVD check program

SYNOPSIS
              cdck [-d /dev/devname] [-i] [-t] [-v] [-p] [-o plot-file.dat]

DESCRIPTION
              -d CD/DVD device name, default is /dev/cdrom

              -i Print CD/DVD information and quit, perform no timings (default mode)

              -t Perform timing test

                 Note: this option will not work for audio CDs.

              -p Save data for gnuplot(1) program

              -o specify plot file, ./cdck-plot.dat is the default

              -V Print version

              -v Verbose operations

              To actually plot your data you have to start gnuplot and plot the datafile:
                 $ gnuplot
                 gnuplot> plot "cdck-plot.dat"

COPYRIGHT
              This manpage was written by gregor herrmann <gregoa@debian.org>
              for the Debian project, but may be used by others.

perl v5.20.2                                                        2015-03-25                                                             cdck(1)
