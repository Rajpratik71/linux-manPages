IBUS-SETUP(1)                                                                                User Commands                                                                               IBUS-SETUP(1)

NAME
       ibus-setup - configuration program for ibus

SYNOPSIS
       ibus-setup

DESCRIPTION
       IBus  is  an  Intelligent Input Bus. It is a new input framework for Linux OS. It provides full featured and user friendly input method user interface.  It also may help developers to develop
       input method easily.

       ibus-setup is the configuration program for IBus.

       Homepage: https://github.com/ibus/ibus/wiki

ADVANCED
       Use system keyboard layout
              If this option is enabled, use your system keymap instead and IBus does not change it with any input method engines. The system keymap is decided by your desktop  session.  IBus  calls
              setxkbmap (1) command internally to set the selected keymap and override the system keymap if this options is disabled.  You can check the current keymap with setxkbmap -query command.

       Share the same input method among all applications
              If this option is disabled, You can choose an input metod engine by input context.

BUGS
       If you find a bug, please report it at http://code.google.com/p/ibus/issues/list

SEE ALSO
       ibus(1)

1.5.17                                                                                       November 2017                                                                               IBUS-SETUP(1)
