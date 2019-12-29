xsetpointer(1)                          General Commands Manual                         xsetpointer(1)

NAME
       xsetpointer - set an X Input device as the main pointer

SYNOPSIS
       xsetpointer -l | device-name

DESCRIPTION
       Xsetpointer  sets  an XInput device as the main pointer.  When called with the -l flag it lists
       the available devices.  When called with the -c/+c flag, it toggles the sending of  core  input
       events, for servers which implement a virtual core pointer; -c disables core events, and +c en‐
       ables.

AUTHOR
       Frederic Lepied

X Version 11                               xsetpointer 1.0.1                            xsetpointer(1)
