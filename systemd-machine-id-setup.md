SYSTEMD-MACHINE-ID-SETUP(1)                                                                systemd-machine-id-setup                                                               SYSTEMD-MACHINE-ID-SETUP(1)



NAME
       systemd-machine-id-setup - Initialize the machine ID in /etc/machine-id

SYNOPSIS
       systemd-machine-id-setup

DESCRIPTION
       systemd-machine-id-setup may be used by system installer tools to initialize the machine ID stored in /etc/machine-id at install time with a randomly generated ID. See machine-id(5) for more
       information about this file.

       This tool will execute no operation if /etc/machine-id is already initialized.

       If a valid D-Bus machine ID is already configured for the system, the D-Bus machine ID is copied and used to initialize the machine ID in /etc/machine-id.

       If run inside a KVM virtual machine and a UUID is passed via the -uuid option, this UUID is used to initialize the machine ID instead of a randomly generated one. The caller must ensure that the
       UUID passed is sufficiently unique and is different for every booted instanced of the VM.

       Similar, if run inside a Linux container environment and a UUID is set for the container this is used to initialize the machine ID. For details see the documentation of the Container Interface[1].

       Use systemd-firstboot(1) to initialize the machine ID on mounted (but not booted) system images.

OPTIONS
       The following options are understood:

       --root=root
           Takes a directory path as an argument. All paths will be prefixed with the given alternate root path, including config search paths.

       -h, --help
           Print a short help text and exit.

       --version
           Print a short version string and exit.

EXIT STATUS
       On success, 0 is returned, a non-zero failure code otherwise.

SEE ALSO
       systemd(1), machine-id(5), dbus-uuidgen(1), systemd-firstboot(1)

NOTES
        1. Container Interface
           http://www.freedesktop.org/wiki/Software/systemd/ContainerInterface



systemd 219                                                                                                                                                                       SYSTEMD-MACHINE-ID-SETUP(1)
