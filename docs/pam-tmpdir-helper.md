PAM-TMPDIR-HELPER(8)                                                pam-tmpdir                                                PAM-TMPDIR-HELPER(8)

NAME
       pam-tmpdir-helper - create safe temporary directory

SYNOPSIS
       <not invoked manually>

DESCRIPTION
       A  helper  binary for the pam_tmpdir module, pam-tmpdir-helper is invoked to create a secure temporary directory for the invoking user.  It
       is quite simple and is called on behalf on the user by the session component of the pam_tmpdir module.  It is not harmful  to  call  it  by
       hand, but will not give out any diagnostics, nor error messages, apart from its return value.  It logs to syslog.

USAGE
       This  program  is  not  intended to be called directly by users and will log to syslog if it is called improperly (i.e., by some one trying
       exploit it).

COPYRIGHT
       Copyright © 2002-2012 Tollef Fog Heen <tfheen@err.no>.
       This is free software; see the source for copying conditions.  There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICU‐
       LAR PURPOSE.

PAM-TMPDIR 0.04                                                     Jun 25 2002                                               PAM-TMPDIR-HELPER(8)
