REGED(8)                                                      System Manager's Manual                                                     REGED(8)

NAME
       reged - utility to export/import and edit a Windows registry hives

SYNOPSIS
       reged [options] -x<registryhivefile><prefixstring><key><output.reg>

       reged [options] -I<registryhivefile><prefixstring><input.reg>

       reged [options] -e<registryhivefile>

DESCRIPTION
       This  manual  page documents briefly the reged command.  This manual page was written for the Debian distribution because the original pro‐
       gram does not have a manual page.

       reged is the an interactive command line utility that can be used to export, import or edit a Microsoft Windows registry hive.

OPTIONS
       -h     Show summary of options.

       -x <registryhivefile> <prefixstring> <key> <output.reg>
              Export parts of a hive file to a text registry (.reg)  file.  Prefixstring indicates the part of the  registry  hive  to  dump  (for
              example HKEY_LOCAL_MACHINE\SOFTWARE). The <key> parameter defines the key to dump (recursively). You can use \ or \\ to list all the
              keys in the hive file.

              Only one hive file and one .reg file can be defined.

       -I <registryhivefile> <prefixstring> <input.reg>
              Import the content of the input.reg file into the registry file.  The value <prefixstring> can be any valid prefix, for  example  is
              HKEY_LOCAL_MACHINE\SOFTWARE.

              Only one .reg and one hive file supported at the same time

       -e <registryhive> ...
              Interactive edit one or more registry files.

       -L     Log  all  changed  filenames  to /tmp/changed. When this option is set the program automatically saves the changes in the hive files
              without prompting the user.

              Be careful when using the -L option as a root user in a multiuser system.  The filename is fixed and this can be used  by  malicious
              users (dropping a symlink with the same name) to overwrite system files.

       -C     Automatically save all changes. Do not prompt the user.

       -N     Do not allocate more information, only allow the editing of existing values with same size.

       -E     Do not expand the hive file (safe mode).

       -t     Print debug information of allocated blocks.

       -v     Print verbose information and debug messages.

KNOWN BUGS
       There are many unknown bugs. If you find bugs please report them to the author.

SEE ALSO
       chntpwd, samusrgrp, sampasswd
       You  will  find   more  information  available  on  how  this  program  works,  in  the  text  files  /usr/share/doc/chntpw/README.txt  and
       /usr/share/doc/chntpw/MANUAL.txt

AUTHOR
       This program was written by Petter N Hagen.

       This manual page was written by Javier Fernandez-Sanguino <jfs@debian.org>, for the Debian GNU/Linux system (but may be used by others).

                                                                  6th August 2014                                                         REGED(8)
