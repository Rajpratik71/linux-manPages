TOR-INSTANCE-CREAT(8)                         Tor Manual                         TOR-INSTANCE-CREAT(8)

NAME
       tor-instance-create - Set up a new tor instance

SYNOPSIS
       tor-instance-create instance_name

DESCRIPTION
       The Tor Debian package supports running multiple instances of the Tor daemon. This can be
       useful if you want to run multiple relays or bridge relays on a single system, of if you want
       to provide a hidden service in addition to running a relay.

       tor-instance-create is the tool that creates a new instance of Tor on a Debian system. In
       particular, it creates a new UNIX user with a home directory and a mostly empty tor
       configuration file.

       The new user and group are named _tor-instance_name. The user’s home directory, which is also
       the DataDirectory of the new tor instance, is /var/lib/tor-instances/instance_name. The
       configuration file for that instance is /etc/tor/instances/instance_name/torrc. Logs go to
       syslog by default.

       To start this new service, use systemctl start tor@instance_name. Stopping, restarting, and
       reloading the config works accordingly. Stopping/Starting/.. the tor service should affect all
       instances. The "main" instance which lives in /var/lib/tor and has /etc/tor/torrc as its
       configuration file is known to systemd as tor@default.

       There currently is no tor-instance-remove script. To remove an instance, delete the user and
       its homedirectory once you are convinced there are no files or processes on your system still
       owned by that user. Then also remove the corresponding directory tree in /etc/tor/instances.

SEE ALSO
       tor(1)

AUTHORS
           Peter Palfrader

AUTHOR
       Peter Palfrader
           Author.

Tor                                           08/21/2019                         TOR-INSTANCE-CREAT(8)
