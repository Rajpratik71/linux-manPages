ddstdecode(1)                                                                           General Commands Manual                                                                          ddstdecode(1)

NAME
       ddstdecode - Decode a Ricoh DDST stream into human readable form.

SYNOPSIS
       ddstdecode [options] <ddst-file

DESCRIPTION
       ddstdecode decodes a Ricoh DDST stream into human readable form.

       A Ricoh DDST stream is the printer language used by some Ricoh printers. From what I can tell, it is pbmtojbg(1) wrapped with some PJL.

COMMAND LINE OPTIONS
       These are the options that can appear on the command line.

       -d basename
              Basename of .pbm file for saving decompressed planes.

       -h     Print hex file offsets.

       -o     Print file offsets.

       -D level
              Set Debug level [0].

EXAMPLES
       Decode an Ricoh DDST stream file created by a Ricoh SP112.

       $ ddstdecode -h ~/testpage-ricoh-sp112.prn
            0:  33%-12345X@PJL
            f: @PJL SET TIMESTAMP=2017/03/16 16:53:16
           37: @PJL SET FILENAME=testpage.pdf
           57: @PJL SET COMPRESS=JBIG
           6f: @PJL SET USERNAME=rick
           87: @PJL SET COVER=OFF
           9b: @PJL SET HOLD=OFF
           ae: @PJL SET PAGESTATUS=START
           c9: @PJL SET COPIES=1
           dc: @PJL SET MEDIASOURCE=TRAY1
           f8: @PJL SET MEDIATYPE=PLAINRECYCLE
          119: @PJL SET PAPER=LETTER
          130: @PJL SET PAPERWIDTH=5100
          14a: @PJL SET PAPERLENGTH=6600
          165: @PJL SET RESOLUTION=600
          17e: @PJL SET IMAGELEN=60604
          197: DDST_JBIG_DATA_BEGIN 60604 bytes
                       DL = 0, D = 0, P = 1, - = 0, XY = 5100 x 6600
                       L0 = 128, MX = 0, MY = 0
                       Order   = 3  ILEAVE SMID
                       Options = 72  LRLTWO TPBON
                       52 stripes, 0 layers, 1 planes
         ee53: DDST_JBIG_DATA_END
         ee53: @PJL SET DOTCOUNT=1765571
         ee6e: @PJL SET PAGESTATUS=END
         ee87: @PJL EOJ
         ee91:  33%-12345X

FILES
       /usr/bin/ddstdecode

SEE ALSO
       foo2ddst-wrapper(1), foo2ddst(1), pbmtojbg(1)

AUTHOR
       Rick Richardson <rick.richardson@comcast.net>
       http://foo2xqx.rkkda.com/

