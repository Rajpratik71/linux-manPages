multilog(8)                                                   System Manager's Manual                                                  multilog(8)

NAME
       multilog - reads a sequence of lines from stdin and appends selected lines to any number of logs.

SYNOPSIS
       multilog script

DESCRIPTION
       script  consists  of  any  number  of  arguments. Each argument specifies one action. The actions are carried out in order for each line of
       input. Note that actions may contain shell metacharacters that need to be quoted when multilog is run from a shell.

       multilog exits 0 when it sees the end of stdin. If stdin has a partial final line then multilog inserts a final newline.

       multilog writes a message to stderr and exits 111, without reading any input, if it runs out of memory or if another  multilog  process  is
       writing to one of the same automatically rotated logs.

       If multilog has trouble writing to disk after it starts reading input, it writes a message to stderr, pauses, and tries again, without los‐
       ing any data. Note that this may block any program feeding input to multilog.

       If multilog receives a TERM signal, it will read and process data until the next newline, and then exit, leaving stdin at the first byte of
       data it has not processed.

SELECTING LINES
       Each line is initially selected. The action

       -pattern
              deselects the line if pattern matches the line. The action

       +pattern
              selects the line if pattern matches the line.

       pattern  is  a  string  of  stars and non-stars. It matches any concatenation of strings matched by all the stars and non-stars in the same
       order. A non-star matches itself. A star before the end of pattern matches any string that does not include the next character in  pattern.
       A star at the end of pattern matches any string.

       For example, the action

         +hello

       selects hello. It does not select hello world.

       The action

         -named[*]: Cleaned cache *

       deselects named[135]: Cleaned cache of 3121 RRs. The first star matches any string that does not include a right bracket.

       The action

         -*

       deselects every line.

       To save memory, multilog actually checks pattern against only the first 1000 characters of each line.

ALERTS
       The action

       e      prints (the first 200 bytes of) each selected line to stderr.

STATUS FILES
       The action

       =file  replaces  the  contents  of  file with (the first 1000 bytes of) each selected line, padded with newlines to 1001 bytes. There is no
              protection of file against power outages.

              For example, the sequence of actions

                   -*
                   +STAT*
                   =log/status

              maintains log/status as a copy of the most recent line starting with STAT.

TIMESTAMPING
       The action

       t      inserts an @, a precise timestamp, and a space in front of each line, using the same format as tai64n(8).  This is  required  to  be
              the first action.

       Patterns apply to the line after the timestamp is inserted. For example, if

         multilog t '-*' '+* fatal: *' ./main

       reads the line

         fatal: out of memory

       then it will log a line such as

         @400000003b4a39c23294b13c fatal: out of memory

       with the first * matching the timestamp.

       You can use tai64nlocal(8) to convert these timestamps to human-readable form.

AUTOMATICALLY ROTATED LOGS
       If dir starts with a dot or slash then the action

       dir    appends each selected line to a log named dir.  If dir does not exist, multilog creates it.

              Do not attempt to write to one log from two simultaneous multilog processes, or two actions in one process.

              The log format is as follows.  dir is a directory containing some number of old log files, a log file named current, and other files
              for multilog to keep track of its actions. Each old log file has a name beginning with @, continuing with a precise timestamp  show‐
              ing when the file was finished, and ending with one of the following codes:

       .s     This file is completely processed and safely written to disk.

       .u     This file was being created at the moment of an outage. It may have been truncated and has not been processed.

              Beware  that  NFS,  async  filesystems, and softupdates filesystems may discard files that were not safely written to disk before an
              outage.

              While multilog is running, current has mode 644. If multilog sees the end of stdin, it writes current safely to disk, and  sets  the
              mode of current to 744. When it restarts, it sets the mode of current back to 644 and continues writing new lines.

              When  multilog  decides  that  current is big enough, it writes current safely to disk, sets the mode of current to 744, and renames
              current as an old log file. The action

       ssize  sets the maximum file size for subsequent dir actions.  multilog will decide that current is big enough if current has  size  bytes.
              (multilog  will  also decide that current is big enough if it sees a newline within 2000 bytes of the maximum file size; it tries to
              finish log files at line boundaries.)  size must be between 4096 and 16777215. The default maximum file size is 99999.

              In versions 0.75 and above: If multilog receives an ALRM signal, it immediately decides that current is big enough,  if  current  is
              nonempty.  The action

       nnum   sets  the  number  of  log  files for subsequent dir actions. After renaming current, if multilog sees num or more old log files, it
              removes the old log file with the smallest timestamp.  num must be at least 2. The default number of log files is 10. The action

       !processor
              sets a processor for subsequent dir actions.  multilog will feed current through processor and save the output as an  old  log  file
              instead  of  current.   multilog  will  also save any output that processor writes to descriptor 5, and make that output readable on
              descriptor 4 when it runs processor on the next log file. For reliability, processor must exit nonzero if it has any trouble  creat‐
              ing its output; multilog will then run it again. Note that running processor may block any program feeding input to multilog.

SEE ALSO
       supervise(8),  svc(8),  svok(8),  svstat(8), svscanboot(8), svscan(8), readproctitle(8), fghack(8), pgrphack(8), tai64n(8), tai64nlocal(8),
       setuidgid(8), envuidgid(8), envdir(8), softlimit(8), setlock(8)

       http://cr.yp.to/daemontools.html

                                                                                                                                       multilog(8)
