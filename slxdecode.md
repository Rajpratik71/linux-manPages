slxdecode(1)                            General Commands Manual                           slxdecode(1)

NAME
       slxdecode - Decode a SLX stream into human readable form.

SYNOPSIS
       slxdecode [options] <slx-file

DESCRIPTION
       slxdecode decodes a SLX stream into human readable form.

       A SLX stream is the printer language used by some Lexmark printers, such as the C500.

       More information on the Software Imaging K.K. SLX stream can be found at:

              http://softwareimaging.com/products-services/sorcerer/index.asp

COMMAND LINE OPTIONS
       These are the options that can appear on the command line.

       -d basename
              Basename of .pbm file for saving decompressed planes.

       -r basename
              Basename of .jbg file for saving raw planes

       -h     Print hex file offsets.

       -o     Print file offsets.

       -D level
              Set Debug level [0].

EXAMPLES
       Decode an SLX file created by foo2slx.

       $ slxdecode < testpage.zm
       SLX_MAGIC, 0x584c53a5 (SLX)
       SLT_START_DOC, 12 items
               SLI_PAGECOUNT, 4294967295 (0xffffffff)
               SLI_DMDUPLEX, 0 (0x0)
               SLI_DMCOLLATE, 0 (0x0)
               SLI_0x3, 0 (0x0)
               SLI_DISPLAY, 0 (0x0)
               SLI_0x5, 0 (0x0)
               SLI_0x6, 0 (0x0)
               SLI_0x7, 1 (0x1)
               SLI_0x8, 0 (0x0)
               SLI_0x9, 0 (0x0)
               SLI_COUNT, 1 (0x1)
               SLI_DMCOLLATE, 0 (0x0)
       SLT_START_PAGE, 16 items [Page 1]
               SLI_DMPAPER, 6 (0x6)
               SLI_CUSTOM_X, 0 (0x0)
               SLI_CUSTOM_Y, 0 (0x0)
               SLI_DMCOPIES, 1 (0x1)
               SLI_DMDEFAULTSOURCE, 0 (0x0)
               SLI_DMMEDIATYPE, 0 (0x0)
               SLI_NBIE, 0 (0x0)
               SLI_RESOLUTION_X, 600 (0x258)
               SLI_RESOLUTION_Y, 600 (0x258)
               SLI_OFFSET_X, 102 (0x66)
               SLI_OFFSET_Y, 102 (0x66)
               SLI_RASTER_X, 4896 (0x1320)
               SLI_RASTER_Y, 6392 (0x18f8)
               SLI_0x10d, 4896 (0x1320)
               SLI_0x10e, 6392 (0x18f8)
               SLI_0x10f, 1 (0x1)
       SLT_JBIG_BIH, 0 items
               Data: 20 bytes
                       DL = 0, D = 0, P = 1, - = 0, XY = 4896 x 6392
                       L0 = 128, MX = 0, MY = 0
                       Order   = 0
                       Options = 8  TPBON
                       50 stripes, 0 layers, 1 planes
       SLT_JBIG_BID, 0 items
               Data: 116 bytes
       SLT_END_JBIG, 0 items
       SLT_END_PAGE, 0 items
       SLT_END_DOC, 0 items

FILES
       /usr/bin/slxdecode

SEE ALSO
       foo2slx-wrapper(1), foo2slx(1), jbg2pbm(1)

AUTHOR
       Rick Richardson <rick.richardson@comcast.net>
       http://foo2slx.rkkda.com/

