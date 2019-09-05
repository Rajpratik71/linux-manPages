omshell(1)                                                                                 General Commands Manual                                                                                 omshell(1)



NAME
       omshell - OMAPI Command Shell

SYNOPSIS
       omshell

DESCRIPTION
       The  OMAPI  Command  Shell,  omshell,  provides  an  interactive  way to connect to, query, and possibly change, the ISC DHCP Server's state via OMAPI, the Object Management API.  By using OMAPI and
       omshell, you do not have to stop, make changes, and then restart the DHCP server, but can make the changes while the server is running.  Omshell provides a way of accessing OMAPI.

       OMAPI is simply a communications mechanism that allows you to manipulate objects.  In order to actually use omshell, you must understand what objects are available and how to use  them.   Documenta-
       tion for OMAPI objects can be found in the documentation for the server that provides them - for example, in the dhcpd(1) manual page and the dhclient(1) manual page.

CONTRIBUTIONS
       This  software  is  free  software.  At various times its development has been underwritten by various organizations, including the ISC and Vixie Enterprises.  The development of 3.0 has been funded
       almost entirely by Nominum, Inc.

       At this point development is hosted by the ISC, but the future of this project depends on you.  If you have features you want, please consider implementing them.

LOCAL AND REMOTE OBJECTS
       Throughout this document, there are references to local and remote objects.  Local objects are ones created in omshell with the new command.  Remote objects are ones on the  server:  leases,  hosts,
       and  groups  that  the DHCP server knows about.  Local and remote objects are associated together to enable viewing and modification of object attributes.  Also, new remote objects can be created to
       match local objects.

OPENING A CONNECTION
       omshell is started from the command line.  Once omshell is started, there are several commands that can be issued:

       server address
            where address is the IP address of the DHCP server to connect to.  If this is not specified, the default server is 127.0.0.1 (localhost).

       port number
            where number is the port that OMAPI listens on.  By default, this is 7911.

       key name secret
            This specifies the TSIG key to use to authenticate the OMAPI transactions.  name is the name of a key defined in dhcpd.conf with the omapi-key statement.  The secret is the secret key generated
            from dnssec-keygen or another key generation program.

       connect
            This starts the OMAPI connection to the server as specified by the server statement.

CREATING LOCAL OBJECTS
       Any  object  defined  in  OMAPI can be created, queried, and/or modified.  The object types available to OMAPI are defined in dhcpd(8) and dhclient(8).  When using omshell, objects are first defined
       locally, manipulated as desired, and then associated with an object on the server.  Only one object can be manipulated at a time.  To create a local object, use

       new object-type
            object-type is one of group, host, or lease.

       At this point, you now have an object that you can set properties on.  For example, if a new lease object was created with new lease, any of a lease's attributes can be set as follows:

       set attribute-name = value
            Attribute names are defined in dhcpd(8) and dhclient(8).  Values should be quoted if they are strings.  So, to set a lease's IP address, you would do the following:
             set ip-address = 192.168.4.50

ASSOCIATING LOCAL AND REMOTE OBJECTS
       At this point, you can query the server for information about this lease, by

       open

       Now, the local lease object you created and set the IP address for is associated with the corresponding lease object on the DHCP server.  All of the lease attributes from the  DHCP  server  are  now
       also the attributes on the local object, and will be shown in omshell.

VIEWING A REMOTE OBJECT
       To query a lease of address 192.168.4.50, and find out its attributes, after connecting to the server, take the following steps:

       new lease

       This creates a new local lease object.

       set ip-address = 192.168.4.50

       This sets the local object's IP address to be 192.168.4.50

       open

       Now, if a lease with that IP address exists, you will see all the information the DHCP server has about that particular lease.  Any data that isn't readily printable text will show up in colon-sepa-
       rated hexadecimal values.  In this example, output back from the server for the entire transaction might look like this:

       > new "lease"
       obj: lease
       > set ip-address = 192.168.4.50
       obj: lease
       ip-address = c0:a8:04:32
       > open
       obj: lease
       ip-address = c0:a8:04:32
       state = 00:00:00:02
       dhcp-client-identifier = 01:00:10:a4:b2:36:2c
       client-hostname = "wendelina"
       subnet = 00:00:00:06
       pool = 00:00:00:07
       hardware-address = 00:10:a4:b2:36:2c
       hardware-type = 00:00:00:01
       ends = dc:d9:0d:3b
       starts = 5c:9f:04:3b
       tstp = 00:00:00:00
       tsfp = 00:00:00:00
       cltt = 00:00:00:00

       As you can see here, the IP address is represented in hexadecimal, as are the starting and ending times of the lease.

