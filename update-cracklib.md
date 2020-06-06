update-cracklib(8)                                                                       System Manager's Manual                                                                       update-cracklib(8)

NAME
       update-cracklib - Regenerate cracklib dictionary

SYNOPSIS
       update-cracklib

DESCRIPTION
       update-cracklib  builds  a  compressed and accumulated version of wordlists stored in the directories given in cracklib's configuration file /etc/cracklib/cracklib.conf. Programs using cracklib2
       need this database to be of any use.

       By default this script is called by cron every day.

RESULT
       update-cracklib prints out two numbers: the number of words read from the ASCII dictionaries and the number of words eventually written into the cracklib database; if no  error  occurred,  these
       should be equal.

       0 is returned on success, otherwise an error message is printed to standard error and -1 is returned.

FILES
       /etc/cracklib/cracklib.conf
              shell script that sets cracklib_dictpath_src which must be a space separated list of source dictionary files.

SEE ALSO
       cracklib(3), crack_mkdict(8)

AUTHOR
       This program and manual page was written by Martin Pitt <martin@piware.de> for the Debian GNU/Linux System (but may be used by others).

Martin Pitt                                                                                   June 09, 2003                                                                            update-cracklib(8)
