vncpasswd(1)                                                            VNC                                                           vncpasswd(1)

NAME
       vncpasswd - VNC® Server password utility

SYNOPSIS
       vncpasswd [OPTION...] MODE

DESCRIPTION
       vncpasswd  manages  password(s)  when the VNC password authentication scheme is chosen for VNC Server. It is an alternative to specifying a
       new, or changing an existing, password via the VNC Server user interface. Note vncpasswd is not relevant when VNC Server is set to use  the
       system authentication or single sign-on (SSO) schemes.

MODES
       Run vncpasswd with one of the following flags to specify a password of at least six case-sensitive alphanumeric characters for a particular
       VNC Server mode and user. The password chosen is DES-encoded and stored as the value of the Password parameter in the specified  configura‐
       tion file:

       -service
              VNC Server in Service Mode. Note elevated privileges are required.  The password is stored for the root user only in /root/.vnc/con‐
              fig.d/vncserver-x11.

       -user  VNC Server in User Mode. The password is stored for the current user only in $HOME/.vnc/config.d/vncserver-x11.

       -virtual
              VNC Server in Virtual Mode. The password is stored for the current user only in $HOME/.vnc/config.d/Xvnc.

       Run vncpasswd -file FILE to nominate a different configuration file. Depending on the file chosen,  this  might  apply  the  password  sys‐
       tem-wide  (across  all  VNC  Server  modes,  or  for all users), or lock VNC Server down using policy (so the password cannot be changed by
       users). For example, nominate:

       · /etc/vnc/config.d/Xvnc to apply the password to VNC Server in Virtual Mode for all users.

       · /etc/vnc/config.d/common.custom to apply the password across all VNC Server modes, for all users.

       · /etc/vnc/policy.d/common to apply the password across all VNC Server modes, for all users, and lock VNC Server down.

       For a full list of available configuration files, visit https://www.realvnc.com/docs/configure-vnc.html#configure-vnc-files

       Run vncpasswd -print to not specify a password but rather print it to the console in the correct obfuscated format for  manual  entry  into
       configuration files or policy template files.

OPTIONS
       If  you  have a Professional or Enterprise subscription, run vncpasswd -type TYPE to specify a password for a non-standard user, where TYPE
       is either:

       · AdminPassword to specify a password for an administrative user able to bypass accept/reject prompts.

       · ViewOnlyPassword to specify a password for a basic user able to observe but not interact.

       · InputOnlyPassword to specify a password for a basic user able to interact but not observe.

       · GuestPassword to specify a password for a guest user able to interact and observe once approval to connect  has  been  acquired  from  an
         already-connected user.

       This is not recommended, but if you wish to specify a password of less than 6 characters, run vncpasswd -weakpwd.

SEE ALSO
       vncserver-x11(1), vncserver-x11-serviced(1), vncserver-virtual(1), vncserver-virtuald(1), vncviewer(1)

AUTHOR
       Copyright © 2002-2018 RealVNC Ltd.

       RealVNC  and  VNC  are  trademarks of RealVNC Ltd and are protected by trademark registrations and/or pending trademark applications in the
       European Union, United States of America and other jurisdictions.  Protected by UK patent 2481870; US patent 8760366; EU patent 2652951.

       https://www.realvnc.com

RealVNC Ltd                                                          June 2018                                                        vncpasswd(1)
