intel_gtt(1)                                                                             General Commands Manual                                                                             intel_gtt(1)

NAME
       intel_gtt - Dump the contents of an Intel GPU's GTT

SYNOPSIS
       intel_gtt

DESCRIPTION
       intel_gtt is a tool to view the contents of the GTT on an Intel GPU.  The GTT is the page table that maps between GPU addresses and system memory.  This tool can be useful in debugging the Linux
       AGP driver initialization of the chip or in debugging later overwriting of the GTT with garbage data.

X Version 11                                                                               intel-gpu-tools 1.14                                                                              intel_gtt(1)
