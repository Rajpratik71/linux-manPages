GNUNET-DOWNLOAD-MANAGER(1)             General Commands Manual             GNUNET-DOWNLOAD-MANAGER(1)

NAME
       gnunet-download-manager - manage downloads across sessions

SYNOPSIS
       gnunet-download-manager [options]

DESCRIPTION
       gnunet-download-manager is a script that can be used to track download sessions.  It makes the
       process of resuming downloads after a system reboot easier.  A typical use  is  to  define  an
       alias (depending on your shell) of the form

       $ alias gnunet-download='gnunet-download-manager.scm download'

       Other  commands  for the download manager include resume (resumes all downloads), status (show
       status of pending downloads), killall (abort all downloads), settings (for configuration)  and
       help (print help text).

       gnunet-download-manager is a scheme script and will only work if guile is available.

BUGS
       Report  bugs  by  using  mantis  <https://gnunet.org/bugs/>  or  by sending electronic mail to
       <gnunet-developers@gnu.org>

SEE ALSO
       gnunet-download(1)

GNUnet                                       15 Jan, 2011                  GNUNET-DOWNLOAD-MANAGER(1)
