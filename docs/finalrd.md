FINALRD(1)                                      finalrd                                     FINALRD(1)

NAME
       finalrd - final runtime directory generator for shutdown

SYNOPSIS
        systemctl enable --now finalrd.service

HOOKS DIRECTORIES
        /usr/share/finalrd/*.finalrd
        /etc/finalrd/*.finalrd
        /run/finalrd/*.finalrd

HOOKS INTERFACE
        foo.finalrd setup
        foo.finalrd halt|poweroff|reboot|kexec

DESCRIPTION
       finalrd generates a shutdown directory /run/initramfs which systemd-shutdown pivots to during
       shutdown. There system shutdown can be finalised and arbitrary hooks can be executed off-root,
       to safely cleanup rootfs and perform any other shutdown tasks.

       For example, a hook may takeover monitoring external metadata RAID arrays, wait for them to be
       clean, and stop them. If one is using iscsiroot, it maybe needed to perform iscsi logout on
       shutdown.

       Typically, one would not run finalrd directly, but instead activate finalrd.service. This would
       execute finalrd generator late in the shutdown cycle, just in time for pivot.

HOOKS INTERFACE DESCRIPTION
       *.finalrd hooks can be shipped in /usr, /etc, /run. These directories are for distribution,
       sysadmin, and transient hooks respectively.

       They are multi-purpose binaries with action passed as the first argument.

       During setup stage, hooks are executed from the rootfs with one argument setup passed as the
       first arg. All hooks are executed in all the directories in order, first everything in /usr,
       then from /etc, then from /run. Environmental variables DESTDIR and DESTROOTDIR are set
       pointing at the finalrd location. This is done for convenience to use initramfs-tools's
       copy_exec function or dracut-install, for copying binaries.

       During shutdown stage, hooks are executed from finalrd in parallel with one argument passed to
       them. The argument is one of halt, poweroff, reboot, kexec.

       Note if there are identically named hooks in multiple configuration directories, all of them
       will be executed during setup stage. But only the last one will be copied into the finalrd and
       executed during the shutdown stage.

SEE ALSO
       The initrd Interface of systemd
       <https://www.freedesktop.org/wiki/Software/systemd/InitrdInterface>

finalrd 2                                                                                   FINALRD(1)
