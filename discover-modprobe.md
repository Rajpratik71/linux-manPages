discover-modprobe(8)                                          System Manager's Manual                                         discover-modprobe(8)

NAME
       discover-modprobe — kernel module loading using discover(1)

SYNOPSIS
       discover-modprobe [-n]  [-v]

Description
       discover-modprobe loads kernel modules identified by discover. It will typically be invoked automatically at boot time.

Options
       -n        Echo the modprobe invocations instead of running them.

       -v        Be verbose.

Files
       /etc/discover-modprobe.conf
                 This configuration file defines the types of modules to load by default, and specific modules not to load.

       /var/lib/discover/crash
                 A  crash  file  written  and  erased  each time discover-modprobe attempts to load a module. If the file lingers, the computer is
                 assumed to have crashed while loading that module, and the module name is added to discover-modprobe.conf as a module to skip  in
                 the future.

See Also
       discover-modprobe.conf(5), modprobe(8), discover(1)

                                                                                                                              discover-modprobe(8)
