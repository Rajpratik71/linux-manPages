PORTRESERVE(1)                                                                           TCP port reservation utility                                                                          PORTRESERVE(1)



NAME
       portreserve - reserve ports to prevent portmap mapping them

SYNOPSIS
       portreserve

DESCRIPTION
       The portreserve program aims to help services with well-known ports that lie in the bindresvport range. It prevents portmap (or other programs using bindresvport) from occupying a real service's
       port by occupying it itself, until the real service tells it to release the port (generally in its init script).

       It is intended that portreserve runs from an initscript of its own, and services wishing to interact with it should use portrelease.

       When the portreserve daemon is started, it examines the /etc/portreserve/ directory. Each file not containing “.”  or “~” in its name is considered to be a service configuration file, and must
       contain a service name (as listed in /etc/services) or a port number. UDP services may be specified by appending "/udp" to the service name, and TCP services by "/tcp". Several services may be
       specified, one per line.

       For example, /etc/portreserve/cups might contain the string “ipp” or, equivalently, “ipp/tcp” and “ipp/udp” on separate lines.

       For each service configuration file, a socket is created and bound to the appropriate port. A service wishing to bind to its port must first run portrelease, which instructs portreserve to release
       the port associated with the service.

       Once all the reserved ports have been released, the daemon exits.

FILES
       /etc/portreserve/*
           Service configuration files

       /var/run/portreserve/socket
           communication socket for portrelease

SEE ALSO
       portrelease(1)

AUTHOR
       Tim Waugh <twaugh@redhat.com>
           Author.



portreserve                                                                                      1 July 2008                                                                                   PORTRESERVE(1)
