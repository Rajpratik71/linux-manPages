intel_stepping(1)                                             General Commands Manual                                            intel_stepping(1)

NAME
       intel_stepping - Display the stepping information for an Intel GPU

SYNOPSIS
       intel_stepping

DESCRIPTION
       intel_stepping  is  a tool to print the stepping information for an Intel GPU, along with the PCI ID and revision used to determine it.  It
       requires root privilege to map the graphics device.

BUGS
       Not all the known stepping IDs or chipsets are included, so the output on some devices may not be as specific as possible.

X Version 11                                                   intel-gpu-tools 1.14                                              intel_stepping(1)
