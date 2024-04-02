VBOXCLIENT(1)                                                                         User Commands                                                                         VBOXCLIENT(1)

NAME
       VBoxClient - x86 virtualization solution

SYNOPSIS
       VBoxClient --clipboard|--draganddrop|--display|--checkhostversion|--seamless|check3d [-d|--nodaemon]

DESCRIPTION
       Starts the VirtualBox X Window System guest services.

OPTIONS
       --clipboard
              starts the shared clipboard service

       --draganddrop
              starts the drag and drop service

       --display
              starts the display management service

       --checkhostversion starts the host version notifier service

       --check3d
              tests whether 3D pass-through is enabled

       --seamless
              starts the seamless windows service

       -d, --nodaemon
              continues running as a system service

       -h, --help
              shows this help text

       -V, --version
              shows version information

VBoxClient                                                                              June 2016                                                                           VBOXCLIENT(1)
