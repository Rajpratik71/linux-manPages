SYSTEMD-DETECT-VIRT(1)                                                                    systemd-detect-virt                                                                   SYSTEMD-DETECT-VIRT(1)

NAME
       systemd-detect-virt - Detect execution in a virtualized environment

SYNOPSIS
       systemd-detect-virt [OPTIONS...]

DESCRIPTION
       systemd-detect-virt detects execution in a virtualized environment. It identifies the virtualization technology and can distinguish full machine virtualization from container virtualization.
       systemd-detect-virt exits with a return value of 0 (success) if a virtualization technology is detected, and non-zero (error) otherwise. By default, any type of virtualization is detected,
       and the options --container and --vm can be used to limit what types of virtualization are detected.

       When executed without --quiet will print a short identifier for the detected virtualization technology. The following technologies are currently identified:

       Table 1. Known virtualization technologies (both VM, i.e. full hardware virtualization, and container, i.e. shared kernel virtualization)
       ┌──────────┬────────────────┬───────────────────────────────────────────────────┐
       │Type      │ ID             │ Product                                           │
       ├──────────┼────────────────┼───────────────────────────────────────────────────┤
       │VM        │ qemu           │ QEMU software virtualization, without KVM         │
       │          ├────────────────┼───────────────────────────────────────────────────┤
       │          │ kvm            │ Linux KVM kernel virtual machine, with whatever   │
       │          │                │ software, except                                  │
       │          │                │             Oracle Virtualbox                     │
       │          ├────────────────┼───────────────────────────────────────────────────┤
       │          │ zvm            │ s390 z/VM                                         │
       │          ├────────────────┼───────────────────────────────────────────────────┤
       │          │ vmware         │ VMware Workstation or Server, and related         │
       │          │                │ products                                          │
       │          ├────────────────┼───────────────────────────────────────────────────┤
       │          │ microsoft      │ Hyper-V, also known as Viridian or Windows Server │
       │          │                │ Virtualization                                    │
       │          ├────────────────┼───────────────────────────────────────────────────┤
       │          │ oracle         │ Oracle VM VirtualBox (historically marketed by    │
       │          │                │ innotek and Sun Microsystems),                    │
       │          │                │             for legacy and KVM hypervisor         │
       │          ├────────────────┼───────────────────────────────────────────────────┤
       │          │ xen            │ Xen hypervisor (only domU, not dom0)              │
       │          ├────────────────┼───────────────────────────────────────────────────┤
       │          │ bochs          │ Bochs Emulator                                    │
       │          ├────────────────┼───────────────────────────────────────────────────┤
       │          │ uml            │ User-mode Linux                                   │
       │          ├────────────────┼───────────────────────────────────────────────────┤
       │          │ parallels      │ Parallels Desktop, Parallels Server               │
       │          ├────────────────┼───────────────────────────────────────────────────┤
       │          │ bhyve          │ bhyve, FreeBSD hypervisor                         │
       ├──────────┼────────────────┼───────────────────────────────────────────────────┤
       │Container │ openvz         │ OpenVZ/Virtuozzo                                  │
       │          ├────────────────┼───────────────────────────────────────────────────┤
       │          │ lxc            │ Linux container implementation by LXC             │
       │          ├────────────────┼───────────────────────────────────────────────────┤
       │          │ lxc-libvirt    │ Linux container implementation by libvirt         │
       │          ├────────────────┼───────────────────────────────────────────────────┤
       │          │ systemd-nspawn │ systemd's minimal container implementation, see   │
       │          │                │ systemd-nspawn(1)                                 │
       │          ├────────────────┼───────────────────────────────────────────────────┤
       │          │ docker         │ Docker container manager                          │
       │          ├────────────────┼───────────────────────────────────────────────────┤
       │          │ rkt            │ rkt app container runtime                         │
       └──────────┴────────────────┴───────────────────────────────────────────────────┘

       If multiple virtualization solutions are used, only the "innermost" is detected and identified. That means if both machine and container virtualization are used in conjunction, only the
       latter will be identified (unless --vm is passed).

OPTIONS
       The following options are understood:

       -c, --container
           Only detects container virtualization (i.e. shared kernel virtualization).

       -v, --vm
           Only detects hardware virtualization).

       -r, --chroot
           Detect whether invoked in a chroot(2) environment. In this mode, no output is written, but the return value indicates whether the process was invoked in a chroot() environment or not.

       --private-users
           Detect whether invoked in a user namespace. In this mode, no output is written, but the return value indicates whether the process was invoked inside of a user namespace or not. See
           user_namespaces(7) for more information.

       -q, --quiet
           Suppress output of the virtualization technology identifier.

       -h, --help
           Print a short help text and exit.

       --version
           Print a short version string and exit.

EXIT STATUS
       If a virtualization technology is detected, 0 is returned, a non-zero code otherwise.

SEE ALSO
       systemd(1), systemd-nspawn(1), chroot(2), namespaces(7)

systemd 237                                                                                                                                                                     SYSTEMD-DETECT-VIRT(1)
