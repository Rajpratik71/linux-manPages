intel_panel_fitter(1)                                                                    General Commands Manual                                                                    intel_panel_fitter(1)

NAME
       intel_panel_fitter - Change the panel fitter settings

SYNOPSIS
       intel_panel_fitter [options]

DESCRIPTION
       intel_panel_fitter is a tool that allows you to change the panel fitter settings, so you can change the size of the screen being displayed on your monitor without changing the real pixel size of
       your desktop. The biggest use case for this tool is to work around overscan done by TVs and some monitors in interlaced mode.

   Options
       -p [pipe]
              pipe to be used (A, B or C, but C is only present on Ivy Bridge and newer).

       -x [value]
              final screen width size in pixels (needs -p option).

       -y [value]
              final screen height size in pixels (needs -p option).

       -d     disable panel fitter (needs -p option, ignores -x and -y options).

       -l     list current state of each pipe.

       -h     prints the help message.

EXAMPLES
       intel_panel_fitter -l
              will list the current status of each pipe, so you can decide what to do.

       intel_panel_fitter -p A -x 1850 -y 1040
              will change the pipe A size to 1850x1040 pixels.

       intel_panel_fitter -p A -d
              will disable the panel fitter for pipe A.

NOTES
       In the future, there will be support for this feature inside the Linux Kernel.

       Machines older than Ironlake are still not supported, but support may be possible to implement.

X Version 11                                                                               intel-gpu-tools 1.14                                                                     intel_panel_fitter(1)
