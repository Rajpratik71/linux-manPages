AMDUMP_CLIENT(8)                                                                        System Administration Commands                                                                       AMDUMP_CLIENT(8)



NAME
       amdump_client - back up all disks in an Amanda configuration

SYNOPSIS
       amdump_client [-o configoption...] [--config config] CMD [diskname...]

DESCRIPTION
       Amdump_client initiate backup on the client. There are three commands (CMD):

       list
           list all diskname that can be dumped.

       check
           Check the configuration of the client and disk.

       dump
           Start a backup of the specified diskname, or all diskname if none are specified.

SEE ALSO
       amanda(8), amdump(8), amanda-match(7)

       The Amanda Wiki: : http://wiki.zmanda.com/

AUTHOR
       Jean-Louis Martineau <martineau@zmanda.com>
           Zmanda, Inc. (http://www.zmanda.com)



Amanda 3.3.3                                                                                      01/10/2013                                                                                 AMDUMP_CLIENT(8)
