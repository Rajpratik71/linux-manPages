opldecode(1)                                                  General Commands Manual                                                 opldecode(1)

NAME
       opldecode - Decode a Raster Object (opl) stream into human readable form.

SYNOPSIS
       opldecode [options] <zjs-file

DESCRIPTION
       opldecode decodes a Raster Object (opl) stream into human readable form.

       A Raster Object stream is the printer language used by some Konica Minolta printers, such as the KM magicolor 2480 MF.

COMMAND LINE OPTIONS
       These are the options that can appear on the command line.

       -d basename
              Basename of .pbm file for saving decompressed planes.

       -h     Print hex file offsets.

       -o     Print file offsets.

       -D level
              Set Debug level [0].

EXAMPLES
       Decode an Raster Object stream file created by foo2lava-wrapper -z1.

       $ foo2lava-wrapper -z1 testpage.ps | opldecode -h
            0:   Event=StartOfJob;
           11:   OSVersion=WindowsXP;
           25:   DrvVersion=2.0.1410.0;
           3b:   Resolution=1200x600;
           4f:   RasterObject.Compression=JBIG;
           6d:   Sides=OneSided;
           7c:   MediaSize=custom_size_8.5x11in;
           9b:   MediaType=plain;
           ab:   MediaInputTrayCheck=top;
           c3:   RasterObject.BitsPerPixel=1;
           df:   RasterObject.Planes=00FFFF,0,0,0,0,0,0;
          106:   RasterObject.Width=9792;
          11e:   RasterObject.Height=6400;
          137:   RasterObject.Data#20=

                           DL = 0, D = 0, P = 1, - = 0, XY = 9792 x 6400
                           L0 = 128, MX = 0, MY = 0
                           Order   = 3  ILEAVE SMID
                           Options = 92  LRLTWO TPDON TPBON DPON
                           50 stripes, 0 layers, 1 planes
          161:   RasterObject.Data#32768=
         817a:   RasterObject.Data#32768=
        10193:   RasterObject.Data#3168=
        10e0b:   RasterObject.Planes=FF00FF,0,0,0,0,0,0;
        10e32:   RasterObject.Width=9792;
        10e4a:   RasterObject.Height=6400;
        10e63:   RasterObject.Data#20=

                           DL = 0, D = 0, P = 1, - = 0, XY = 9792 x 6400
                           L0 = 128, MX = 0, MY = 0
                           Order   = 3  ILEAVE SMID
                           Options = 92  LRLTWO TPDON TPBON DPON
                           50 stripes, 0 layers, 1 planes
        10e8d:   RasterObject.Data#32768=
        18ea6:   RasterObject.Data#32768=
        20ebf:   RasterObject.Data#19200=
        259d8:   RasterObject.Planes=FFFF00,0,0,0,0,0,0;
        259ff:   RasterObject.Width=9792;
        25a17:   RasterObject.Height=6400;
        25a30:   RasterObject.Data#20=

                           DL = 0, D = 0, P = 1, - = 0, XY = 9792 x 6400
                           L0 = 128, MX = 0, MY = 0
                           Order   = 3  ILEAVE SMID
                           Options = 92  LRLTWO TPDON TPBON DPON
                           50 stripes, 0 layers, 1 planes
        25a5a:   RasterObject.Data#32768=
        2da73:   RasterObject.Data#32768=
        35a8c:   RasterObject.Data#32768=
        3daa5:   RasterObject.Data#7056=
        3f64d:   RasterObject.Planes=000000,0,0,0,0,0,0;
        3f674:   RasterObject.Width=9792;
        3f68c:   RasterObject.Height=6400;
        3f6a5:   RasterObject.Data#20=

                           DL = 0, D = 0, P = 1, - = 0, XY = 9792 x 6400
                           L0 = 128, MX = 0, MY = 0
                           Order   = 3  ILEAVE SMID
                           Options = 92  LRLTWO TPDON TPBON DPON
                           50 stripes, 0 layers, 1 planes
        3f6cf:   RasterObject.Data#32768=
        476e8:   RasterObject.Data#17472=
        4bb41:   Event=EndOfPage;
        4bb51:   Event=EndOfJob;

FILES
       /usr/bin/opldecode

SEE ALSO
       foo2lava-wrapper(1), foo2opl(1)

AUTHOR
       Rick Richardson <rick.richardson@comcast.net>
       http://foo2lava.rkkda.com/

