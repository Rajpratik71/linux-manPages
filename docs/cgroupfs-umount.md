CGROUPFS-MOUNT(8)                      System Manager's Manual                      CGROUPFS-MOUNT(8)

NAME
       cgroupfs-mount, cgroupfs-umount - set up cgroupfs mount hierarchies

SYNOPSIS
       Control  groups  are  a kernel mechanism for tracking and imposing limits on resource usage on
       groups of tasks.  These scripts mount and unmount the hierarchies for managing them.

       cgroupfs-mount

       cgroupfs-umount

DESCRIPTION
       The location for the mounts these scripts create is /sys/fs/cgroup, which is  widely  regarded
       as "the place" for these to be mounted (for example, systemd mounts them here as well).

RETURN VALUE
       Zero  for  success or if it is determined that we can or should not mount, due to user entries
       in /etc/fstab or pre-existing mounts.  Non-zero for explicit failures.

CAVEATS & DIAGNOSTICS
       It is critically important for the proper operation of these scripts that you do not  manually
       include  any  cgroup  mount  points in /etc/fstab.  After commenting out any extraneous cgroup
       entries in /etc/fstab, you should either reboot or manually umount them and then run cgroupfs-
       mount again.

RESTRICTIONS
       These  scripts  intentionally  do not do any cgroup management or classification of tasks into
       cgroups.  They are also very intentionally light on configurability (to the point of non-exis‐
       tence) to keep the implementation simple and less error-prone.

AUTHORS
       Serge Hallyn and Tianon Gravi

HISTORY
       This package was originally derived from the cgroup-lite package from Ubuntu.

SEE ALSO
       mount(8), fstab(5), systemd(1)

                                                                                    CGROUPFS-MOUNT(8)
