GIMP(1)                                   GIMP Manual Pages                                   GIMP(1)

NAME
       gimp - an image manipulation and paint program.

SYNOPSIS
       gimp  [-h]  [--help]  [--help-all]  [--help-gtk] [-v] [--version] [--license] [--verbose] [-n]
       [--new-instance] [-a] [--as-new] [-i] [--no-interface] [-d] [--no-data] [-f] [--no-fonts] [-s]
       [--no-splash]  [--no-shm] [--no-cpu-accel] [--display display] [--session <name>] [-g] [--gim‐
       prc <gimprc>] [--system-gimprc <gimprc>]  [--dump-gimprc]  [--console-messages]  [--debug-han‐
       dlers]  [--stack-trace-mode  <mode>]  [--pdb-compat-mode  <mode>] [--batch-interpreter <proce‐
       dure>] [-b] [--batch <command>] [filename] ...

DESCRIPTION
       GIMP is the GNU Image Manipulation Program. It is used to edit and manipulate images.  It  can
       load and save a variety of image formats and can be used to convert between formats.

       GIMP can also be used as a paint program. It features a set of drawing and painting tools such
       as airbrush, clone, pencil, and paint brush. Painting and drawing tools can be applied  to  an
       image  with  a  variety  of paint modes.  It also offers an extensive array of selection tools
       like rectangle, ellipse, fuzzy select, bezier select,  intelligent  scissors,  and  select  by
       color.

       GIMP  offers  a  variety  of plug-ins that perform a variety of image manipulations.  Examples
       include bumpmap, edge detect, gaussian blur, and many others. In addition,  GIMP  has  several
       scripting  extension  which  allow  for  advanced  non-interactive  processing and creation of
       images.

       GIMP ships with a second binary called gimp-console. This binary is a console-only version and
       behaves as if gimp was called with the --no-interface command-line option.

       On  platforms  with the D-Bus message bus system, GIMP will by default check if an instance is
       already running in this user session. If it detects that, it will pass all filenames given  on
       the command-line to the already running GIMP instance and quit.

OPTIONS
       GIMP accepts the following options:

       -h, --help
               Show GIMP command-line options.

       --help-all
               Show all command-line options.

       --help-gtk
               Show GTK+ command-line options.

       --help-gegl
               Show GEGL command-line options.

       -v, --version
               Output  version information and exit. When combined with the --verbose option, version
               information about libraries used by GIMP is shown as well.

       --license
               Output license information and exit.

       --verbose
               Be verbose and create information on standard output.

       -n, --new-instance
               Do not attempt to reuse an already running GIMP instance. Always start a new one.

       -a, --as-new
               Open filenames passed on the command-line as new images, don't  set  the  filename  on
               them.

       -i, --no-interface
               Run without a user interface.

       -d, --no-data
               Do not load patterns, gradients, palettes, or brushes. Often useful in non-interactive
               situations where startup time is to be minimized.

       -f, --no-fonts
               Do not load any fonts. No text functionality will be available if this option is used.

       --display display
               Use the designated X display.

       -s, --no-splash
               Do not show the splash screen.

       --no-shm
               Do not use shared memory between GIMP and its plug-ins.  Instead of using shared  mem‐
               ory,  GIMP  will  send  the data via pipe. This will result in slower performance than
               using shared memory.

       --no-cpu-accel
               Do not use CPU accelerations such as MMX or SSE even if GIMP  detects  that  your  CPU
               provides this functionality.

       --session <name>
               Use a different sessionrc for this GIMP session. The given session name is appended to
               the default sessionrc filename.

       -g, --gimprc <gimprc>
               Use an alternative gimprc instead of the default one. Useful in  cases  where  plug-in
               paths or machine specs may be different.

       --system-gimprc <gimprc>
               Use an alternate system gimprc file.

       --dump-gimprc
               Output a gimprc file with default settings.

       --debug-handlers
               Enable debugging signal handlers.

       -c, --console-messages
               Do  not  popup  dialog  boxes on errors or warnings. Print the messages on the console
               instead.

       --stack-trace-mode {never|query|always}
               If a stack-trace should be generated in case of fatal signals.

       --pdb-compat-mode {off|on|warn}
               If the PDB should provide aliases for deprecated functions.

       --batch-interpreter <procedure>
               Specifies the procedure to use to process batch events. The default is to let  Script-
               Fu evaluate the commands.

       -b, --batch <command>
               Execute <command> non-interactively. This option may appear multiple times.  The <com‐
               mand> is passed to the batch interpreter. When <command> is - the  commands  are  read
               from standard input.

