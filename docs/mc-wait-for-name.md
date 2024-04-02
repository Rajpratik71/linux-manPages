MC-WAIT-FOR-NAME(1)                                                  Utilities                                                 MC-WAIT-FOR-NAME(1)

NAME
       mc-wait-for-name - run until a D-Bus name appears on the session bus

SYNOPSIS
       mc-wait-for-name WELL-KNOWN-NAME

       [D-BUS Service]
       Name=org.freedesktop.Telepathy.Client.Something
       Exec=/usr/bin/mc-wait-for-name org.freedesktop.Telepathy.Client.Something

DESCRIPTION
       mc-wait-for-name  runs  until  a  bus name appears, then exits successfully. This can be used as a service-activation helper for a bus name
       that is not directly activatable, but will be provided automatically (after a while) by the desktop session.

EXIT STATUS
       0      The bus name eventually appeared.

       64 (EX_USAGE)
              Invocation error (too many or too few arguments, or the bus name given was not a syntactically valid well-known bus name).

       69 (EX_UNAVAILABLE)
              mc-wait-for-name was unable to connect to the session bus.

       75 (EX_TEMPFAIL)
              The name did not appear within a reasonable time.

OPTIONS
       There are no additional command-line options.

BUGS
       The "reasonable time" to wait is currently hard-coded.

Telepathy                                                            July 2009                                                 MC-WAIT-FOR-NAME(1)
