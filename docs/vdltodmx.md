vdltodmx(1)                                                                                General Commands Manual                                                                                vdltodmx(1)



NAME
       vdltodmx - dmx configuration file parser and printer

SYNOPSIS
       vdltodmx infile outfile

DESCRIPTION
       vdltodmx reads the input file, which should be in VDL configuration file format.  After a successful parse, a file in Xdmx configuration file format is written to the output file.

       The VDL file format is used with xmovie, which is available from http://www.llnl.gov/icc/lc/img/xmovie/xmovie.html

EXAMPLE
       Given the following VDL-format file:
              0
              2
              #
              #
              2560 2048 Left two-thirds [restrict=*:2]
              2
              :2.1 1280 2048   0    0 0 0
              :2.2 1280 2048   1280 0 0 0
              4
              1280 1024 0      0
              1280 1024 0      1024
              1280 1024 1280   0
              1280 1024 1280   1024
              #
              2560 2048 Right two-thirds [restrict=*:2]
              2
              :2.2 1280 2048   0   0 0 0
              :2.3 1280 2048   1280 0 0 0
              4
              1280 1024 1280    0
              1280 1024 1280    1024
              1280 1024 2560 0
              1280 1024 2560 1024
       the following DMX-format file will be produced:
              #
              #
              virtual "Left two-thirds" 2560x2048 {
                  display :2.1 1280x2048;
                  display :2.2 1280x2048 @1280x0;
              }
              #
              virtual "Right two-thirds" 2560x2048 {
                  display :2.2 1280x2048;
                  display :2.3 1280x2048 @1280x0;
              }

BUGS
       If the VDL file is not in the expected format, the program will probably dump core.

SEE ALSO
       Xdmx(1), xdmxconfig(1), vdl(3), xmovie(1)



X Version 11                                                                                  xorg-server 1.18.3                                                                                  vdltodmx(1)