MODIFYING A REMOTE OBJECT
       Attributes of remote objects are updated by using the set command as before, and then issuing an update command.  The set command sets the attributes on the current local object, and the update com-
       mand pushes those changes out to the server.

       Continuing with the previous example, if a set client-hostname = "something-else" was issued, followed by an update command, the output would look about like this:

       > set client-hostname = "something-else"
       obj: lease
       ip-address = c0:a8:04:32
       state = 00:00:00:02
       dhcp-client-identifier = 01:00:10:a4:b2:36:2c
       client-hostname = "something-else"
       subnet = 00:00:00:06
       pool = 00:00:00:07
       hardware-address = 00:10:a4:b2:36:2c
       hardware-type = 00:00:00:01
       ends = dc:d9:0d:3b
       starts = 5c:9f:04:3b
       tstp = 00:00:00:00
       tsfp = 00:00:00:00
       cltt = 00:00:00:00
       > update
       obj: lease
       ip-address = c0:a8:04:32
       state = 00:00:00:02
       dhcp-client-identifier = 01:00:10:a4:b2:36:2c
       client-hostname = "something-else"
       subnet = 00:00:00:06
       pool = 00:00:00:07
       hardware-address = 00:10:a4:b2:36:2c
       hardware-type = 00:00:00:01
       ends = dc:d9:0d:3b
       starts = 5c:9f:04:3b
       tstp = 00:00:00:00
       tsfp = 00:00:00:00
       cltt = 00:00:00:00

NEW REMOTE OBJECTS
       New  remote  objects  are  created  much in the same way that existing server objects are modified.  Create a local object using new, set the attributes as you'd wish them to be, and then create the
       remote object with the same properties by using

       create

       Now a new object exists on the DHCP server which matches the properties that you gave your local object.  Objects created via OMAPI are saved into the dhcpd.leases file.

       For example, if a new host with the IP address of 192.168.4.40 needs to be created it would be done as follows:

       > new host
       obj: host
       > set name = "some-host"
       obj: host
       name = "some-host"
       > set hardware-address = 00:80:c7:84:b1:94
       obj: host
       name = "some-host"
       hardware-address = 00:80:c7:84:b1:94
       > set hardware-type = 1
       obj: host
       name = "some-host"
       hardware-address = 00:80:c7:84:b1:94
       hardware-type = 1
       > set ip-address = 192.168.4.40
       obj: host
       name = "some-host"
       hardware-address = 00:80:c7:84:b1:94
       hardware-type = 1
       ip-address = c0:a8:04:28
       > create
       obj: host
       name = "some-host"
       hardware-address = 00:80:c7:84:b1:94
       hardware-type = 00:00:00:01
       ip-address = c0:a8:04:28
       >

       Your dhcpd.leases file would then have an entry like this in it:

       host some-host {
         dynamic;
         hardware ethernet 00:80:c7:84:b1:94;
         fixed-address 192.168.4.40;
       }

       The dynamic; line is to denote that this host entry did not come from dhcpd.conf, but was created dynamically via OMAPI.

RESETTING ATTRIBUTES
       If you want to remove an attribute from an object, you can do this with the unset command.  Once you have unset an attribute, you must use the update command to update the remote object.  So, if the
       host "some-host" from the previous example will not have a static IP address anymore, the commands in omshell would look like this:

       obj: host
       name = "some-host"
       hardware-address = 00:80:c7:84:b1:94
       hardware-type = 00:00:00:01
       ip-address = c0:a8:04:28
       > unset ip-address
       obj: host
       name = "some-host"
       hardware-address = 00:80:c7:84:b1:94
       hardware-type = 00:00:00:01
       ip-address = <null>
       >

REFRESHING OBJECTS
       A  local  object  may  be  refreshed  with  the current remote object properties using the refresh command.  This is useful for object that change periodically, like leases, to see if they have been
       updated.  This isn't particularly useful for hosts.

DELETING OBJECTS
       Any remote object that can be created can also be destroyed.  This is done by creating a new local object, setting attributes, associating the local and remote object using open, and then using  the
       remove command.  If the host "some-host" from before was created in error, this could be corrected as follows:

       obj: host
       name = "some-host"
       hardware-address = 00:80:c7:84:b1:94
       hardware-type = 00:00:00:01
       ip-address = c0:a8:04:28
       > remove
       obj: <null>
       >

HELP
       The help command will print out all of the commands available in omshell, with some syntax pointers.

SEE ALSO
       dhcpctl(3), omapi(3), dhcpd(8), dhclient(8), dhcpd.conf(5), dhclient.conf(5).

AUTHOR
       omshell is maintained by ISC.  To learn more about Internet Systems Consortium, see https://www.isc.org




                                                                                                                                                                                                   omshell(1)
