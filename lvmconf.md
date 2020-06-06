LVMCONF(8)                                                                                                                                                                                     LVMCONF(8)

NAME
       lvmconf — LVM configuration modifier

SYNOPSIS
       lvmconf  [--disable-cluster]  [--enable-cluster]  [--enable-halvm]  [--disable-halvm]  [--file <configfile>] [--lockinglib <lib>] [--lockinglibdir <dir>] [--services] [--mirrorservice] [--start‐
       stopservices]

DESCRIPTION
       lvmconf is a script that modifies the locking configuration in an lvm configuration file. See lvm.conf(5). In addition to that, it can also set Systemd or SysV services according to  changes  in
       the lvm configuration if needed.

OPTIONS
       --disable-cluster
              Set locking_type to the default non-clustered type. Also reset lvmetad use to its default.

       --enable-cluster
              Set locking_type to the default clustered type on this system.  Also disable lvmetad use as it is not yet supported in clustered environment.

       --disable-halvm
              Set locking_type to the default non-clustered type. Also reset lvmetad use to its default.

       --enable-halvm
              Set locking_type suitable for HA LVM use.  Also disable lvmetad use as it is not yet supported in HA LVM environment.

       --file <configfile>
              Apply the changes to configfile instead of the default /etc/lvm/lvm.conf.

       --lockinglib <lib>
              Set external locking_library locking library to load if an external locking type is used.

       --lockinglibdir <dir>

       --services
              In  addition  to  setting  the  lvm  configuration,  also enable or disable related Systemd or SysV clvmd and lvmetad services. This script does not configure services provided by cluster
              resource agents.

       --mirrorservice
              Also enable or disable optional cmirrord service when handling services (applicable only with --services).

       --startstopservices
              In addition to enabling or disabling related services, start or stop them immediately (applicable only with --services).

FILES
       /etc/lvm/lvm.conf

SEE ALSO
       lvm(8), lvm.conf(5)

Red Hat, Inc                                                                        LVM TOOLS 2.02.133(2) (2015-10-30)                                                                         LVMCONF(8)
