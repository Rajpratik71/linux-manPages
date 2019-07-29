acpi_listen(8)                                                System Manager's Manual                                               acpi_listen(8)

NAME
       acpi_listen - ACPI event listener

SYNOPSIS
       acpi_listen [options]

DESCRIPTION
       acpid  is  the system-wide ACPI event catcher.  acpi_listen is a simple shell-friendly tool which connects to acpid and listens for events.
       When an event occurs, acpi_listen will print it on stdout.

OPTIONS
       -c, --count events
              Receive up to a maximum number of ACPI events, then exit.

       -s, --socketfile filename
              This option changes the name of the UNIX domain socket which acpid opens.  Default is /var/run/acpid.socket.

       -t, --time seconds
              Listen for the specified time in seconds, before exiting.

       -v, --version
              Print version information and exit.

       -h, --help
              Show help and exit.

FILES
       /var/run/acpid.socket

BUGS
       There are no known bugs.  To file bug reports, see AUTHORS below.

SEE ALSO
       acpid(8)

AUTHORS
       Ted Felix (www.tedfelix.com)
       Tim Hockin <thockin@hockin.org>
       Luca Capello <luca@pca.it>

                                                                     Nov 2003                                                       acpi_listen(8)
