oddjob_request(1)                                                                          General Commands Manual                                                                          oddjob_request(1)



NAME
       oddjob_request - send requests to oddjobd from the command line


SYNOPSIS
       oddjob_request [-s service] [-o object] [-i interface] [-S] [ [request [arg1 ...]] | -I ]


DESCRIPTION
       The oddjob_request application is a simple oddjob client application which can be used to invoke a particular method provided by the oddjobd server.

       If no request is given as a command-line argument, oddjob_request will attempt to invoke the list method, which should list all methods for which the invoking user is authorized.


ARGUMENTS
       -S     Connect to the session bus instead of the system bus.  This option is primarily intended for use in testing.  com.redhat.oddjob.

       -s service
              The object is provided by the named service instead of com.redhat.oddjob.

       -o object
              Invoke a method on the named object instead of /com/redhat/oddjob.

       -i interface
              The method is part of the named interface instead of com.redhat.oddjob.

       -I     Default to the method and interface names used for D-Bus introspection (Introspect and org.freedesktop.DBus.Introspectable, respectively).

SEE ALSO
       oddjob.conf(5) oddjobd.conf(5) oddjobd(8)



oddjob Manual                                                                                   25 April 2005                                                                               oddjob_request(1)
