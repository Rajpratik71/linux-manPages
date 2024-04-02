google-drive-ocamlfuse(1)                                     General Commands Manual                                    google-drive-ocamlfuse(1)

NAME
       google-drive-ocamlfuse - FUSE filesystem over Google Drive

SYNOPSIS
       google-drive-ocamlfuse [options][*mountpoint*]

DESCRIPTION
       This program is a FUSE filesystem backed by Google Drive, written in OCaml.  It lets you mount your Google Drive on Linux.

       The first time, you can run google-drive-ocamlfuse without parameters:

                  google-drive-ocamlfuse

       This  command  will  create  the  default application directory (~/.gdfuse/default), containing the configuration file config.  And it will
       start a web browser to obtain authorization to access your Google Drive.  This will let you modify default  configuration  before  mounting
       the filesystem.

       Then you can mount the filesystem:

                  google-drive-ocamlfuse mountpoint

       If you have more than one account, you can run:

                  google-drive-ocamlfuse -label label [mountpoint]

       Using  label  to  distinguish  different  accounts.   The program will use the directory ~/.gdfuse/label to host configuration, application
       state, and file cache.  No file is shared among different accounts, so you can have a different configuration for each one.

       To get a complete list of options, run google-drive-ocamlfuse -help.

TROUBLESHOOTING
       This application is still under testing, so there are probably bugs to discover and fix.  To be extra sure, if you want, you can mount  the
       filesystem  in  read-only mode, modifying the configuration (see the documentation), to avoid any write attempt to the server.  Anyway, the
       rm command will simply trash your file, so you should always be able to rollback any changes.  If you have problems, you can turn on  debug
       logging:

                  google-drive-ocamlfuse -debug mountpoint

       In  ~/.gdfuse/default you can find curl.log that will track every request to the Google Drive API, and gdfuse.log that will log FUSE opera‐
       tions and cache management.  If something goes wrong, you can try clearing the cache, with this command:

                  google-drive-ocamlfuse -cc

       If something still doesn't work, try starting from scratch removing everything in ~/.gdfuse/default.  In this case you will need  to  reau‐
       thorize the application.

       Note  that  in  order  to reduce latency, the application will query the server and check for changes only every 60 seconds (configurable).
       So, if you make a change to your documents (server side), you won't see it immediately in the mounted filesystem.

       Note also that, at least for now, Google Documents will be exported read-only.

FILES
       ~/.gdfuse/default/config The configuration file

SEE ALSO
       google-drive-ocamlfuse online documentation may be found here: <https://github.com/astrada/google-drive-ocamlfuse/wiki>.

       The google-drive-ocamlfuse source code may be downloaded from <https://github.com/astrada/google-drive-ocamlfuse>.

AUTHORS
       Alessandro Strada.

google-drive-ocamlfuse manpage                                     Sept 7, 2013                                          google-drive-ocamlfuse(1)
