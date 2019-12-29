UPDATE-MENUS(1)                         General Commands Manual                        UPDATE-MENUS(1)

NAME
       update-menus - generate Debian menu system

SYNOPSIS
       update-menus  [-v]  [-d] [-h|--help] [--version] [--menufilesdir <dir>] [--menumethod <method>]
       [--nodefaultdirs] [--stdout]

DESCRIPTION
       Before the advent of update-menus, when the system administrators installed a  package  onto  a
       Debian  system,  they would need to edit various window manager configuration files to make the
       new program show up on, for example, fvwm's menus. The menus could easily become  out  of  sync
       with  what  programs  were actually available, with some menu items that didn't work, and other
       programs that lacked a menu entry.  update-menus and Debian's menu package aim  to  solve  this
       problem.

       update-menus  automatically generates menus of installed programs for window managers and other
       menu programs. It should be run whenever a menufile(5) or menu-method file is changed.  update-
       menus  will  be run automatically when Debian packages that contain menu files are installed on
       or removed from the system.

       update-menus uses the package-supplied menu entry files (in /usr/share/menu) for  its  informa‐
       tion  about  the menus (but this can be overruled by the system administrator/user; see below).
       If a menu entry file is executable, update-menus executes the menu entry  file,  and  uses  its
       stdout to generate the menu database.

OPTIONS
       -v     Verbose output. Shows all arguments to the /etc/menu-methods programs.

       -d     Debug output. Generates loads of unintelligible output.

       -h, --help
              Display usage help and exit.

       --menufilesdir <dir>
              Adds directory <dir> to the list of directories to search for menu files in.

       --menumethod <method>
              Process only the menu method <method> instead of all the menu methods found.

       --nodefaultdirs
              Disables the search of menu entries in system menu directories.

       --nodpkgcheck
              Do not discard menu entries for packages that are not installed according to dpkg.

       --remove
              Remove the menus by calling the menu-methods with --remove.

       --stdout
              Output  the  menu  list  in a format suitable as input for install-menu or a menu method
              file.

       --version
              Output version information and exit.

CONFIGURATION
       There are several ways to tune the operation of update-menus:

       per menu entry, in /etc/menu/$package
              In these directories the system administrator or user  can  override  the  default  menu
              files    (If    a    file    /etc/menu/$package    exists,    than   the   corresponding
              /usr/share/menu/$package file isn't read any more). Users who want to override the  sys‐
              tem wide defaults put their files in ~/.menu. See also menufile(5)
       per window-manager in /etc/menu-methods/$wm
              In these configuration files, one can tune generated system.${wm}rc files for each indi‐
              vidual window manager. For example, one can specify that the wm should ignore any  icons
              that  the  packages  may  supply,  or set the default wrapper for text-only applications
              (usually, an xterm is started to run a text-only application like vi). Users who want to
              override the system wide defaults put their files in ~/.menu-methods. For more info, see
              /usr/share/doc/menu/html.
       globally, in /etc/menu-methods/translate_menus
              This file contains translations that will be performed for all menu entries and all win‐
              dow  managers. You can specify things like: `All sections that start with "Games" should
              be mapped to "Applications/Games"', or `menuentry  "gnuplot"  should  have  a  title  of
              "GnuTeken"'. Look at the default /etc/menu-methods/translate_menus for an example. Users
              who want to override the  system  default  translate  file,  put  one  in  ~/.menu-meth‐
              ods/translate_menus.   Note: This should not be used for a full translation of the menu.
              Use po files as explained in the source package.
       error report configuring, in /etc/menu-methods/menu.config
              This file contains general information for the overall behaviour of update-menus. At the
              moment  you  can  only configure how verbose the output of update-menus is, and where it
              sends the output. The  amount  of  information  is  specified  by  `verbosity=VAL'.  Use
              VAL=quiet  to  stop  update-menu  from reporting anything but the most important errors,
              VAL=normal, VAL=verbose, VAL=debug for progressively more output.

              To specify  where  the  output  should  go,  use  `method=stdout',  `method=stderr',  or
              `method=syslog  facility priority'. `Facility' is one of auth, authpriv, authcron, auth‐
              daemon, authkern, authlocal0, authlocal1, authlocal2,  authlocal3,  authlocal4,  authlo‐
              cal5,  authlocal6, authlocal7, authlpr, authmail, authnews, authsyslog, authuser, authu‐
              ucp. `priority' is one of emerg, alert, crit, err, warning, notice, info, debug.

FILES
       Menu files: (Earlier listed directories override those listed later.)
              ~/.menu/*
                     Menu files added by the user. (Isn't read if root runs update-menus)
              /etc/menu/*
                     Menu files added by the system administrator.
              /usr/lib/menu/*
                     Architecture-dependant menu files provided by other Debian packages.
              /usr/share/menu/*
                     Architecture-independant menu files provided by other Debian packages.
              /usr/share/menu/default/*
                     Menu files provided by the menu package.
       Menu methods:
              /etc/menu-methods/
                     Executable configuration files that are added by window managers and  other  menu
                     programs, these files are run by update-menus to generate menus for the different
                     programs. Also in this directory is the translate_menus file, used for local con‐
                     figuration of the shape of the menu trees.
              ~/.menu-methods/
                     For  users  to override the system-defaults of /etc/menu-methods.  If this direc‐
                     tory exists, no files in /etc/menu-methods are read any more.

DISTRIBUTION
       Distribution is subject to the GNU General Public License.

BUGS
       update-menus may not work properly when run by a normal user, to generate menus for that  user.
       This  is  usually because the window manager doesn't expect the system.${wm}rc files in the di‐
       rectory (usually ~/.${wm}, configurable in /etc/menu-methods). If you see such a thing, and you
       find  a solution, please mail <menu@packages.debian.org>. It should work OK for fvwm and fvwm2:
       I usually test the package first as an ordinary user.

AUTHORS
       Joost Witteveen <joostje@debian.org>, original idea by Lars Wirzenius <liw@iki.fi>.  Now  main‐
       tained by Bill Allombert <ballombe@debian.org>.

THANKS
       To  Joey  Hess,  for a lot of good ideas and pre-release testing, and to Tom Lees for a update-
       menus in pure C (of which I only used one function, but that's life).

       Man page by Joey Hess, <joeyh@debian.org>

SEE ALSO
       menufile(5), /usr/share/doc/menu/html

DEBIAN                                     Debian Utilities                            UPDATE-MENUS(1)
