scrcpy(1)                                                     General Commands Manual                                                    scrcpy(1)

NAME
       scrcpy - Display and control your Android device

SYNOPSIS
       scrcpy [options]

DESCRIPTION
       scrcpy provides display and control of Android devices connected on USB (or over TCP/IP). It does not require any root access.

OPTIONS
       --always-on-top
              Make scrcpy window always on top (above other windows).

       -b, --bit-rate value
              Encode the video at the given bit-rate, expressed in bits/s. Unit suffixes are supported: 'K' (x1000) and 'M' (x1000000).

              Default is 8000000.

       --crop width:height:x:y
              Crop the device screen on the server.

              The values are expressed in the device natural orientation (typically, portrait for a phone, landscape for a tablet). Any --max-size
              value is computed on the cropped size.

       -f, --fullscreen
              Start in fullscreen.

       -h, --help
              Print this help.

       --max-fps value
              Limit the framerate of screen capture (only supported on devices with Android >= 10).

       -m, --max-size value
              Limit both the width and height of the video to value. The other dimension is computed so that the device aspect-ratio is preserved.

              Default is 0 (unlimited).

       -n, --no-control
              Disable device control (mirror the device in read-only).

       -N, --no-display
              Do not display device (only when screen recording is enabled).

       -p, --port port
              Set the TCP port the client listens on.

              Default is 27183.

       --prefer-text
              Inject alpha characters and space as text events instead of key events.

              This avoids issues when combining multiple keys to enter special characters, but breaks the expected behavior of alpha keys in games
              (typically WASD).

       --push-target path
              Set the target directory for pushing files to the device by drag & drop. It is passed as-is to "adb push".

              Default is "/sdcard/".

       -r, --record file
              Record screen to file.

              The format is determined by the --record-format option if set, or by the file extension (.mp4 or .mkv).

       --record-format format
              Force recording format (either mp4 or mkv).

       --render-expired-frames
              By  default,  to  minimize  latency,  scrcpy always renders the last available decoded frame, and drops any previous ones. This flag
              forces to render all frames, at a cost of a possible increased latency.

       -s, --serial number
              The device serial number. Mandatory only if several devices are connected to adb.

       -S, --turn-screen-off
              Turn the device screen off immediately.

       -t, --show-touches
              Enable "show touches" on start, disable on quit.

              It only shows physical touches (not clicks from scrcpy).

       -v, --version
              Print the version of scrcpy.

       --window-borderless
              Disable window decorations (display borderless window).

       --window-title text
              Set a custom window title.

       --window-x value
              Set the initial window horizontal position.

              Default is -1 (automatic).

       --window-y value
              Set the initial window vertical position.

              Default is -1 (automatic).

       --window-width value
              Set the initial window width.

              Default is 0 (automatic).

       --window-height value
              Set the initial window height.

              Default is 0 (automatic).

SHORTCUTS
       Ctrl+f switch fullscreen mode

       Ctrl+g resize window to 1:1 (pixel-perfect)

       Ctrl+x, Double-click on black borders
              resize window to remove black borders

       Ctrl+h, Home, Middle-click
              Click on HOME

       Ctrl+b, Ctrl+Backspace, Right-click (when screen is on)
              Click on BACK

       Ctrl+s Click on APP_SWITCH

       Ctrl+m Click on MENU

       Ctrl+Up
              Click on VOLUME_UP

       Ctrl+Down
              Click on VOLUME_DOWN

       Ctrl+p Click on POWER (turn screen on/off)

       Right-click (when screen is off)
              turn screen on

       Ctrl+o turn device screen off (keep mirroring)

       Ctrl+r rotate device screen

       Ctrl+n expand notification panel

       Ctrl+Shift+n
              collapse notification panel

       Ctrl+c copy device clipboard to computer

       Ctrl+v paste computer clipboard to device

       Ctrl+Shift+v
              copy computer clipboard to device

       Ctrl+i enable/disable FPS counter (print frames/second in logs)

       Drag & drop APK file
              install APK from computer

Environment variables
       ADB    Specify the path to adb.

       SCRCPY_SERVER_PATH
              Specify the path to server binary.

AUTHORS
       scrcpy is written by Romain Vimont.

       This manual page was written by Yangfl ⟨mmyangfl@gmail.com⟩ for the Debian Project (and may be used by others).

REPORTING BUGS
       Report bugs to ⟨https://github.com/Genymobile/scrcpy/issues⟩.

COPYRIGHT
       Copyright © 2018 Genymobile Genymobile ⟨https://www.genymobile.com⟩

       Copyright © 2018-2019 Romain Vimont ⟨rom@rom1v.com⟩

       Licensed under the Apache License, Version 2.0.

WWW
       ⟨https://github.com/Genymobile/scrcpy⟩

                                                                                                                                         scrcpy(1)
