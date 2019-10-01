DOTLOCKFILE(1)                                                                                Cistron Utilities                                                                                DOTLOCKFILE(1)



NAME
       dotlockfile - Utility to manage lockfiles

SYNOPSIS
       /usr/bin/dotlockfile [-p] [-c] [-m] [-l|-u|-t] [-r retries] [lockfile]

DESCRIPTION
       Dotlockfile is a command line utility to safely create, test and remove lockfiles. Lockfiles are created in an NFS-safe way. Dotlockfile can can also be used to lock and unlock mailboxes even if the
       mailspool directory is only writable by group mail.

       The name dotlockfile comes from the way mailboxes are locked for updates on a lot of UNIX systems. A lockfile is created with the same filename as the mailbox but with the string ".lock" appended.

       The names dotlock and lockfile were already taken - hence the name dotlockfile :).

OPTIONS
       -l     Create a lockfile. This is the default.

       -u     Remove a lockfile.

       -c     Check for the existence of a valid lockfile.

       -t     Touch an existing lockfile (update the timestamp).

       -p     Write the process-id of the calling process into the lockfile. Also when testing for an existing lockfile, check the contents for a process-id to find out if the lockfile is still valid.

       -r retries
              The number of times dotlockfile retries to acquire the lock if it failed the first time before giving up. The initial sleep after failing to acquire the lock is 5  seconds.  After  each  next
              try, a sleep of 5 seconds extra occurs up to a maximum sleep of 60 seconds between tries.  The default number of retries is 5.

       -m     Lock  or  unlock  the current users mailbox. The path to the mailbox is the default system mailspool directory (usually /var/mail) with the username as gotten from getpwuid() appended. If the
              environment variable $MAIL is set, that is used instead. Then the string ".lock" is appended to get the name of the actual lockfile.

       lockfile
              The lockfile to be created/removed, unless the -m option is in effect.


RETURN VALUE
       Zero on success, and non-zero on failure. For the -c option, sucess means that a valid lockfile is already present. When locking (the default, or the -l option) dotlockfile returns the  same  values
       as the library function lockfile_create(3). Unlocking a non-existant lockfile is not an error.


NOTES
       The lockfile is created exactly as named on the command line. The extension .lock is not automatically added.

       This  utility is a lot like the lockfile(1) utility included with procmail, and the mutt_dotlock(1) utility included with mutt. However the command-line arguments differ, and so does the return sta‐
       tus. It is believed that dotlockfile is the most flexible implementation, since it automatically detects when it needs to use priviliges to lock a mailbox, and does it safely.

       The above mentioned lockfile_create(3) manpage is present in the liblockfile-dev package.


BUGS
       None known.


SEE ALSO
       lockfile_create(3), maillock(3)


AUTHOR
       Miquel van Smoorenburg, miquels@cistron.nl



                                                                                                 15 May 2003                                                                                   DOTLOCKFILE(1)
