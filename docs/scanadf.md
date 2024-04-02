scanadf(1)                                                    General Commands Manual                                                   scanadf(1)

NAME
       scanadf - acquire multiple images from a scanner equipped with an ADF

SYNOPSIS
       scanadf  [-d|--device-name  dev]  [-h|--help] [-L|--list-devices] [-v|--verbose] [-V|--version] [-o|--output-file name] [-N|--no-overwrite]
       [-S|--scan-script name] [--script-wait] [-s|--start-count num] [-e|--end-count num] [-r|--raw] [device-specific-options]

DESCRIPTION
       scanadf is a command-line interface to control image acquisition devices which are capable of returning a series of images (e.g. a  scanner
       with  an automatic document feeder (ADF)).  The device is controlled via command-line options.  After command-line processing, scanadf nor‐
       mally proceeds to acquire a series of images until the device returns the SANE_STATUS_NO_DOCS status code.

       The images are written to output files, specified by the --output-file option.  These files are typically written in one of the PNM (porta‐
       ble  aNyMaP)  formats (PBM for black-and-white images, PGM for grayscale images, and PPM for color images).  Several optional frame formats
       (SANE_FRAME_JPEG, SANE_FRAME_G31D, SANE_FRAME_G32D, SANE_FRAME_G42D, and SANE_FRAME_TEXT) are supported.  In each case, the data is written
       out  to  the  output  file  as-is  without a header.  Unrecognized frame formats are handled in the same way, although a warning message is
       printed in verbose mode.

       Typically, the optional frame formats are used in conjunction with a scan script (specified by the --scanscript option)  which  is  invoked
       for  each  acquired  image.   The script is provided with a series of environment variables which describe the parameters and format of the
       image file.

       scanadf accesses image acquisition devices through the SANE (Scanner Access Now Easy) interface and can thus support any device  for  which
       there exists a SANE backend (try "apropos sane-" to get a list of available backends).

OPTIONS
       The  -d  or  --device-name  options must be followed by a SANE device-name.  A (partial) list of available devices can be obtained with the
       --list-devices option (see below).  If no device-name is specified explicitly, scanadf will attempt to open the first available device.

       The -h or --help options request help information.  The information is printed on standard output and in this case, no attempt will be made
       to acquire an image.

       The  -L  or --list-devices option requests a (partial) list of devices that are available.  The list is not complete since some devices may
       be available, but are not listed in any of the configuration files (which are typically stored in directory @CONFIGDIR@).  This is particu‐
       larly  the  case when accessing scanners through the network.  If a device is not listed in a configuration file, the only way to access it
       is by its full device name.  You may need to consult your system administrator to find out the names of such devices.

       The -v or --verbose options increase the verbosity of the operation of scanadf.  The option may be specified repeatedly, each time increas‐
       ing the verbosity level.

       The -V or --version option requests that scanadf print the program and package name, as well as the version number of the SANE distribution
       that it came with.

       The -o or --output-file option specifies a format string used to generate the name of file to write the image data  to.   You  can  use  %d
       replacement in the output file name; this will be replaced with the current page number.  The default format string is image-%04d.

       The -N or --no-overwrite option prevents scanadf from overwriting existing image files.

       The  -S  or --scan-script option specifies the name of script to run after each scanned image is acquired.  The script receives the name of
       the image output file as its first and only command line argument.  Additionally the scan script can reference  the  following  environment
       variables to get information about the parameters of the image.

              SCAN_RES - the image resolution (in DPI)
              SCAN_WIDTH - the image width (in pixels)
              SCAN_HEIGHT - the image height (in pixels)
              SCAN_DEPTH - the image bit-depth (in bits)
              SCAN_FORMAT - a string representing the image format (e.g. gray, g42d, text, etc)
              SCAN_FORMAT_ID - the numeric image format identifier

       If  the  --script-wait  option is given, scanadf will wait until all scan-scripts have been finished before exiting. That will be useful if
       scanadf is used in conjunction with tools to modify the scanned images.

       The -s or --start-count option specifies the page number of first scanned image.

       The -e or --end-count option specifies the last page number to scan.  Using this option, you can request a specific number of pages  to  be
       scanned, rather than scanning until there are no more images available.

       The  -r  or  --raw  option specifies that the raw image data be written to the output file as-is without interpretation.  This disables the
       writing of the PNM header for basic frame types.  This feature is usually used in conjunction with the --scan-script option where the  scan
       script  uses  the environment variables to understand the format and parameters of the image and converts the file to a more useful format.
       NOTE: With support for the optional frame types and the default handling of unrecognized frametypes, this option becomes less and less use‐
       ful.

       As  you  might imagine, much of the power of scanadf comes from the fact that it can control any SANE backend.  Thus, the exact set of com‐
       mand-line options depends on the capabilities of the selected device.  To see the options for a device named dev, invoke scanadf via a com‐
       mand-line of the form:

              scanadf --help --device dev

       The documentation for the device-specific options printed by --help is explained in the manual page for scanimage.

FILES
       @CONFIGDIR@
              This directory holds various configuration files.  For details, please refer to the manual pages listed below.

SEE ALSO
       scanimage(1), xscanimage(1), sane(7)

AUTHOR
       scanadf is an adaptation by Tom Martone of scanimage by David Mosberger, Andreas Beck, and Gordon Matzigkeit following closely the features
       of bnhscan by Sean Reifschneider of tummy.com, ltd.

BUGS
       Please send reports to sane-devel@lists.alioth.debian.org.

       This program relies on the backend to return the SANE_STATUS_NO_DOCS status code when the automatic document feeder is out of  paper.   Use
       of  this  program with backends that do not support ADFs (e.g. flatbed scanners) will likely result in repeated scans of the same document.
       In this case, it is essential to use the start-count and end-count to control the number of images acquired.

       Only a subset of the SANE backends support feeders and return SANE_STATUS_NO_DOCS appropriately.  Backends which are known to work at  this
       time are:

              sane-bh - Bell+Howell Copiscan II series scanners.
              sane-hp - Hewlett Packard scanners.  A patch to the sane-hp backend is necessary.  The --scantype=ADF option must be specified (ear‐
              lier versions of the backend used the --scan-from-adf option, instead).
              sane-umax - UMAX scanners.  Support exists in build 12 and later.  The --source="Automatic Document Feeder" option  must  be  speci‐
              fied.

                                                                    30 Oct 2004                                                         scanadf(1)
