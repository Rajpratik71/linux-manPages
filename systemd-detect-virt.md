SYSTEMD-DETECT-VIRT(1)                                                                       systemd-detect-virt                                                                       SYSTEMD-DETECT-VIRT(1)



NAME
       systemd-detect-virt - Detect execution in a virtualized environment

SYNOPSIS
       systemd-detect-virt [OPTIONS...]

DESCRIPTION
       systemd-detect-virt detects execution in a virtualized environment. It identifies the virtualization technology and can distinguish full VM virtualization from container virtualization.
       systemd-detect-virt exits with a return value of 0 (success) if a virtualization technology is detected, and non-zero (error) otherwise. By default, any type of virtualization is detected, and the
       options --container and --vm can be used to limit what types of virtualization are detected.

       When executed without --quiet will print a short identifier for the detected virtualization technology. The following technologies are currently identified:

       Table 1. Known virtualization technologies (both VM, i.e. full hardware virtualization, and container, i.e. shared kernel virtualization)
       ┌──────────┬────────────────┬────────────────────────────────────────────────────┐
       │Type      │ ID             │ Product                                            │
       ├──────────┼────────────────┼────────────────────────────────────────────────────┤
       │          │ qemu           │ QEMU software virtualization                       │
       │          ├────────────────┼────────────────────────────────────────────────────┤
       │          │ kvm            │ Linux KVM kernel virtual machine                   │
       │          ├────────────────┼────────────────────────────────────────────────────┤
       │          │ zvm            │ s390 z/VM                                          │
       │          ├────────────────┼────────────────────────────────────────────────────┤
       │          │ vmware         │ VMware Workstation or Server, and related products │
       │          ├────────────────┼────────────────────────────────────────────────────┤
       │          │ microsoft      │ Hyper-V, also known as Viridian or Windows Server  │
       │          │                │ Virtualization                                     │
       │VM        ├────────────────┼────────────────────────────────────────────────────┤
       │          │ oracle         │ Oracle VM VirtualBox (historically marketed by     │
       │          │                │ innotek and Sun Microsystems)                      │
       │          ├────────────────┼────────────────────────────────────────────────────┤
       │          │ xen            │ Xen hypervisor (only domU, not dom0)               │
       │          ├────────────────┼────────────────────────────────────────────────────┤
       │          │ bochs          │ Bochs Emulator                                     │
       │          ├────────────────┼────────────────────────────────────────────────────┤
       │          │ uml            │ User-mode Linux                                    │
       │          ├────────────────┼────────────────────────────────────────────────────┤
       │          │ parallels      │ Parallels Desktop, Parallels Server                │
       ├──────────┼────────────────┼────────────────────────────────────────────────────┤
       │          │ openvz         │ OpenVZ/Virtuozzo                                   │
       │          ├────────────────┼────────────────────────────────────────────────────┤
       │          │ lxc            │ Linux container implementation by LXC              │
       │          ├────────────────┼────────────────────────────────────────────────────┤
       │          │ lxc-libvirt    │ Linux container implementation by libvirt          │
       │Container ├────────────────┼────────────────────────────────────────────────────┤
       │          │ systemd-nspawn │ systemd's minimal container implementation, see    │
       │          │                │ systemd-nspawn(1)                                  │
       │          ├────────────────┼────────────────────────────────────────────────────┤
       │          │ docker         │ Docker container manager                           │
       │          ├────────────────┼────────────────────────────────────────────────────┤
       │          │ rkt            │ rkt app container runtime                          │
       └──────────┴────────────────┴────────────────────────────────────────────────────┘

       If multiple virtualization solutions are used, only the "innermost" is detected and identified. That means if both VM virtualization and container virtualization are used in conjunction, only the
       latter will be identified (unless --vm is passed).

OPTIONS
       The following options are understood:

       -c, --container
           Only detects container virtualization (i.e. shared kernel virtualization).

       -v, --vm
           Only detects VM virtualization (i.e. full hardware virtualization).

       -r, --chroot
           Detect whether invoked in a chroot(2) environment. In this mode, no output is written, but the return value indicates whether the process was invoked in a chroot() environment or not.

       -q, --quiet
           Suppress output of the virtualization technology identifier.

       -h, --help
           Print a short help text and exit.

       --version
           Print a short version string and exit.

EXIT STATUS
       If a virtualization technology is detected, 0 is returned, a non-zero code otherwise.

SEE ALSO
       systemd(1), systemd-nspawn(1), chroot(2)



systemd 228                                                                                                                                                                            SYSTEMD-DETECT-VIRT(1)
