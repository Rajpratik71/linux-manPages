CTRLALTDEL(8)                                                                             System Administration                                                                             CTRLALTDEL(8)

NAME
       ctrlaltdel - set the function of the Ctrl-Alt-Del combination

SYNOPSIS
       ctrlaltdel hard|soft

DESCRIPTION
       Based  on  examination  of the linux/kernel/sys.c code, it is clear that there are two supported functions that the Ctrl-Alt-Del sequence can perform: a hard reset, which immediately reboots the
       computer without calling sync(2) and without any other preparation; and a soft reset, which sends the SIGINT (interrupt) signal to the init process (this is always the process with PID  1).   If
       this  option  is  used, the init(8) program must support this feature.  Since there are now several init(8) programs in the Linux community, please consult the documentation for the version that
       you are currently using.

       ctrlaltdel is usually used in the /etc/rc.local file.

OPTIONS
       -V, --version
              Display version information and exit.

       -h, --help
              Display help text and exit.

FILES
       /etc/rc.local

SEE ALSO
       init(8)

AUTHOR
       Peter Orbaek ⟨poe@daimi.aau.dk⟩

AVAILABILITY
       The ctrlaltdel command is part of the util-linux package and is available from Linux Kernel Archive ⟨ftp://ftp.kernel.org/pub/linux/utils/util-linux/⟩.

util-linux                                                                                     August 2011                                                                                  CTRLALTDEL(8)
