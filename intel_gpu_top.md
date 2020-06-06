intel_gpu_top(1)                                                                         General Commands Manual                                                                         intel_gpu_top(1)

NAME
       intel_gpu_top - Display a top-like summary of Intel GPU usage

SYNOPSIS
       intel_gpu_top
       intel_gpu_top [ parameters ]

DESCRIPTION
       intel_gpu_top is a tool to display usage information of an Intel GPU.  It requires root privilege to map the graphics device.

   Options
       -s [samples per second]
              number of samples to acquire per second

       -o [output file]
              collect usage statistics to [file]. If file is "-", run non-interactively and output statistics to stdout.

       -e ["command to profile"]
              execute a command, and leave when it is finished. Note that the entire command with all parameters should be included as one parameter.

       -h     show usage notes

EXAMPLES
       intel_gpu_top -o "cairo-trace-gvim.log" -s 100 -e "cairo-perf-trace /tmp/gvim"
              will run cairo-perf-trace with /tmp/gvim trace, non-interactively, saving the statistics into cairo-trace-gvim.log file, and collecting 100 samples per second.

       Note that idle units are not displayed, so an entirely idle GPU will only display the ring status and header.

BUGS
       Some GPUs report some units as busy when they aren't, such that even when idle and not hung, it will show up as 100% busy.

X Version 11                                                                               intel-gpu-tools 1.14                                                                          intel_gpu_top(1)
