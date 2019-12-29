VLC-WRAPPER(1)                          General Commands Manual                         VLC-WRAPPER(1)

NAME
       vlc-wrapper - a wrapper to drop privileges with VLC

SYNOPSIS
       vlc-wrapper [OPTIONS]

DESCRIPTION
       This manual page documents briefly the VLC wrapper to open privileged network ports.  The ports
       it can open are 80, 443 and 554.

OPTIONS
       They will be passed to VLC with no modification.

USAGE
       The preferred way is to use sudo :

        $ sudo vlc-wrapper --option1 --option2

       You can also set the SUDO_UID environment variable:

        # SUDO_UID=1000 vlc-wrapper --option1 --option2

SEE ALSO
       vlc(1), sudo(8)

AUTHOR
       This manual page was written by Christophe Mutricy.

                                             Aug 31, 2008                               VLC-WRAPPER(1)
