checkrestart(1)                                                   debian-goodies                                                   checkrestart(1)

NAME
       checkrestart - check which processes need to be restarted after an upgrade

SYNOPSIS
       checkrestart [ -hvpan ] [ -b blacklist_file ] [ -i package_name ] [ -e pid ]

DESCRIPTION
       The  checkrestart program tries to determine if there are processes in the system that need to be restarted after a system upgrade. This is
       necessary since an upgrade will usually bring new system libraries and running processes will be  still  using  the  old  versions  of  the
       libraries.  In  stable Debian GNU/Linux systems this is typically needed to eliminate a system exposure to a vulnerability which might have
       been fixed by upgrading a library which that process makes use of.

       Consequently, checkrestart is sometimes used as an audit tool to find outdated versions of libraries in use,  particularly  after  security
       upgrades. Administrators should not, however, rely on its output completely (see BUGS below).

       This script needs to run as root in order to obtain the information it needs for analysis.

OPTIONS
       -h,  --help
              Show the program help and exit.

       -v, --verbose
              Generate  detailed  output.  This  output includes the list of all processes found using deleted files or descriptors as well as the
              deleted files and descriptors found.

       -p, --package
              Only process deleted files that belong to a package, ignoring deleted files which do not have an associated package in  the  package
              system.

       -a, --all
              Process  all  deleted  files  regardless  of  location. This makes the program analyse deleted files even if they would be discarded
              because they are located in locations, such as /tmp , which are known to produce false positives. It  will  take  preceded  if  used
              simultaneously with the -p option.

       -b file, --blacklist=file
              Read  a  blacklist  of regular expressions from file.  Any files matching the patterns will be ignored. More than one pattern can be
              provided by using this option more than once.

       -i name, --ignore=name
              Ignore services that are associated to the package name provided in name.  More than one package  can  be  provided  by  using  this
              option more than once.

       -e pid, --excludepid=pid
              Exclude  processes  running  with  pid when looking for open files. This can speed up checkrestart on systems with a large number of
              open files. Note: this option only works if lsof(8) is not used.  More than one process identifier can be  provided  by  using  this
              option more than once.

       -n, --nolsof
              Do  not  use  lsof(8) even if available. In some systems where there are large number of files the use of lsof might be inefficient.
              Use this option to disable lsof. Notice also that if lsof is not installed an alternative mechanism to extract deleted files will be
              used instead. Consequently, there is no need to set this option in systems that do not have lsof(8) installed.

EXIT STATUS
       The program will exit with error (1) if a non-root user tries to run it. Otherwise, it will always exit with error status 0.

EXAMPLE
       Start it as user root without parameters:

         # checkrestart
         Found 20 processes using old versions of upgraded files
         (15 distinct programs)
         (14 distinct packages)

         Of these, 12 seem to contain init scripts which can be used to restart them:
         The following packages seem to have init scripts that could be used to restart them:
         gpm:
                 3044    /usr/sbin/gpm
         rpcbind:
                 2208    /sbin/rpcbind
         bind9:
                 8463    /usr/sbin/named
         openssh-server:
                 22124   /usr/sbin/sshd
         ntp:
                 4078    /usr/sbin/ntpd
         tftpd-hpa:
                 3417    /usr/sbin/in.tftpd
         uptimed:
                 2704    /usr/sbin/uptimed
         cron:
                 3019    /usr/sbin/cron
         postfix:
                 22145   /usr/lib/postfix/qmgr
                 8892    /usr/lib/postfix/master
         hddtemp:
                 3174    /usr/sbin/hddtemp
         autofs:
                 2792    /usr/sbin/automount
         openbsd-inetd:
                 3254    /usr/sbin/inetd

         These are the init scripts:
         service gpm restart
         service rpcbind restart
         service bind9 restart
         service ssh restart
         service ntp restart
         service tftpd-hpa restart
         service uptimed restart
         service cron restart
         service postfix restart
         service hddtemp restart
         service autofs restart
         service openbsd-inetd restart

         These processes do not seem to have an associated init script to restart them:
         isc-dhcp-client:
                 3775    /sbin/dhclient

BUGS
       This  program might fail if the output of the lsof(8) utility changes since it depends on it to detect which deleted files are used by pro‐
       cesses. It might also output some false positives depending on the processes' behaviour since it does not check yet if the (deleted)  files
       in use are really libraries.

       If you find a false positive in checkrestart please provide the following information when submitting a bug report:

       —      The output of checkrestart using the -v (verbose) option.

       —      The output of running the following command as root:

               lsof | egrep 'delete|DEL|path inode'

       checkrestart is also sensitive to the kernel version in use. And might fail to work with newer (or older) versions.

SEE ALSO
       lsof(8), needrestart(8)

       Please  note  that  the  needrestart program uses a different logic to determine which services should be restarted based on deleted files.
       Results might not be exactly the same as those provided by checkrestart

AUTHOR
       checkrestart was written by Matt Zimmerman for the Debian GNU/Linux distribution. It was later improved by Javier  Fernandez-Sanguino  with
       contributions from many different users and developers of the Debian GNU/Linux distribution.

COPYRIGHT AND LICENCE
       Copyright (C) 2001 Matt Zimmerman <mdz@debian.org>
       Copyright (C) 2007,2010-2015 Javier Fernandez-Sanguino <jfs@debian.org>

       This  program  is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by
       the Free Software Foundation; either version 2, or (at your option) any later version.

       On Debian systems, a copy of the GNU General Public License version 2 can be found in /usr/share/common-licenses/GPL-2.

debian-goodies                                                   December 19 2006                                                  checkrestart(1)
