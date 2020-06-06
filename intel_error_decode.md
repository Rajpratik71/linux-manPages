intel_error_decode(1)                                                                    General Commands Manual                                                                    intel_error_decode(1)

NAME
       intel_error_decode - Decodes an Intel GPU dump automatically captured by the kernel at the time of an error.

SYNOPSIS
       intel_error_decode
       intel_error_decode [ filename ]

DESCRIPTION
       intel_error_decode  is  a  tool that decodes the instructions and state of the GPU at the time of an error. It requires kernel 2.6.34 or newer, and either debugfs mounted on /sys/kernel/debug or
       /debug containing a current i915_error_state or you can pass a file containing a saved error.

   Options
       filename
              Decodes a previously saved error.

X Version 11                                                                               intel-gpu-tools 1.14                                                                     intel_error_decode(1)