ENVIRONMENT
       GIMP respects a number of environment variables.

       DISPLAY to get the default host and display number.

       GIMP2_DIRECTORY
               to  get  the name of the personal GIMP directory. If unset .gimp-2.8 is used.  If this
               is an absolute path, it is used as is.  If it is a relative path, it is taken to be  a
               subdirectory of the home directory.

       GIMP2_DATADIR
               to  get  the  base  location  for  data  files such as brushes and patterns.  If unset
               ${datarootdir}/gimp/2.0 is used.

       GIMP2_LOCALEDIR
               to get the base location for translations. If unset ${datarootdir}/locale is used.

       GIMP2_PLUGINDIR
               to get the base location for plug-ins and modules. If unset /usr/lib/gimp/2.0 is used.

       GIMP2_SYSCONFDIR
               to get the location of configuration files. If unset /etc/gimp/2.0 is used.

               On Linux GIMP can be compiled with support for binary relocatibility.  This will cause
               data,  plug-ins and configuration files to be searched relative to the location of the
               gimp executable file unless overridden by the environment variables mentioned above.

FILES
       GIMP's data files are stored  in  ${datarootdir}/gimp/2.0,  where  ${datarootdir}  is  set  on
       install,  but  is  typically  /usr/share. GIMP's system-wide configuration files are stored in
       /etc/gimp/2.0, where ${prefix} is typically /usr.

       Most GIMP configuration is read in from the user's init file, $HOME/.gimp-2.8/gimprc. The sys‐
       tem  wide  equivalent is in /etc/gimp/2.0/gimprc. The system wide file is parsed first and the
       user gimprc can override the system settings.  /etc/gimp/2.0/gimprc_user is the default gimprc
       placed in users' home directories the first time GIMP is run.

       $HOME/.gimp-2.8/devicerc  -  holds  settings for input devices together with the tool, colors,
       brush, pattern and gradient associated to that device.

       $HOME/.gimp-2.8/gtkrc - users set of GIMP-specific GTK+ config settings. Options such as  wid‐
       get color and fonts sizes can be set here.

       /etc/gimp/2.0/gtkrc - system wide default set of GIMP-specific GTK+ config settings.

       $HOME/.gimp-2.8/menurc - user's set of keybindings.

       $HOME/.gimp-2.8/parasiterc - Stores all persistent GIMP parasites. This file will be rewritten
       every time you quit GIMP.

       $HOME/.gimp-2.8/sessionrc - This file takes session-specific info (that is info, you  want  to
       keep  between  two GIMP sessions). You are not supposed to edit it manually, but of course you
       can do. This file will be entirely rewritten every time you quit  GIMP.  If  this  file  isn't
       found, defaults are used.

       $HOME/.gimp-2.8/templaterc  -  Image  templates  are  kept in this file. New images can conve‐
       niently created from these templates. If this file isn't found, defaults are used.

       /etc/gimp/2.0/unitrc - default user unit database. It contains the unit definitions  for  cen‐
       timeters, meters, feet, yards, typographic points and typographic picas and is placed in users
       home directories the first time GIMP is ran. If this file isn't found, defaults are used.

       $HOME/.gimp-2.8/unitrc - This file contains your user unit database. You can modify this  list
       with  the  unit  editor.  You  are not supposed to edit it manually, but of course you can do.
       This file will be entirely rewritten every time you quit GIMP.

       $HOME/.gimp-2.8/plug-ins - location of user installed plug-ins.

       $HOME/.gimp-2.8/pluginrc - plug-in initialization values are stored here. This file is  parsed
       on startup and regenerated if need be.

       $HOME/.gimp-2.8/modules - location of user installed modules.

       $HOME/.gimp-2.8/tmp - default location that GIMP uses as temporary space.

       ${datarootdir}/gimp/2.0/brushes - system wide brush files.

       $HOME/.gimp-2.8/brushes - user created and installed brush files. These files are in the .gbr,
       .gih or .vbr file formats.

       $HOME/.gimp-2.8/curves - Curve profiles and presets as saved from the Curves tool.

       $HOME/.gimp-2.8/gimpressionist - Presets and user created brushes and papers are stored here.

       $HOME/.gimp-2.8/levels - Level profiles and presets as saved from the Levels tool.

       ${datarootdir}/gimp/2.0/palettes - the system wide palette files.

       $HOME/.gimp-2.8/palettes - user created and modified palette files. This files are in the .gpl
       format.

       ${datarootdir}/gimp/2.0/patterns - basic set of patterns for use in GIMP.

       $HOME/.gimp-2.8/patterns  -  user  created and installed gimp pattern files. This files are in
       the .pat format.

       ${datarootdir}/gimp/2.0/gradients - standard system wide set of gradient files.

       $HOME/.gimp-2.8/gradients - user created and installed gradient files.

       ${datarootdir}/gimp/2.0/scripts - system wide directory of scripts used in Script-Fu and other
       scripting extensions.

       $HOME/.gimp-2.8/scripts - user created and installed scripts.

       ${datarootdir}/gimp/2.0/gflares - system wide directory used by the gflare plug-in.

       $HOME/.gimp-2.8/gflares - user created and installed gflare files.

       ${datarootdir}/gimp/2.0/gfig - system wide directory used by the gfig plug-in.

       $HOME/.gimp-2.8/gfig - user created and installed gfig files.

       ${datarootdir}/gimp/2.0/images/gimp-splash.png  -  the  default image used for the GIMP splash
       screen.

       ${datarootdir}/gimp/2.0/images/gimp-logo.png - image used in the GIMP about dialog.

       ${datarootdir}/gimp/2.0/tips/gimp-tips.xml - tips as displayed in the "Tip of the Day"  dialog
       box.

