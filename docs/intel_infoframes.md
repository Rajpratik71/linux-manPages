intel_infoframes(1)                                           General Commands Manual                                          intel_infoframes(1)

NAME
       intel_infoframes - View and change HDMI InfoFrames

SYNOPSIS
       intel_infoframes

DESCRIPTION
       intel_infoframes  is  a tool to view and change the HDMI InfoFrames sent by the GPU. Its main purpose is to be used as a debugging tool. In
       some cases (e.g., when changing modes) the Kernel will undo the changes made by this tool.

       Descriptions of the InfoFrame fields can be found on the HDMI and CEA-861 specifications.

       Use the -h or --help options to learn how to use the command

LIMITATIONS
       Not all HDMI monitors respect the InfoFrames sent to them. Only GEN 4 or newer hardware is supported yet.

SEE ALSO
       HDMI specification, CEA-861 specification.

X Version 11                                                   intel-gpu-tools 1.14                                            intel_infoframes(1)
