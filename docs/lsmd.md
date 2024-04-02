LSMD(1)                                                                                 libStorageMgmt plug-in daemon                                                                                 LSMD(1)



NAME
       Daemon - lsmd

DESCRIPTION
       libStorageMgmt plug-in daemon.  Plug-ins execute in their own process space for fault isolation and to accommodate different plug-in licensing requirements.  Runs as an unprivileged user.


OPTIONS
       --plugindir = The directory where the plugins are located

       --socketdir = The directory for IPC sockets

       --confdir = The directory where the config file are located

       -v = Verbose logging

       -d     = New style daemon (systemd) non-forking



BUGS
       Please report bugs to <libstoragemgmt-devel@lists.fedorahosted.org>

AUTHOR
       Tony Asleson <tasleson@redhat.com>




lsmd 1.7.3                                                                                        March 2013                                                                                          LSMD(1)
