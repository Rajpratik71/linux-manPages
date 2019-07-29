../BIN/VIM-ADDON-MANAGER(1)                                   General Commands Manual                                  ../BIN/VIM-ADDON-MANAGER(1)

   NAME
       vim-addon-manager - command line manager of Vim add-ons

   SYNOPSIS
       vim-addons [OPTION ...] [COMMAND [ADDON ...]]

   DESCRIPTION
       Manage Vim addons installed system-wide, enabling on a per-user basis their installation, removal, ...

       vim-addons  is  capable  of  managing  all Vim addons registered in the system-wide registry of Vim addons (see vim-registry(5)). Each sys‐
       tem-wide addon can be, with respect to a user Vim configuration, in one of the following states:

       installed
              all of the files composing the addon are installed (i.e. symlinked) to their respective places under the target directory. The addon
              is fully functional for the current user

       removed
              the  files  composing the addon are not installed under the target directory.  The addon might still be working for the current user
              if it is installed system-wide by the local administrator

       disabled
              the files composing the addon are not installed under the target directory, but the addon is  installed  system-wide.  However,  the
              addon has been disabled for the current user explicitly via some configuration line in plugin/vim-addons.vim under the target direc‐
              tory. The addon is not working for the current user

       broken only some of the files composing the addon are installed under the target directory. The addon is probably not working for the  cur‐
              rent user

       unavailable
              some (or all) of the files composing the addon are missing from the source directory

   COMMANDS
       A  number  of  commands  can  be  given to vim-addons to inspect or alter the status of the addons: list, status, install, remove, disable,
       amend, files, show.

       A description of the semantics of each command is reported below.

       list   list, one per line, the names of the addons available in the system (i.e. of all the addons mentioned in the registry, not necessar‐
              ily of all enabled addons)

       status show,  one  per  line,  the status of the addons available in the system. If one or more addon arguments are specified only show the
              status of those addons.  This is the default command if nothing is specified.

       install
              install one or more addons under the target directory. Requires at least one addon argument

       remove remove one or more addons from the target directory. Requires at least one addon argument

       disable
              disable one or more addons to be used by the current user. Usually used for addons which are system-wide enabled by the local admin‐
              istrator  but  that  the  current  user  does not want to be used. Using this command will automatically change the content of plug‐
              in/vim-addons.vim under the target directory, probably adding ":let" commands which will inhibit the given addon  from  being  used.
              Requires at least one addon argument

       enable undo the effects of a previous disable command. Requires at least one addon argument

       files  list,  one  per  line, the files composing the specified addons. Files are listed relative to components of the Vim runtimepath (see
              'runtimepath' in the Vim help). Requires at least one addon argument

       show   displays detailed information about the specified addons

   OPTIONS
       All commands accept the following options:

       -h, --help
              show this usage message and exit

       -q, --query
              be quiet and make the output more parseable (for "status")

       -r, --registry-dir
              set the registry directory (default: /usr/share/vim/registry)

       -s, --source-dir
              set the addons source directory (default: /usr/share/vim/addons)

       -t, --target-dir
              set the addons target directory (default: $HOME/.vim)

       -v, --verbose
              increase verbosity level

       -z, --silent
              silent mode: suppress most of the output

       -y, --system-dir
              set the system-wide target directory (default: /var/lib/vim/addons)

       -w, --system-wide
              set the addons target directory to the system-wide target directory, possibly overriding the -t option

   AUTHOR
       Stefano Zacchiroli <zack@debian.org> James Vega <jamessan@debian.org>

   SEE ALSO
       vim(1), vim-registry(5)

   COPYRIGHT
       Copyright (C) 2007 Stefano Zacchiroli Copyright (C) 2009 James Vega

       This program is free software, you can redistribute it and/or modify it under the terms of the GNU General Public License version 3 as pub‐
       lished by the Free Software Foundation; either version 3 of the License, or (at your option) any later version.

                                                                   January 2017                                        ../BIN/VIM-ADDON-MANAGER(1)
