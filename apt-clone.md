APT-CLONE(8)                                                       User Commands                                                      APT-CLONE(8)

NAME
       apt-clone - manual page for apt-clone 0.2

DESCRIPTION
       usage: apt-clone [-h] [--debug] {info,clone,restore,restore-new-distro} ...

       Clone/restore package info of a debian based system or chroot environment.

   optional arguments:
       -h, --help
              show   help   message   for   apt-clone.   Alternatively   --help   will   output   command   specific   help   for   any   of   the
              {info,clone,restore,restore-new-distro} commands.

       --debug
              enable debug output

   Commands:
              {info,clone,restore,restore-new-distro}

       info   Show info about a apt-clone archive.

       clone  Create a clone-file into <destination>. A alternative source dir can be specified with --source.

       restore
              Restore a clone file from <source>. A alternative destination can be given with --destination.

       restore-new-distro
              Restore a clone file from <source> to <destination> and try upgrading along the way. this can be used so that the current release is
              cloned, a new install is done and then the old clone is installed.

apt-clone 0.2                                                     September 2011                                                      APT-CLONE(8)
