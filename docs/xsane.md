xsane(1)                                                      General Commands Manual                                                     xsane(1)

NAME
       xsane - scanner frontend for SANE

SYNOPSIS
       xsane  [--version|-v]  [--license|-l] [--device-settings file |-d file] [--viewer|-V] [--save|-s] [--copy|-c] [--fax|-f] [--mail|-m] [--no-
       mode-selection|-n] [--Fixed|-F] [--Resizable|-R] [--print-filenames|-p] [--force-filename name |-N name] [--display  d]  [--sync]  [device‐
       name]

DESCRIPTION
       xsane provides a graphical user-interface to control an image acquisition device such as a flatbed scanner.  It allows previewing and scan‐
       ning individual images and can be invoked either directly from the command-line or through The GIMP image  manipulation  program.   In  the
       former  case,  xsane acts as a stand-alone program that saves acquired images in a suitable PNM format (PBM for black-and-white images, PGM
       for grayscale images, and PPM for color images) or converts the image to JPEG, PNG, PS or  TIFF.   In  the  latter  case,  the  images  are
       directly passed to The GIMP for further processing.

       xsane  accesses  image  acquisition devices through the SANE (Scanner Access Now Easy) interface.  The list of available devices depends on
       installed hardware and configuration.  When invoked without an explicit devicename argument, xsane presents a dialog listing all known  and
       available  devices.  To access an available device that is not known to the system, the devicename must be specified explicitly. The format
       of devicename is backendname:devicefile (eg: umax:/dev/sga).

RUNNING UNDER THE GIMP
       To run xsane under the gimp(1), you should at first make sure that xsane is compiled with gimp support by entering "xsane -v" on  a  shell.
       If  xsane  is  compiled with gimp support then simply set a symbolic link from the xsane-binary to one of the gimp(1) plug-ins directories.
       For example, for gimp-1.0.x the command

              ln -s /usr/bin/xsane ~/.gimp/plug-ins/

       for gimp 1.2.x the command:

              ln -s /usr/bin/xsane ~/.gimp-1.2/plug-ins/

       and for gimp 2.0.x the command:

              ln -s /usr/bin/xsane ~/.gimp-2.0/plug-ins/

       adds a symlink for the xsane binary to the user's plug-ins directory.  After creating this symlink, xsane will be queried  by  gimp(1)  the
       next  time  it's  invoked.   From  then  on,  xsane  can  be  invoked  through  "Xtns->XSane->Device  dialog..."  (gimp-1.0.x)  or  through
       "File->Acquire->XSane->Device dialog..." (gimp-1.2.x and 2.0.x) menu entry.

       You'll also find that the "Xtns->XSane" or "File->Acquire->XSane" menu contains short-cuts to the SANE devices that were available  at  the
       time  the  xsane  was  queried.   Note  that gimp(1) caches these short-cuts in ~/.gimp/pluginrc.  Thus, when the list of available devices
       changes (e.g., a new scanner is installed or the device of the scanner has changed), then it is typically desirable to rebuild this  cache.
       To  do  this,  you  can either touch(1) the xsane binary (e.g., "touch /usr/bin/xsane") or delete the plugin cache (e.g., "rm ~/.gimp/plug‐
       inrc").  Either way, invoking gimp(1) afterwards will cause the pluginrc to be rebuilt.

       When xsane is started from the gimp then it is not possible to add a devicename explicitly. You have to make the devices known to the  sys‐
       tem by configuring sane-dll, sane-net and saned.

OPTIONS
       If  the  --version  or  -v  flag  is  given xsane prints a version information, some information about gtk+ and gimp version it is compiled
       against and lists the supported file formats, then it exits.

       when the --license or -l flag is given xsane prints license information and exits.

       The --device-settings or -d flag reads the next option as default filename for device settings. The extension ".drc" must not be included.

       The --viewer or -V flag forces xsane to start in viewer mode.

       The --save or -s flag forces xsane to start in save mode.

       The --copy or -c flag forces xsane to start in copy mode.

       The --fax or -f flag forces xsane to start in fax mode.

       The --mail or -m flag forces xsane to start in mail mode.

       The --no-mode-selection or -n flag disables the menu for xsane mode selection (viewer, save, copy, fax, mail).

       If the --Fixed or -F flag is given then xsane uses a fixed, non resizable main window.  The flag overwrites the preferences value.

       If the --Resizable or -R flag is given then xsane uses a scrolled and resizable main window.  The flag overwrites the preferences value.

       If --print-filenames or -p flag is given then xsane prints the names of created files to the standard output.

       When the flag --force-filename or -N is given then xsane reads the next option as default image filename. The name should be of the  format
       "name-001.ext".  (or  any  other  number instead of 001) that 001 part will be used as a filename counter if xsane is so configured. Beware
       that the number of digits must correspond to the configuration of xsane. The selection box for filenames is disabled. This option  normally
       should be used with the option --no-mode-selection and --save.

       The --display flag selects the X11 display used to present the graphical user-interface (see X(1) for details).

       The --sync flag requests a synchronous connection with the X11 server.  This is for debugging purposes only.

ENVIRONMENT
       SANE_DEFAULT_DEVICE
              is used to preselect the device in the device dialog. This way you only have to accept the device (<ENTER> or OK-Button).

FILES
       $HOME/.sane/xsane/xsane.rc
              This  files holds the user preferences.  Normally, this file should not be manipulated directly.  Instead, the user should customize
              the program through the "Preferences" menu.

       $HOME/.sane/xsane/devicename.rc
              For each device, there is one rc-file that holds the saved settings for that particular device.  Normally, this file should  not  be
              manipulated  directly.   Instead, the user should use the xsane interface to select appropriate values and then save the device set‐
              tings using the "Preferences->Save Device Settings" menubar entry.

       /usr/share/sane/xsane/xsane-style.rc
              This system-wide file controls the aspects of the user-interface such as colors and fonts.  It is a GTK style file and provides fine
              control over the visual aspects of the user-interface.

       $HOME/.sane/xsane/xsane-style.rc
              This file serves the same purpose as the system-wide style file.  If present, it takes precedence over the system wide style file.

SEE ALSO
       gimp(1), xscanimage(1), scanimage(1), sane-dll(5), sane-net(5), saned(1), sane-scsi(5), sane-usb(5), sane-"backendname"(5)

AUTHOR
       Oliver Rauch <Oliver.Rauch@rauch-domain.de>

                                                                    15 Jun 2002                                                           xsane(1)
