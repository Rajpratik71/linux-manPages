RUNLEVEL(8)                                                                                        runlevel                                                                                       RUNLEVEL(8)



NAME
       runlevel - Print previous and current SysV runlevel

SYNOPSIS
       runlevel [options...]

DESCRIPTION
       runlevel prints the previous and current SysV runlevel if they are known.

       The two runlevel characters are separated by a single space character. If a runlevel cannot be determined, N is printed instead. If neither can be determined, the word "unknown" is printed.

       Unless overridden in the environment, this will check the utmp database for recent runlevel changes.

OPTIONS
       The following option is understood:

       --help
           Print a short help text and exit.

EXIT STATUS
       If one or both runlevels could be determined, 0 is returned, a non-zero failure code otherwise.

ENVIRONMENT
       $RUNLEVEL
           If $RUNLEVEL is set, runlevel will print this value as current runlevel and ignore utmp.

       $PREVLEVEL
           If $PREVLEVEL is set, runlevel will print this value as previous runlevel and ignore utmp.

FILES
       /var/run/utmp
           The utmp database runlevel reads the previous and current runlevel from.

NOTES
       This is a legacy command available for compatibility only. It should not be used anymore, as the concept of runlevels is obsolete.

SEE ALSO
       systemd(1), systemctl(1)



systemd 219                                                                                                                                                                                       RUNLEVEL(8)
