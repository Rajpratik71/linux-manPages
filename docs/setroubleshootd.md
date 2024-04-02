setroubleshootd(8)                                                                                                                                                                         setroubleshootd(8)



NAME
       setroubleshootd - setroubleshoot daemon


SYNOPSIS
       setroubleshootd [-d] [-f] [-h] [-c config]


DESCRIPTION
       This manual page describes the setroubleshootd program.

       setroubleshootd  is  the  dbus service in the setroubleshoot system.  setroubleshoot is used to diagnose SELinux denials and attempts to provide user friendly explanations for a SELinux denial (e.g.
       AVC) and recommendations for how one might adjust the system to prevent the denial in the future.

       In a standard configuration setroubleshoot is composed of two components, sealert and setroubleshootd.

       setroubleshootd is a system daemon which runs under setroubleshoot user and listens for audit events emitted from the kernel related to SELinux. When the setroubleshootd daemon sees an  SELinux  AVC
       denial  it  runs  a  series  of  analysis  plugins which examines the audit data related to the AVC. It records the results of the analysis and signals any clients which have attached to the setrou‐
       bleshootd daemon that a new alert has been seen.


OPTIONS
       -f --nofork
              Do not fork the daemon

       -d --debug
              Do not exit after 10 seconds

       -h --help
              Show this message

       -c --config
              section.option=value     set a configuration value


AUTHOR
       This man page was written by Dan Walsh <dwalsh@redhat.com>.


SEE ALSO
       sealert(8),selinux(8)



                                                                                                   20100520                                                                                setroubleshootd(8)