SPLASH IMAGES
       GIMP  comes with a default image for the splash screen but it allows system administrators and
       users to customize the splash screen by providing other images. The image to be used with  the
       splash screen is chosen as follows:

       1.     GIMP tries to load a random splash screen from the directory $HOME/.gimp-2.8/splashes.

       2.     It then falls back to using $HOME/.gimp-2.8/gimp-splash.png.

       3.     If  the  user  didn't  install  any custom splash images, a random image is picked from
              ${datarootdir}/gimp/2.0/splashes.

       4.     As  a  last  resort,  GIMP  uses  the  default  splash  image  located  at  ${dataroot‐
              dir}/gimp/2.0/images/gimp-splash.png.

SUGGESTIONS AND BUG REPORTS
       Any  bugs  found  should be reported to the online bug-tracking system available on the web at
       http://bugzilla.gnome.org/. Before reporting bugs, please check to see if the bug has  already
       been reported.

       When reporting GIMP bugs, it is important to include a reliable way to reproduce the bug, ver‐
       sion number of GIMP (and probably GTK+), OS name and version, and any relevant hardware specs.
       If  a  bug  is  causing  a  crash,  it is very useful if a stack trace can be provided. And of
       course, patches to rectify the bug are even better.

OTHER INFO
       The canonical place to find GIMP info is at http://www.gimp.org/.  Here you can find links  to
       just about many other GIMP sites, tutorials, data sets, mailing list archives, and more.

       There  is  also a GIMP User Manual available at http://docs.gimp.org/ that goes into much more
       detail about the interactive use of GIMP.

       The latest versions of GIMP and the GTK+ libs are always available at ftp://ftp.gimp.org/.

AUTHORS
       Spencer Kimball, Peter Mattis and the GIMP Development Team.

       With patches, fixes, plug-ins, extensions, scripts, translations, documentation and more  from
       lots and lots of people all over the world.

SEE ALSO
       gimprc(5), gimptool(1),

Version 2.8.22                              March 23 2008                                     GIMP(1)
