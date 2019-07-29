xcam(1)                                                       General Commands Manual                                                      xcam(1)

NAME
       xcam - a graphical camera frontend for SANE

SYNOPSIS
       xcam [--buffer|-B] [--version|-V] [--help|-h]

DESCRIPTION
       xcam  provides a graphical user-interface to control an image acquisition device such as a flatbed scanner or a camera.  It allows scanning
       individual images and can be invoked directly from the command-line.

       xcam acts as a stand-alone program that saves acquired images in a suitable PNM format (PBM for black-and-white images, PGM  for  grayscale
       images, and PPM for color images).

       xcam  accesses  image  acquisition  devices through the SANE (Scanner Access Now Easy) interface.  The list of available devices depends on
       installed hardware and configuration.

       xcam presents a menu listing of all known and available devices.

OPTIONS
       If the --Buffer (-B) option is given, xcam will use a 1024 kByte input buffer instead of the default 32 kByte.

       If the --version (-V) option is given, xcam will output its version number.

       The --help (-h) flag prints a short summary of options.

       SANE_DEBUG_XCAM
              This environment variable controls the debug level of xcam.  Higher debug levels increase the verbosity of the output.

                            Value  Descsription
                            0      print fatal errors
                            1      print errors
                            2      print warnings
                            3      print information messages
                            4      print everything

                            Example:
                            SANE_DEBUG_XCAM=3

FILES
       $HOME/.sane/xcam/devicename.rc
              For each device, there is one rc-file that holds the saved settings for that particular device.  Normally, this file should  not  be
              manipulated  directly.   Instead,  the user should use the xcam interface to select appropriate values and then save the device set‐
              tings using the "Preferences->Save as default settings" menubar entry.

SEE ALSO
       sane(7), xscanimage(1), scanimage(1), sane-dll(5) and the backend manpages

AUTHOR
       David Mosberger-Tang

       Gerard Klaver (2005 update)

                                                                 19 February 2008                                                          xcam(1)
