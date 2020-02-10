intel_aubdump(1)                                                                         General Commands Manual                                                                         intel_aubdump(1)

NAME
       intel_aubdump - Launch an application and capture rendering to an AUB file

SYNOPSIS
       intel_aubdump [OPTION]... -- COMMAND [ARGUMENTS]

DESCRIPTION
       Run COMMAND with ARGUMENTS and dump an AUB file that captures buffer contents and execution of the i915 GEM application.

       -v     Enable verbose mode.

       --help Output a usage message and exit.

       -o FILE, --output=FILE
              Write the trace output to the file FILE.  Default is COMMAND.aub.

       --device=ID
              Override  the PCI ID of the drm device. This is useful for getting an aub dump for a different generation of GPU. In this mode intel_aubdump will intercept but not forward the execbuffer2
              ioctl, as that would typically cause a GPU hang.

EXAMPLES
       intel_aubdump -v --output=stuff.aub -- glxgears -geometry 500x500
              Launches glxgears with its -geometry option and enables aub dumping with the -v and --output=stuff.aub options.

X Version 11                                                                               intel-gpu-tools 1.14                                                                          intel_aubdump(1)
