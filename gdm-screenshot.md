GDM3.8(1)                                                                                  Debian GNU/Linux                                                                                  GDM3.8(1)

NAME
       gdm3 - GNOME Display Manager

SYNOPSIS
       gdm3

DESCRIPTION
       gdm3 is the equivalent of xdm(1x) or wdm(1x), but uses the GNOME libraries to provide a GNOME look-and-feel. It provides the GNOME equivalent of a "login:" prompt.

       gdm3 reads /etc/gdm3/custom.conf for its configuration. For each local display, gdm starts an X server and runs a minimal GNOME session including a graphical greeter. If configured so, the
       main gdm process also listens for XDMCP requests from remote displays. These requests can either be direct, causing gdm3 to start a session on the remote display, or indirect, causing a
       chooser to be opened.

       When managing a display, gdm3 attempts to execute /etc/gdm3/Init/display, or /etc/gdm3/Init/Default if that does not exist. When a user logs in, gdm3 first attempts
       /etc/gdm3/PreSession/display (or /etc/gdm3/PreSession/Default), and then one of the sessions defined in /usr/share/xsessions. When the session has completed, gdm attempts to run
       /etc/gdm3/PostSession/display, or /etc/gdm3/PostSession/Default.

       gdm3 maintains information about the displays it is managing in /var/lib/gdm3. This includes xauth information, so this directory is not readable to normal users.

       gdm3 uses PAM to perform authentication using the config file /etc/pam.d/gdm3.

ENVIRONMENT
       XAUTHORITY
           Upon session startup, GDM sets the XAUTHORITY environment variable to a session-specific file in /var/run/gdm3.

           Applications and scripts that assume this file is set to ~/.Xauthority will not work. To access the display you need both DISPLAY and XAUTHORITY variables.

AUTHOR
       Martin Kasper Petersen <mkp@SunSITE.auc.dk>

       This manual page written by Steve Haslam <araqnid@debian.org> for Debian GNU/Linux. Updated by Raphaeel Hertzog <hertzog@debian.org>, Ryan Murray <rmurray@debian.org>, Josselin Mouette
       <joss@debian.org> and Vincent Lefevre <vincent@vinc17.net>.

GNOME                                                                                         2018-10-09                                                                                     GDM3.8(1)
