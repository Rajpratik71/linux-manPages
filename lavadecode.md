lavadecode(1)                           General Commands Manual                          lavadecode(1)

NAME
       lavadecode - Decode a LAVAFLOW stream into human readable form.

SYNOPSIS
       lavadecode [options] <lavaflow-file

DESCRIPTION
       lavadecode decodes a LAVAFLOW stream into human readable form.

       A  LAVAFLOW stream is the printer language used by some Konica Minolta printers, such as the KM
       magicolor 2530 DL.

COMMAND LINE OPTIONS
       These are the options that can appear on the command line.

       -d basename
              Basename of .pbm file for saving decompressed planes.

       -h     Print hex file offsets.

       -o     Print file offsets.

       -D level
              Set Debug level [0].

EXAMPLES
       Decode an LAVAFLOW stream file created by foo2lava.

       $ lavadecode -h < testpage.prn
            0: \033%-12345X@PJL JOB NAME="stdin"
           1f: \033%-12345X@PJL JOB USERNAME=""
           3d: \033%-12345X@PJL JOB TIMESTAMP="07/20/2007"
           66: \033%-12345X@PJL JOB OSINFO="Linux/2.6.20-1.2316.fc5"
           99: \033%-12345X@PJL ENTER LANGUAGE=LAVAFLOW
           bf: \033E                  RESET
           c1: \033&l0S               DUPLEX: [off]
           c6: \033&l0G
           cb: \033&u1200D            X RESOLUTION: [1200]
           d3: \033&l1X               COPIES: [1]
           d8: \033&x1X               TRANSMIT ONCE COPIES: [1]
           dd: \033&l0O               ORIENTATION: [port]
           e2: \033*r1U               NBIE: [1]
           e7: \033*g8W               BW/COLOR: [8]
                                       fmt=2 np=1
                                       BLACK:  X=1200, Y=600, unk=0, #=4(2)
           f4: \033*b1234M            COMPRESSION: [1234] (JBIG)
           fc: \033&l2A               PAGE SIZE: [letter]
          101: \033&l255H             PAPER SOURCE: [auto]
          108: \033&l0M               MEDIA TYPE: [plain]
          10d: \033&l0E               TOP MARGIN: [0]
          112: \033*r9792S            X RASTER: [9792,0x2640]
          11a: \033*r6400T            Y RASTER: [6400,0x1900]
          122: \033&l0U
          127: \033&l0Z
          12c: \033*p200X             X OFFSET: [200]
          133: \033*p200Y             Y OFFSET: [200]
          13a: \033*r1A               [Page 1]
          13f: \033*b20V              [black]
                                       DL = 0, D = 0, P = 1, - = 0, XY = 9792 x 6400
                                       L0 = 128, MX = 0, MY = 0
                                       Order   = 3  ILEAVE SMID
                                       Options = 92  LRLTWO TPDON TPBON DPON
                                       50 stripes, 0 layers, 1 planes
          159: \033*b65536V           JBIG data (first) [65536,0x10000]
                                ff 02 c2 79 54 3e be e1 a0 de 08 9a b1 d2 c2 59
                               ... ae 88 ef a7 c7 96 d3 96 a6 d7 2c 06 38 75 22 44
        10162: \033*b26432W           JBIG data (end) [26432,0x6740]
                                0e 89 66 ce 01 41 41 41 41 41 41 41 41 41 41 41
                               ... 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
        168ab: \033*x3887138K         BLACK DOTS: [3887138]
        168b6: \033*x58781662W        BLACK WHITEDOTS: [58781662]
        168c2: \033*rC                END PAGE
        168c6: \033&l0H               PAPER SOURCE: [eject]
        168cb: \033E                  RESET
        168cd: \033%-12345X

FILES
       /usr/bin/lavadecode

SEE ALSO
       foo2lava-wrapper(1), foo2lava(1)

AUTHOR
       Rick Richardson <rick.richardson@comcast.net>
       http://foo2lava.rkkda.com/

