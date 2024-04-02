VITMP(1)                                                                                   General Commands Manual                                                                                   VITMP(1)



NAME
       vitmp - edit temporary files

SYNOPSIS
       vitmp [VIM options] FILE...

DESCRIPTION
       vitmp  is  a  wrapper  around  the  VIM editor which may be used to invoke the editor in a way that is guaranteed to be suitable for editing temporary files used with programs such as crontab(1) and
       edquota(8).  The instance of the editor that is invoked is /bin/vi.

       In particular, it is guaranteed that the file, if edited, will be overwritten in place such that the modified contents may be read back via a previously obtained file descriptor.  Invoking the  edi-
       tor via vitmp also makes sure that no additional editor temporary files are used.

       Please note that vitmp offers no crash recovery capabilities.  If the editor crashes during the overwrite, data may be lost.

HISTORY
       vitmp first appeared in Openwall GNU/*/Linux 1.0.

AUTHORS
       Solar Designer <solar@owl.openwall.com>

SEE ALSO
       crontab(1), vi(1), vim(1), edquota(8)



Openwall Project                                                                                25 April 2002                                                                                        VITMP(1)
