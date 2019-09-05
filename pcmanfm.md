PCManFM(1)                                                         User Manuals                                                         PCManFM(1)

NAME
       PCManFM - A lightweight Gtk+ based file manager for X Window.

SYNOPSIS
       pcmanfm [ options ] [ directories ]

DESCRIPTION
       PCMan  File  Manager (PCManFM) is an extremly fast, lightweight, yet feature-rich file manager with tabbed browsing. It is the default file
       manager for the lightweight desktop environment, LXDE.
       Features:
         * Extremly fast and lightweight
         * Can be started in one second on normal machine
         * Tabbed browsing (similar to Firefox)
         * Drag & Drop handling with XDS (X direct save) support
         * Files can be dragged between tabs
         * Load large directories in reasonable time
         * File association support (with default application setup)
         * Basic thumbnail support with optional EXIF support
         * Bookmarks support
         * Handles non-UTF-8 encoded filenames correctly
         * Provide icon view and detailed list view
         * Standard compliant (follows FreeDesktop.org specifications)
         * Clean and user-friendly interface (GTK+ 2.0)
         * Full desktop management
         * Can set individual wallpapers for each workspace
         * Removable media mounts support
         * Seamless access to remote file systems such as sftp, smb, and ftp
         * Trash can support

OPTIONS
   Global options:
       -d, --daemon-mode   run PCManFM as a daemon (ignored if another PCManFM is already running)

       -p profile, --profile=profile
                           load another configuration profile instead of "default"

       --no-desktop        for Nautilus compatibility

   Per-instance options:
       --desktop           launch desktop manager (ignores -d)

       --desktop-off       turn off desktop manager if it's running

       --desktop-pref      open desktop preference dialog

       --one-screen        manage desktop only on current X screen (only if --desktop is used)

       -n, --new-win       open directories in new window

       --role              set X role for window (only if -n is used)

       --wallpaper-mode=mode
                           Set mode of desktop wallpaper, mode is:
                            color (fill with solid color),
                            stretch (stretch to fill entire monitor),
                            fit (stretch to fit monitor size),
                            center (place on center of monitor),
                            tile (tile to fill entire monitor),
                            crop (stretch and crop to fill monitor), or
                            screen (stretch to fill entire screen)

       -w file, --set-wallpaper=file
                           set desktop wallpaper from image file

       --show-pref n       open preferences dialog on page n

       -f, --find-files    open a file search dialog window

       directories         directories to open

DESKTOP MANAGEMENT
       The PCMan File Manager can manage your desktop. That includes drawing some background on it and showing icons of Desktop folder.  To  acti‐
       vate  the  desktop  management  the pcmanfm should be executed with option --desktop.  Other option that affects this mode is --one-screen.
       Change running desktop manager parameters you can by executing pcmanfm with option --desktop-pref which opens window  with  preferences  or
       using  command line parameters for options --set-wallpaper or --wallpaper-mode.  Execution pcmanfm --desktop-off terminates desktop manage‐
       ment.

       While pcmanfm manages desktop it displays icons on desktop. Behavior of icons resembles folder view in main window of pcmanfm but icons  on
       desktop  can  "remember" their position. If you have two or more monitors then desktop background and set of icons will be shown on each of
       them. Icons positions will be remembered individually for each of monitors.

ENVIRONMENT
       XDG_CURRENT_DESKTOP
              The current desktop environment. This variable affects items which will be shown in menu://applications/ folder.
       XDG_MENU_PREFIX
              The prefix for XDG menu definition XML file. This variable affects layout of items shown in menu://applications/ folder.

FILES
       ~/.config/pcmanfm/default
              The default configuration profile directory
       ~/.config/pcmanfm/default/pcmanfm.conf
              The main configuration file
       ~/.config/pcmanfm/default/desktop-items-0.conf
              The desktop items layout for screen 0 (primary screen)

AUTHOR
       PCManFM is named after its author's nickname on the internet, PCMan. It was written by Hong Jen Yee <pcman.tw@gmail.com>.

       This manual page  was  written  by  Tetralet  <tetralet@debian.or.tw>  for  the  Debian  GNU/Linux  system.  Updated  by  Andriy  Grytsenko
       <andrej@rep.kiev.ua>

pcmanfm 1.2.4                                                      January 2014                                                         PCManFM(1)
