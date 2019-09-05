VIRTUALENV(1)                                                                                                                        VIRTUALENV(1)

NAME
       virtualenv - create virtual Python instances

SYNOPSIS
       virtualenv [options...] [destination-directory]

DESCRIPTION
       virtualenv creates virtual Python executables, each of which can have its own set of installed modules. Programs that require different
       versions of modules or sets of modules that may be incompatible with others to be installed on the same system without conflicts.

       The result is a directory containing its own Python executables (in DIR/bin/pythonVER and DIR/bin/python) and its own module directory
       containing the standard library as installed by the system.  Additional modules may be installed via setuptools, as invoked from the binary
       directory (DIR/bin/easy_install). The system´s site-packages directories will not be available by default, but can be made visible with the
       --system-site-packages option. They can then be overridden with locally-installed modules.

       In addition, a shell script called "activate" will be installed in the bin directory. If sourced, this will cause normal invocations of the
       Python executable to use the virtual environment.

       By running the virtualenv command explicitly under the desired Python interpreter, the user can control which version of Python is created
       in the virtual environment.

OPTIONS
       -h, --help
           Show summary of options.

       --version
           Show the version of the program.

       -v, --verbose
           Be more verbose.

       -q, --quiet
           Be less verbose; suppress unimportant output.

       --clear
           Clear out a previously-created virtual Python instance in this location before creating a new one.

       -p PYTHON_EXE,--python=PYTHON_EXE
           The Python interpreter to use to create the new environment.

       --no-site-packages
           Ignored (the default).  Don´t give access to the global site-packages modules to the virtual environment.

       --system-site-packages
           Give access to the global site-packages modules to the virtual environment.

       --always-copy
           Always copy files rather than symlinking.

       --unzip-setuptools
           Unzip Setuptools when installing it.  This fixes up scripts and makes all .pth files relative.

       --relocatable
           Make an EXISTING virtualenv environment relocatable.

       --no-setuptools
           Do not install setuptools (or pip) in the new virtualenv.

       --no-pip
           Do not install pip in the new virtualenv.

       --extra-search-dir=SEARCH_DIRS
           Directory to search for setuptools/distribute/pip distributions in.  Can be specified multiple times.

       --prompt==PROMPT
           Provides an alternative prompt prefix for this environment.

AUTHORS
           This manual page was originally written by Jeff Licquia <licquia@debian.org>, later rewritten by Carl Chenet <chaica@ohmytux.com>.

LICENSE
           Permission is granted to copy, distribute and/or modify this document under the terms of the GNU General Public License, version 2 or any later version published by the Free Software Foundation.

           On Debian systems, the complete text of the GNU General Public License can be found in /usr/share/common-licenses/GPL.

COPYRIGHT
           Copyright © 2007 Jeff Licquia

                                                                    12/02/2009                                                       VIRTUALENV(1)
