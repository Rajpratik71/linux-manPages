INTEL_FREQUENCY:(1)                                                User Commands                                               INTEL_FREQUENCY:(1)

NAME
       intel_gpu_frequency: - manual page for intel_gpu_frequency

SYNOPSIS
       intel_gpu_frequency [-e] [--min | --max] [-g] [-s frequency_mhz]

DESCRIPTION
       A  program  to  manipulate  Intel  GPU frequencies. Intel GPUs will automatically throttle the frequencies based on system demands, up when
       needed, down when not. This tool should only be used for debugging performance problems, or trying to get a stable frequency  while  bench‐
       marking.

       Intel  GPUs  only  accept  specific frequencies. The tool may, or may not attempt to adjust requests to the proper frequency if they aren't
       correct. This may lead to non-obvious failures when setting frequency. Multiples of 50MHz is usually a safe bet.

OPTIONS
       -e     Lock frequency to the most efficient frequency

       -g, --get
              Get all the current frequency settings

       -s, --set
              Lock frequency to an absolute value (MHz)

       -c, --custom
              Set a min, or max frequency "min=X | max=Y"

       -m  --max
              Lock frequency to max frequency

       -i  --min
              Lock frequency to min (never a good idea, DEBUG ONLY)

       -d  --defaults
              Return the system to hardware defaults

       -h  --help
              Returns this

       -v  --version Version

EXAMPLES
       intel_gpu_frequency -gmin,cur
              Get the current and minimum frequency

       intel_gpu_frequency -s 400
              Lock frequency to 400Mhz

       intel_gpu_frequency -c max=750
              Set the max frequency to 750MHz

REPORTING BUGS
       Report bugs to https://bugs.freedesktop.org

COPYRIGHT
       Copyright (C) 2015 Intel Corporation

intel_gpu_frequency                                                January 2015                                                INTEL_FREQUENCY:(1)
