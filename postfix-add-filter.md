POSTFIX-ADD-FILTER(8)                   System Manager's Manual                  POSTFIX-ADD-FILTER(8)

NAME
       postfix-add-filter - add filter service to Postfix master.cf

SYNOPSIS
       postfix-add-filter [smtp service name...] [smtpd port...]

DESCRIPTION
       The  postfix-add-filter(8)  command  adds an smtp service named smtp service name and and smtpd
       server listening on smtpd port to etc/postfix/master.cf to facilitate integration of SMTP  fil‐
       ters  such  as amavisd-new or clamsmtp.  The configuration is based on the upstream recommenda‐
       tions for amavisd-new 2.6.0.  Adminstrators should verify it is appropriate for their  require‐
       ments.

       The  original file is copied prior to modification and left in /etc/postfix to make it possible
       to revert changes easily.

       Available in the Debian package for Postfix version 2.5.3 and later.

DIAGNOSTICS
       If the given smtp service name or smtpd port already appear in the master.cf, a message will be
       printed to standard out and master.cf will not be modified.

ENVIRONMENT
       MAIL_CONFIG
              Directory with Postfix configuration files.

              The postfix-add-filter(8) command should use this, but it currently doesn't.  It is hard
              coded to /etc/postfix.  This should be changed.

CONFIGURATION PARAMETERS
       None

FILES
       /etc/postfix/master.cf

SEE ALSO
       postconf(5), Postfix configuration

LICENSE
       This software is licensed under the MIT open source license.

AUTHOR(S)
       Scott Kitterman
       <scott@kitterman.com>

                                                                                 POSTFIX-ADD-FILTER(8)
