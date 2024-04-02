ORTED(1)                                                             Open MPI                                                             ORTED(1)

NAME
       orted - Start an Open RTE User-Level Daemon

SYNOPSIS
       orted [options]

DESCRIPTION
       orted starts an Open RTE daemon for the Open MPI system.

NOTE
       The  orted  command  is not intended to be manually invoked by end users.  It is part of the Open MPI architecture and is invoked automati‐
       cally as necessary.  This man page is mainly intended for those adventerous end users and system administrators who have noticed an "orted"
       process and wondered what it is.

       As such, the command line options accepted by the orted are not listed below because they are considered internal and are therefore subject
       to change between versions without warning.  Running orted with the --help command line option will show all available options.

AUTHORS
       The Open MPI maintainers -- see http://www.openmpi.org/ or the file AUTHORS.

       This manual page was originally contributed by Dirk Eddelbuettel <edd@debian.org>, one of the Debian GNU/Linux maintainers  for  Open  MPI,
       and may be used by others.

1.10.2                                                             Jan 21, 2016                                                           ORTED(1)
