xscanimage(1)                                                 General Commands Manual                                                xscanimage(1)

NAME
       xscanimage - scan an image

SYNOPSIS
       xscanimage [--version|-V] [--help|-h] [--display d] [--no-xshm] [--sync] [devicename]

DESCRIPTION
       xscanimage  provides  a  graphical  user-interface to control an image acquisition device such as a flatbed scanner or a camera.  It allows
       previewing and scanning invidual images and can be invoked either directly from the command-line or through  The  GIMP  image  manipulation
       program.   In the former case, xscanimage acts as a stand-alone program that saves acquired images in a suitable PNM format (PBM for black-
       and-white images, PGM for grayscale images, and PPM for color images).  In the latter case, the images are directly passed to The GIMP  for
       further processing.

       xscanimage  accesses image acquisition devices through the SANE (Scanner Access Now Easy) interface.  The list of available devices depends
       on installed hardware and configuration.  When invoked without an explicit devicename argument, xscanimage presents a dialog listing of all
       known  and  available  devices.  If the environment variable SANE_DEFAULT_DEVICE is set to the devicename, the device is preselected in the
       dialog. To access an available device that is not known to the system, the devicename must be specified explicitly. The format  of  device‐
       name is backendname:devicefile (e.g. umax:/dev/sga).

RUNNING UNDER THE GIMP
       To  run  xscanimage  under the gimp(1), simply copy it to one of the gimp(1) plug-ins directories.  If you want to conserve disk-space, you
       can create a symlink instead.  For example, for gimp-1.0.x the command

       ln -s @BINDIR@/xscanimage ~/.gimp/plug-ins/

       and for gimp-1.2.x the command

       ln -s @BINDIR@/xscanimage ~/.gimp-1.2/plug-ins/

       adds a symlink for the xscanimage binary to the user's plug-ins directory.  After creating this symlink,  xscanimage  will  be  queried  by
       gimp(1)  the  next  time  it's invoked.  From then on, xscanimage can be invoked through "File->Acquire->Xscanimage->Device dialog..." menu
       entry.

       You'll also find that the "File->Acquire->Xscanimage" menu contains short-cuts to the SANE devices that were available at the time xscanim‐
       age  was  queried.   For  example,  the first PNM pseudo-device is typically available as the short-cut "File->Acquire->Xscanimage->pnm:0".
       Note that gimp(1) caches these short-cuts in ~/.gimp/pluginrc.  Thus, when the list of available devices changes (e.g., a  new  scanner  is
       installed),  then it is typically desirable to rebuild this cache.  To do this, you can either touch(1) the xscanimage binary (e.g., "touch
       @BINDIR@/xscanimage") or delete the plug-ins cache (e.g., "rm ~/.gimp/plug-ins").  Either way, invoking gimp(1) afterwards will  cause  the
       pluginrc to be rebuilt.

OPTIONS
       If the --version (-V) option is given, xscanimage will output its version number.

       The --help (-h) flag prints a short summary of options.

       The --display flag selects the X11 display used to present the graphical user-interface (see X(1) for details).

       The --no-xshm flag requests not to use shared memory images.  Shared memory images usually enhance performance but cause problems with some
       buggy X11 servers.  Unless your X11 server dies when running this program, there is no need or advantage to specify this flag.

       The --sync flag requests a synchronous connection with the X11 server.  This is for debugging purposes only.

ENVIRONMENT
       SANE_DEFAULT_DEVICE
              The default device-name. Example: SANE_DEFAULT_DEVICE="hp:/dev/scanner".

       SANE_DEBUG_XSCANIMAGE
              This environment variable controls the debug level xscanimage.  Higher debug levels increase the verbosity of the output.

                            Value  Descsription
                            0      print fatal errors
                            1      print errors
                            2      print warnings
                            3      print information messages
                            4      print everything

                            Example:
                            SANE_DEBUG_XSCANIMAGE=3

FILES
       $HOME/.sane/xscanimage/xscanimage.rc
              This files holds the user preferences.  Normally, this file should not be manipulated directly.  Instead, the user should  customize
              the program through the "Preferences" dialog.

       $HOME/.sane/xscanimage/devicename.rc
              For  each  device, there is one rc-file that holds the saved settings for that particular device.  Normally, this file should not be
              manipulated directly.  Instead, the user should use the xscanimage interface to select appropriate values and then save  the  device
              settings using the "Preferences->Save Device Settings" menubar entry.

       $HOME/.sane/preview-devicename.ppm
              After acquiring a preview, xscanimage normally saves the preview image in this device-specific file.  Thus, next time the program is
              started up, the program can present the old preview image.  This  feature  can  be  turned  off  through  the  "Preferences->Preview
              Options..." dialog.

       @DATADIR@/sane-style.rc
              This system-wide file controls the aspects of the user-interface such as colors and fonts.  It is a GTK style file and provides fine
              control over the visual aspects of the user-interface.

       $HOME/.sane/sane-style.rc
              This file serves the same purpose as the system-wide style file.  If present, it takes precedence over the system wide style file.

SEE ALSO
       sane(7), gimp(1), xcam(1), scanimage(1), scanadf(1), sane-scsi(5), sane-dll(5), sane-net(5), sane-"backendname"(5)

AUTHOR
       Tristan Tarrant, Andreas Beck, David Mosberger, and Henning Meier-Geinitz

                                                                    1 Feb 2003                                                       xscanimage(1)
