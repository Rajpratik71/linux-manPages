AUTOFS(8)                                                                                  System Manager's Manual                                                                                  AUTOFS(8)



NAME
       /etc/init.d/autofs - Control Script for automounter

SYNOPSIS
       /etc/init.d/autofs start|stop|restart|reload|status

DESCRIPTION
       autofs  controls  the  operation  of  the  automount(8) daemons running on the Linux system. Usually autofs is invoked at system boot time with the start parameter and at shutdown time with the stop
       parameter. The autofs script can also be manually invoked by the system administrator to shut down, restart or reload the automounters.

OPERATION
       autofs will consult a configuration file /etc/auto.master (see auto.master(5)) by default to find mount points on the system. For each of those mount points  automount(8)  will  mount  and  start  a
       thread, with the appropriate parameters, to manage the mount point.

       /etc/init.d/autofs reload will check the current auto.master map against running daemons. It will kill those daemons whose entries have changed and then start daemons for new or changed entries.

       If a map is modified then the change will become effective immediately. If the auto.master map is modified then the autofs script must be rerun to activate the changes.

       /etc/init.d/autofs status will display the status of, automount(8) ,running or not.

SEE ALSO
       automount(8), autofs(5), auto.master(5).  autofs_ldap_auth.conf(5)

AUTHOR
       This manual page was written by Christoph Lameter <chris@waterf.org>, for the Debi GNU/Linux system.  Edited by H. Peter Anvin <hpa@transmeta.com>.



                                                                                                  9 Sep 1997                                                                                        AUTOFS(8)
