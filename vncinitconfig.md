vncinitconfig(1)                                  VNC                                 vncinitconfig(1)

NAME
       vncinitconfig - VNC® Server setup utility

SYNOPSIS
       vncinitconfig ACTION...

DESCRIPTION
       vncinitconfig resets VNC Server to factory defaults, and performs related auxiliary operations.
       ACTIONS apply to VNC Server in all modes unless otherwise stated.

       Note that vncinitconfig -install-defaults is run automatically when VNC  Server  is  installed,
       and  numerous  files  are  created; examine the script for details. If you wish to subsequently
       edit these files, it is recommended you do so in parallel .custom files; see the header at  the
       top of each file for more information.

       Note that if you do edit the original files and subsequently run vncinitconfig, any changes are
       overridden but preserved in files with a .old suffix.

ACTIONS
       -install-defaults
              Performs all the actions below except -register-SELinux, -enable-system-xorg  and  -dis‐
              able-system-xorg,  where supported on the platform. It may be useful to perform this op‐
              eration if VNC Server or any auxiliary application or file becomes corrupted.

       -pam   Creates /etc/pam.d/vncserver or updates /etc/pam.conf, depending upon the version of PAM
              installed, to enable system authentication using PAM. By default, the pam_unix module is
              referenced to query passwords against the local database store only.

              If you wish to query passwords against a directory service such as LDAP, you must refer‐
              ence  an alternative module that provides this functionality. As a convenience, -pam ad‐
              ditionally lists PAM modules (such as pam_ldap.so) found on your system; you must  manu‐
              ally  create  /etc/pam.d/vncserver.custom or edit /etc/pam.conf to reference such a mod‐
              ule.

              Alternatively, for distributions such as Ubuntu  with  a  common  PAM  configuration  in
              /etc/pam.d/common-auth, set /etc/pam.d/vncserver.custom to:

                 @include common-auth
                 @include common-account
                 @include common-session

              For  distributions  such  as Red Hat with a common PAM configuration in /etc/pam.d/pass‐
              word-auth, set /etc/pam.d/vncserver.custom to:

                 auth     include  password-auth
                 account  include  password-auth
                 session  include  password-auth

       -xstartup
              Creates /etc/vnc/xstartup to run a default virtual desktop environment for VNC Server in
              Virtual Mode. See vncserver-virtual(1).

       -config
              Creates  /etc/vnc/config to specify default Xvnc options for VNC Server in Virtual Mode.
              See vncserver-virtual(1).

       -virtual-pulse-conf
              Creates /etc/vnc/pulse/daemon.conf which will be read by  the  PulseAudio  sound  server
              when  audio  is played from within a Virtual Mode session.  This prevents audio from the
              virtual sessions being directed to the physical speakers.

       -virtual-xorg-conf
              Creates /etc/X11/vncserver-virtual.conf to configure Xorg when  VNC  Server  in  Virtual
              Mode is used with SystemXorg enabled.

       -keygen
              Regenerates  a  private  key  for the root user. This key determines the identity of VNC
              Server in Service Mode and of the VNC Server in Virtual Mode  daemon.  Note  you  should
              ideally find out why the private key is missing or corrupt before performing this opera‐
              tion.

       -licensing
              Clears up old files related to licensing.

       -service-daemon, -virtual-daemon
              Installs an init file for the VNC Server in Service Mode or VNC Server in  Virtual  Mode
              daemon  respectively.  This  will be a SystemV-style init script or systemd unit file as
              appropriate. See vncserver-x11-serviced(1), vncserver-virtuald(1).

       -enable-print
              Registers the VNC backend with CUPS, on platforms where the VNC backend  cannot  be  in‐
              stalled directly in the CUPS directory.

       -register-SELinux
              Attempts  to  register SELinux modules that have been compiled onto the system. Required
              for the VNC Server in Service Mode and Virtual Mode daemons. Note this  command  is  not
              run as part of -install-defaults.

       -enable-system-xorg
              Enables  SystemXorg for VNC Server in Virtual Mode. Run as root to enable for all users,
              or as a normal user to enable for just that user. When SystemXorg is enabled, VNC Server
              in Virtual Mode will use your system's installed Xorg instead of Xvnc. Note this command
              is not run as part of -install-defaults.

       -disable-system-xorg
              Disables SystemXorg for VNC Server in Virtual Mode. Run  as  root  to  disable  for  all
              users,  or  as a normal user to disable for just that user. Note this command is not run
              as part of -install-defaults.

SEE ALSO
       vncserver-x11(1), vncserver-x11-serviced(1), vncserver-virtual(1), vncserver-virtuald(1)

AUTHOR
       Copyright © 2002-2018 RealVNC Ltd.

       RealVNC and VNC are trademarks of RealVNC Ltd and  are  protected  by  trademark  registrations
       and/or pending trademark applications in the European Union, United States of America and other
       jurisdictions.  Protected by UK patent 2481870; US patent 8760366; EU patent 2652951.

       https://www.realvnc.com

RealVNC Ltd                                    June 2018                              vncinitconfig(1)
