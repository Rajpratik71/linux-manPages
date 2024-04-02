SIMPLESCREENRECORDER(1)                                     SimpleScreenRecorder Manual                                    SIMPLESCREENRECORDER(1)

NAME
       simplescreenrecorder - A feature-rich screen recorder that supports X11 and OpenGL.

SYNOPSIS
       simplescreenrecorder [OPTIONS]

DESCRIPTION
       SimpleScreenRecorder  is  a  feature-rich  screen recorder that supports X11 and OpenGL. It has a Qt-based graphical user interface. It can
       record the entire screen or part of it, or record OpenGL applications directly. The recording can be paused and resumed at any  time.  Many
       different file formats and codecs are supported.

OPTIONS
       --help Show help message.

       --version
              Show version and quit.

       --logfile
              Write log to ~/.ssr/log-DATE_TIME.txt instead of stdout.

       --statsfile[=FILE]
              Write recording statistics to FILE. If FILE is omitted, /dev/shm/simplescreenrecorder-stats-PID is used. It will be updated continu‐
              ously and deleted when the recording page is closed.

       --syncdiagram
              Show synchronization diagram (for debugging).

       --no-systray
              Don't show the system tray icon.

       --start-hidden
              Start the application in hidden form.

FILE LOCATIONS
       The files used by SimpleScreenRecorder can be found in the following locations:

       Settings:
              ~/.ssr/settings.conf

       Logs:
              ~/.ssr/logs/

       Input profiles:
              /usr/share/simplescreenrecorder/input-profiles/
              ~/.ssr/input-profiles/

       Output profiles:
              /usr/share/simplescreenrecorder/output-profiles/
              ~/.ssr/output-profiles/

       Translations:
              /usr/share/simplescreenrecorder/translations/

SEE ALSO
       More documentation can be found at:
       http://www.maartenbaert.be/simplescreenrecorder/

SimpleScreenRecorder                                                March 2015                                             SIMPLESCREENRECORDER(1)
