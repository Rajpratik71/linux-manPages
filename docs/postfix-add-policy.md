POSTFIX-ADD-POLICY(8)                                         System Manager's Manual                                        POSTFIX-ADD-POLICY(8)

NAME
       postfix-add-policy - add policy service to Postfix master.cf

SYNOPSIS
       postfix-add-policy [policy name...] [username...] [argv...]

DESCRIPTION
       The  postfix-add-policy(8)  command  adds  an  smtp  policy server named policy name running using username and called as argv to etc/post‐
       fix/master.cf to facilitate integration of SMTP policy servers such as postgrey or postfix-policyd-spf-perl.  The configuration is based on
       the Postfix SMTPD_POLICY_README.  Adminstrators should verify it is appropriate for their requirements.

       The original file is copied prior to modification and left in /etc/postfix to make it possible to revert changes easily.

       Available in the Debian package for Postfix version 2.5.3 and later.

DIAGNOSTICS
       If the given policy name  already appears in the master.cf, a message will be printed to standard out and master.cf will not be modified.

ENVIRONMENT
       MAIL_CONFIG
              Directory with Postfix configuration files.

              The  postfix-add-policy(8)  command  should  use  this, but it currently doesn't.  It is hard coded to /etc/postfix.  This should be
              changed.

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

                                                                                                                             POSTFIX-ADD-POLICY(8)
