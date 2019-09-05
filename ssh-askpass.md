GNOME-SSH-ASKPASS(1)                                          General Commands Manual                                         GNOME-SSH-ASKPASS(1)

NAME
       gnome-ssh-askpass - prompts a user for a passphrase using GNOME

SYNOPSIS
       gnome-ssh-askpass

DESCRIPTION
       gnome-ssh-askpass  is  a GNOME-based passphrase dialog for use with OpenSSH.  It is intended to be called by the ssh-add(1) program and not
       invoked directly.  It allows ssh-add(1) to obtain a passphrase from a user, even if not connected to a terminal (assuming that an X display
       is  available).  This happens automatically in the case where ssh-add is invoked from one's ~/.xsession or as one of the GNOME startup pro‐
       grams, for example.

       In order to be called automatically by ssh-add, gnome-ssh-askpass should be installed as /usr/bin/ssh-askpass.

ENVIRONMENT VARIABLES
       The following environment variables are recognized:

       GNOME_SSH_ASKPASS_GRAB_SERVER
              Causes gnome-ssh-askpass to grab the X server before asking for a passphrase.

       GNOME_SSH_ASKPASS_GRAB_POINTER
              Causes gnome-ssh-askpass to grab the mouse pointer using gdk_pointer_grab() before asking for a passphrase.

       Regardless of whether either of these environment variables is set, gnome-ssh-askpass will grab the keyboard using gdk_keyboard_grab().

AUTHOR
       This manual page was written by Colin Watson <cjwatson@debian.org> for the Debian system (but may be used by others).  It was based on that
       for x11-ssh-askpass by Philip Hands.

                                                                                                                              GNOME-SSH-ASKPASS(1)
