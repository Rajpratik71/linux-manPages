RECON-CLI(1)                           General Commands Manual                           RECON-CLI(1)

NAME
       recon-cli - Allow the use of recon-ng from the command line

SYNOPSIS
       recon-cli  [-h]  [-v]  [-w  workspace] [-C command] [-c command] [-G] [-g name=value] [-M] [-m
       module] [-O] [-o name=value] [-x] [--no-check]

DESCRIPTION
       If external shell scripting is preferred, recon-cli makes all  of  the  functionality  of  the
       Recon-ng framework accessible from the command line.

OPTIONS
       -h, --help
              show options and exit

       -v, --version
              show program's version number and exit

       -w workspace
              load/create a workspace

       -C command
              runs a command at the global context

       -c command
              runs a command at the module context (pre-run)

       -G     show available global options

       -g name=value
              set a global option (can be used more than once)

       -M     show modules

       -m module
              specify the module

       -O     show available module options

       -o name=value
              set a module option (can be used more than once)

       -x     run the module

       --no-check
              disable version check

AUTHORS
       Tim Tomes (@LaNMaSteR53) tjt1980[at]gmail.com

                                                                                         RECON-CLI(1)
