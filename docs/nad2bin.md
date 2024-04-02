NAD2BIN(1)                                                    General Commands Manual                                                   NAD2BIN(1)

NAME
       nad2bin - convert nad ASCII files into binary format usable by nad2nad

DESCRIPTION
       This command is undocumented upstream.  This very rough documentation was quickly assembled by your friendly Debian maintainer (who doesn't
       use this command, and so is not the best person to document it!).

       The proj package includes the nad2nad binary, the North American Datum conversion filter used to convert data between North  America  Datum
       1927 (NAD27) and North American Datum 1983, and cs2cs a binary that performs transformation between the source and destination cartographic
       coordinate system on a set of input points.  The coordinate system transformation can include translation between projected and  geographic
       coordinates as well as the application of datum shifts.

       See the nad2nad(1) and cs2cs(1) man pages for more information.

       nad2nad  and  cs2cs need arch-dependent conversion data files in a library directory, /usr/share/proj/ Those files are included in the proj
       Debian package since 4.6.1-5.  To produce/update them yourself, get the *.lla files from

       http://download.osgeo.org/proj/proj-datumgrid-1.5.zip

       and then run nad2bin to produce the binary files used by nad2nad and cs2cs like so:

       # nad2bin < conus.lla /usr/share/proj/conus

       Test nad2nad with the following example:

       $ nad2nad -i 83 -o 27 -r conus << EOF

       71d14'58.27"W   44d20'15.227"N

       EOF

       It should produce:

       71d15'W 44d20'15"N

SEE ALSO
       nad2nad(1), cs2cs(1)

AUTHOR
       This manual page by Peter S Galbraith <psg@debian.org>.

                                                                                                                                        NAD2BIN(1)
