VIRTUALBOX(1)                                                                                 User Commands                                                                                 VIRTUALBOX(1)

NAME
       VirtualBox - x86 virtualization solution

DESCRIPTION
       Oracle VM VirtualBox Manager3 (C) 2005-2016 Oracle Corporation All rights reserved.

   Usage:
       --startvm <vmname|UUID>
              start a VM by specifying its UUID or name

       --separate
              start a separate VM process

       --normal
              keep normal (windowed) mode during startup

       --fullscreen
              switch to fullscreen mode during startup

       --seamless
              switch to seamless mode during startup

       --scale
              switch to scale mode during startup

       --no-startvm-errormsgbox
              do not show a message box for VM start errors

       --restore-current
              restore the current snapshot before starting

       --no-aggressive-caching
              delays caching media info in VM processes

       --fda <image|none>
              Mount the specified floppy image

       --dvd <image|none>
              Mount the specified DVD image

       --dbg  enable the GUI debug menu

       --debug
              like --dbg and show debug windows at VM startup

       --debug-command-line
              like --dbg and show command line window at VM startup

       --debug-statistics
              like --dbg and show statistics window at VM startup

       --no-debug
              disable the GUI debug menu and debug windows

       --start-paused
              start the VM in the paused state

       --start-running
              start the VM running (for overriding --debug*)

   Expert options:
       --disable-patm
              disable code patching (ignored by AMD-V/VT-x)

       --disable-csam
              disable code scanning (ignored by AMD-V/VT-x)

       --recompile-supervisor
              recompiled execution of supervisor code (*)

       --recompile-user
              recompiled execution of user code (*)

       --recompile-all
              recompiled execution of all code, with disabled code patching and scanning

       --execute-all-in-iem
              For debugging the interpreted execution mode.

       --warp-pct <pct>
              time warp factor, 100% (= 1.0) = normal speed

              (*) For AMD-V/VT-x setups the effect is --recompile-all.

   The following environment (and extra data) variables are evaluated:
       VBOX_GUI_DBG_ENABLED (GUI/Dbg/Enabled)
              enable the GUI debug menu if set

       VBOX_GUI_DBG_AUTO_SHOW (GUI/Dbg/AutoShow)
              show debug windows at VM startup

       VBOX_GUI_NO_DEBUGGER
              disable the GUI debug menu and debug windows

VirtualBox                                                                                      June 2016                                                                                   VIRTUALBOX(1)
