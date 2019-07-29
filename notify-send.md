USAGE:(1)                       User Commands                       USAGE:(1)

NAME
       notify-send - a program to send desktop notifications

SYNOPSIS
       notify-send [OPTIONS] <summary> [body]

DESCRIPTION
       With  notify-send you can send desktop notifications to the user via a
       notification daemon from the command line.  These notifications can be
       used  to inform the user about an event or display some form of infor‐
       mation without getting in the user's way.

OPTIONS
       -u, --urgency=LEVEL Specifies the urgency level (low,  normal,  criti‐
       cal).

       -t, --expire-time=TIME
              The  duration,  in milliseconds, for the notification to appear
              on screen.  (Ubuntu's Notify OSD and GNOME  Shell  both  ignore
              this parameter.)

       -i, --icon=ICON[,ICON...]
              Specifies an icon filename or stock icon to display.

       -c, --category=TYPE[,TYPE...]
              Specifies the notification category.

          Help options:

       -?, --help
              Show this help message

       -h, --hint=TYPE:NAME:VALUE
              Specifies  basic  extra data to pass. Valid types are int, dou‐
              ble, string and byte.

       SEE ALSO
              The   Desktop   Notification   Spec    on    http://www.galago-
              project.org/specs/notification/.

AUTHOR
       This  manual  page  was  written  by  Andre Filipe de Assuncao e Brito
       <decko@noisemakers.org> and Paul van Tilburg  <paulvt@debian.org>  and
       Riccardo Setti <giskard@debian.org> for the Debian project (but may be
       used by others).

notify-send 0.2.2               November 2005                       USAGE:(1)
