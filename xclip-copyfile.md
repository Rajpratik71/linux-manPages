XCLIP-COPYFILE(1)                       General Commands Manual                      XCLIP-COPYFILE(1)

NAME
       xclip-copyfile, xclip-cutfile, xclip-pastefile - copy and move files via the X clipboard

SYNOPSIS
       xclip-copyfile [-p] FILES...

       xclip-cutfile [-p] FILES...

       xclip-pastefile

DESCRIPTION
       xclip-copyfile copies files into the X clipboard, recursing into directories.

       xclip-cutfile copies the files, but also deletes them afterwards.

       -p     preserve path formation

       xclip-pastefile pastes the files out of the clipboard

EXAMPLES
       Copying a file to a remote host

       [maggie.lkpg.cendio.se ~]$ echo "A file created on ${HOSTNAME}" > file1
       [maggie.lkpg.cendio.se ~]$ xclip-copyfile file1
       [sofie.homeip.net ~/doc]$ xclip-pastefile
       file1
       [sofie.homeip.net ~/doc]$ cat file1
       A file created on maggie.lkpg.cendio.se

       Copying an entire tree structure

       [sofie.homeip.net ~]$ xclip-copyfile doc
       [maggie.lkpg.cendio.se ~/tmp]$ xclip-pastefile
       doc/
       doc/letter-mom-april.txt
       doc/file1
       doc/letter-dad-march.txt

       Copying files with preserved path information

       [maggie.lkpg.cendio.se ~]$ xclip-copyfile -p /etc/sysconfig/grub
       tar: Removing leading `/' from member names
       [sofie.homeip.net ~/tmp]$ xclip-pastefile
       etc/sysconfig/grub
       [sofie.homeip.net ~/tmp]$ ls etc/sysconfig/grub
       etc/sysconfig/grub

       Moving files

       [sofie.homeip.net ~]$ ls letter-brother-may.txt
       letter-brother-may.txt
       [sofie.homeip.net ~]$ xclip-cutfile letter-brother-may.txt
       [sofie.homeip.net ~]$ ls letter-brother-may.txt
       ls: cannot access letter-brother-may.txt: No such file or directory
       [sofie.homeip.net ~]$ cd doc
       [sofie.homeip.net ~/doc]$ xclip-pastefile
       letter-brother-may.txt

AUTHORS
       This  manual  page  was  written  by  Maximilian  Gass <mxey@cloudconnected.org> for the Debian
       project. It may be used for everything else, of course.

                                                                                     XCLIP-COPYFILE(1)
