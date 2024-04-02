rmiregistry(1)                                         Remote Method Invocation (RMI) Tools                                         rmiregistry(1)

NAME
       rmiregistry - Starts a remote object registry on the specified port on the current host.

SYNOPSIS
       rmiregistry [ port ]

       port   The number of a port on the current host at which to start the remote object registry.

DESCRIPTION
       The rmiregistry command creates and starts a remote object registry on the specified port on the current host. If the port is omitted, then
       the registry is started on port 1099. The rmiregistry command produces no output and is typically run in the background, for example:

       rmiregistry &

       A remote object registry is a bootstrap naming service that is used by RMI servers on the same host to bind remote objects to names.
       Clients on local and remote hosts can then look up remote objects and make remote method invocations.

       The registry is typically used to locate the first remote object on which an application needs to call methods. That object then provides
       application-specific support for finding other objects.

       The methods of the java.rmi.registry.LocateRegistry class are used to get a registry operating on the local host or local host and port.

       The URL-based methods of the java.rmi.Naming class operate on a registry and can be used to look up a remote object on any host and on the
       local host. Bind a simple name (string) to a remote object, rebind a new name to a remote object (overriding the old binding), unbind a
       remote object, and list the URL bound in the registry.

OPTIONS
       -J
              Used with any Java option to pass the option following the -J (no spaces between the -J and the option) to the Java interpreter.

SEE ALSO
       · java(1)

       · java.rmi.registry.LocateRegistry class description at http://docs.oracle.com/javase/8/docs/api/java/rmi/registry/LocateRegistry.html

       · java.rmi.Naming class description at http://docs.oracle.com/javase/8/docs/api/java/rmi/Naming.html

JDK 8                                                            21 November 2013                                                   rmiregistry(1)
