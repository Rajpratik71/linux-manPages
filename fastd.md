FASTD(1)                                                           User Commands                                                          FASTD(1)

NAME
       fastd - Fast and Secure Tunnelling Daemon

SYNOPSIS
       fastd OPTION...

DESCRIPTION
       fastd is a very small VPN daemon which tunnels IP packets and Ethernet frames over UDP. It supports various modern encryption and authenti‐
       cation schemes and can be used in many different network topologies (1:1, 1:n, meshed).

OPTIONS
       --help, -h
              Shows a help text.

       --version, -v
              Shows the fastd version.

       --daemon, -d
              Runs fastd in the background.

       --pid-file <filename>
              Writes fastd's PID to the specified file.

       --status-socket <socket>
              Configure a socket to get fastd's status.

       --config, -c <filename>
              Loads a config file. - can be specified to read a config file from stdin. More than one config file can be loaded.

       --config-peer <filename>
              Loads a config file for a single peer. The filename will be used as the peer name.

       --config-peer-dir <dir>
              Loads all files from a directory as peer configs. On SIGHUP fastd will reload peer directories.

       --user <user>
              Sets the user to run fastd as.

       --group <group>
              Sets the group to run fastd as.

       --log-level error|warn|info|verbose|debug|debug2
              Sets the stderr log level; default is info if no alternative log destination is configured.

       --syslog-level error|warn|info|verbose|debug|debug2
              Sets the log level for syslog output; default is not to use syslog.

       --syslog-ident <ident>
              Sets the syslog identification; default is fastd.

       --hide-ip-addresses
              Hides IP addresses in log output.

       --hide-mac-addresses
              Hides MAC addresses in log output.

       --mode, -m tap|tun
              Sets the mode of the interface; default is TAP mode.

       --interface, -i <name>
              Sets the name of the TUN/TAP interface to use. If not specified, default names specified by the system will be used.

       --mtu, -M <mtu>
              Sets the MTU; must be at least 576.

       --bind, -b <address>[:<port>]
              Sets the bind address. Address can be an IPv4 address or an IPv6 address, or the keyword any. IPv6 addresses must be put  in  square
              brackets.

              By  default  fastd  will to bind to a random port for both IPv4 and IPv6. It is currently not possible to specify an IPv6 link-local
              address on the command line.

       --protocol, -p <protocol>
              Sets the handshake protocol. Currently the only protocol available is ec25519-fhmqvc, which  provides  a  secure  authentication  of
              peers based on public/secret keys.

       --method <method>
              Sets the encryption method.

       --forward
              Enables forwarding of packets between peers; read the full documentation before use!

       --on-pre-up <command>
              Sets a shell command to execute before interface creation.

       --on-up <command>
              Sets a shell command to execute after interface creation.

       --on-down <command>
              Sets a shell command to execute before interface destruction.

       --on-post-down <command>
              Sets a shell command to execute after interface destruction.

       --on-connect <command>
              Sets a shell command to execute when a handshake is sent to establish a new connection.

       --on-establish <command>
              Sets a shell command to execute when a new connection is established.

       --on-disestablish <command>
              Sets a shell command to execute when a connection is lost.

       --on-verify <command>
              Sets a shell command to execute to check a connection attempt by an unknown peer.

       --verify-config
              Checks the configuration and exits.

       --generate-key
              Generates a new keypair.

       --show-key
              Shows the public key corresponding to the configured secret.

       --machine-readable
              Suppresses output of explaining text in the --show-key and --generate-key commands.

SEE ALSO
       The full documentation for fastd is maintained in the Wiki at https://projects.universe-factory.net/projects/fastd/wiki/Fastd.

       See the user manual at https://projects.universe-factory.net/projects/fastd/wiki/User_manual in particular.

fastd v17                                                          January 2015                                                           FASTD(1)
