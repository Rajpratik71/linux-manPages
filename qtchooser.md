QTCHOOSER(1)                                                                             General Commands Manual                                                                             QTCHOOSER(1)

NAME
       qtchooser - a wrapper used to select between Qt development binary versions

SYNOPSIS
       qtchooser -list-versions
       qtchooser -print-env [-qt=version]
       qtchooser -run-tool=tool [-qt=version] [program_arguments]
       <executable_name> [-qt=version] [program_arguments]

DESCRIPTION
       Qt is a cross-platform C++ application framework. Qt's primary feature is its rich set of widgets that provide standard GUI functionality.

       The Qt Chooser provides a wrapper to switch between versions of Qt development binaries when multiple versions like 4 and 5 are installed or local Qt builds are to be used.

       It is commonly used via a symlink from an executable_name like qmake.

OPTIONS
       The options which apply to the qtchooser command are:

       -list-versions
           Lists available Qt versions from the configuration files

       -print-env
           Prints environment information

       -qt=version
           Selects version as the Qt version to be used

       -run-tool=tool
           Runs the selected tool.

ENVIRONMENT
       QTCHOOSER_NO_GLOBAL_DIR
              If  qtchooser  has  been  built  with  QTCHOOSER_GLOBAL_DIR  (predefined search paths for qtchooser's configuration files, useful in some distros), setting this variable will override its
              effect.

       QT_SELECT
              Same as -qt=version. If set, the selected configuration is used and binaries symlinked to qtchooser will be executed without additional parameters.

       XDG_CONFIG_HOME

       XDG_CONFIG_DIRS
              Used as specified in <http://standards.freedesktop.org/basedir-spec/basedir-spec-latest.html>

FILES
       /etc/xdg/qtchooser/*.conf
              System-wide configuration files. Each has two lines, the first is the path to the binaries and the second is the path to the Qt libraries. If a default.conf is provided, the settings from
              it will be automatically used in case nothing else is selected.

       $HOME/.config/qtchooser/*.conf
              User configuration files.

AUTHOR
       qtchooser was written by Thiago Macieira from Intel.

       This manual page was written by Timo Jyrinki <timo@debian.org>, for the Debian project (but may be used by others).

                                                                                             JANUARY 2, 2013                                                                                 QTCHOOSER(1)
