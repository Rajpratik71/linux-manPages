actexec(1)                                                        ActExec Manual                                                        actexec(1)

NAME
       ActExec - Task automation

SYNOPSIS
       actexec -s|-c|-Q|-p|--proxy-mode|--proxy-type|--proxy-host |--proxy-port|--proxy-user|--proxy-password|-v|-h <filename>

DESCRIPTION
       ActExec is a commandline tool that allows you to execute code files and scripts made with Actiona.

OPTIONS
       -s, --script
              switch to script mode, may not be used with -c

       -c, --code
              switch to code mode, may not be used with -s

       -Q, --nocodeqt
              Do not include the Qt library into the code.

       -p, --portable
              Starts in portable mode, storing the settings in the executable folder.

       --proxy-mode
              Sets the proxy mode, values are none system custom (default is system).

       --proxy-type
              Sets the custom proxy type, values are http socks (default is socks).

       --proxy-host
              Sets the custom proxy host.

       --proxy-port
              Sets the custom proxy port.

       --proxy-user
              Sets the custom proxy user.

       --proxy-password
              Sets the custom proxy password.

       -v, --version
              Displays the version number of Actiona.

       -h, --help
              Displays a listing of these commandline options.

SUPPORT
       Please visit http://actiona.tools/ for further information. Report bugs only if you are using the latest version available from the Actiona
       website.

COPYRIGHT
       Copyright (C) 2005-2011  Jonathan Mercier-Ganady

       ActExec is distributed under the terms of the GNU General Public License version 3 or later.

                                                                   November 2011                                                        actexec(1)
