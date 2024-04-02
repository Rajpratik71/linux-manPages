safe-rm(dir)(8)                                                                            System Manager's Manual                                                                            safe-rm(dir)(8)



NAME
       safe-rm - delete files a bit more safely
       safe-rmdir - delete empty directories a bit more safely

SYNOPSIS
       safe-rm /path/to/file
       safe-rmdir /path/to/directory

DESCRIPTION
       safe-rm deletes files specified with an absolute path
              name. Files specified with symbolic links in the path name will not be erased.

       safe-rmdir deletes directories specified with an absolute
              path name. Directories specified with symbolic links in the path name will not be erased.

RETURNS
       safe-rm and safe-rmdir returns a non zero return code when it can not erase the file safely.

NOTE
       These commands are used by the system cleanup cron jobs.

SEE ALSO
       rm(1), rmdir(1).

AUTHOR
       SuSE Linux AG



                                                                                                                                                                                              safe-rm(dir)(8)
