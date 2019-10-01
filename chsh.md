CHSH(1)                                                                                         User Commands                                                                                         CHSH(1)



NAME
       chsh - change your login shell

SYNOPSIS
       chsh [-s shell] [-l] [-u] [-v] [username]

DESCRIPTION
       chsh is used to change your login shell.  If a shell is not given on the command line, chsh prompts for one.

       chsh is used to change local entries only. Use ypchsh, lchsh or any other implementation for non-local entries.

OPTIONS
       -s, --shell shell
              Specify your login shell.

       -l, --list-shells
              Print the list of shells listed in /etc/shells and exit.

       -u, --help
              Print a usage message and exit.

       -v, --version
              Print version information and exit.

VALID SHELLS
       chsh will accept the full pathname of any executable file on the system.  However, it will issue a warning if the shell is not listed in the /etc/shells file.  On the other hand, it can also be con‐
       figured such that it will only accept shells listed in this file, unless you are root.

EXIT STATUS
       Returns 0 if operation was successful, 1 if operation failed or command syntax was not valid.

SEE ALSO
       login(1), passwd(5), shells(5)

AUTHOR
       Salvatore Valente <svalente@mit.edu>

AVAILABILITY
       The chsh command is part of the util-linux package and is available from ftp://ftp.kernel.org/pub/linux/utils/util-linux/.



util-linux                                                                                        July 2009                                                                                           CHSH(1)
