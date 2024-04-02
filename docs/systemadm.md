SYSTEMADM(1)                                                         systemadm                                                        SYSTEMADM(1)

NAME
       systemadm - Graphical frontend for the systemd system and service manager

SYNOPSIS
       systemadm [OPTIONS...]

DESCRIPTION
       systemadm is a graphical frontend for the systemd system and service manager and allows introspection and control of systemd.

OPTIONS
       The following options are understood:

       --h, --help
           Prints a short help text and exits.

       --system
           Connect to the systemd system manager. (Default)

       --user
           Connect to the systemd manager of the calling user.

       In addition to this a number of parameters common to all Gtk+ programs are supported.

SEE ALSO
       systemd(1), systemctl(1)

AUTHOR
       Lennart Poettering <lennart@poettering.net>
           Developer

systemd                                                             12/19/2013                                                        SYSTEMADM(1)
