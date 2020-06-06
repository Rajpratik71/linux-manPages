LOGSAVE(8)                                                                               System Manager's Manual                                                                               LOGSAVE(8)

NAME
       logsave - save the output of a command in a logfile

SYNOPSIS
       logsave [ -asv ] logfile cmd_prog [ ... ]

DESCRIPTION
       The  logsave program will execute cmd_prog with the specified argument(s), and save a copy of its output to logfile.  If the containing directory for logfile does not exist, logsave will accumu‐
       late the output in memory until it can be written out.  A copy of the output will also be written to standard output.

       If cmd_prog is a single hyphen ('-'), then instead of executing a program, logsave will take its input from standard input and save it in logfile

       logsave is useful for saving the output of initial boot scripts until the /var partition is mounted, so the output can be written to /var/log.

OPTIONS
       -a     This option will cause the output to be appended to logfile, instead of replacing its current contents.

       -s     This option will cause logsave to skip writing to the log file text which is bracketed with a control-A (ASCII 001 or Start of Header) and control-B (ASCII 002 or Start  of  Text).   This
              allows progress bar information to be visible to the user on the console, while not being written to the log file.

       -v     This option will make logsave to be more verbose in its output to the user.

AUTHOR
       Theodore Ts'o (tytso@mit.edu)

SEE ALSO
       fsck(8)

E2fsprogs version 1.42.13                                                                        May 2015                                                                                      LOGSAVE(8)
