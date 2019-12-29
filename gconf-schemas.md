GCONF-SCHEMAS(8)                            [FIXME: manual]                           GCONF-SCHEMAS(8)

NAME
       gconf-schemas - register gconf schemas with the gconf database

SYNOPSIS
       gconf-schemas [--register|unregister|register-all] [schema1] [schema2] [...]

DESCRIPTION
       This manual page documents briefly the gconf-schemas command.

       gconf-schemas is used to register gconf schemas with the gconf database.

OPTIONS
       --register
           register schemas to the GConf database

       --unregister
           unregister schemas from the GConf database

       --register-all
           clean up the GConf database and register all schemas again. This might be neccessary if
           your gconf database becomes corrupted.

       --no-signal
           do not send SIGHUP to the running gconfd-2 processes.

AUTHOR
       This manual page was written by Patrick Schoenfeld <schoenfeld@in-medias-res.com> for the
       Debian(TM) system (but may be used by others). Permission is granted to copy, distribute and/or
       modify this document under the terms of the GNU General Public License, Version 2 any later
       version published by the Free Software Foundation.

       On Debian systems, the complete text of the GNU General Public License can be found in
       /usr/share/common-licenses/GPL.

COPYRIGHT
       Copyright © 2007 Patrick Schoenfeld

[FIXME: source]                              November 2007                            GCONF-SCHEMAS(8)
