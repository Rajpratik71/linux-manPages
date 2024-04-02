VPNC(8)                                                   System Administration Utilities                                                  VPNC(8)

NAME
       vpnc - client for Cisco VPN3000 Concentrator, IOS and PIX

SYNOPSIS
       vpnc [--version] [--print-config] [--help] [--long-help] [options] [config files]

DESCRIPTION
       This manual page documents briefly the vpnc and vpnc-disconnect commands.

       vpnc  is  a VPN client for the Cisco 3000 VPN  Concentrator,  creating  a IPSec-like connection as a tunneling network device for the local
       system. It uses the TUN/TAP driver in  Linux  kernel  2.4  and  above  and device tun(4) on BSD. The created connection is presented  as  a
       tunneling network device to the local system.

       OBLIGATORY  WARNING:  the  most  used  configuration (XAUTH authentication with pre-shared keys and password authentication) is insecure by
       design, be aware of this fact when you use vpnc to exchange sensitive data like passwords!

       The vpnc daemon by itself does not set any routes, but it calls vpnc-script to do this job. vpnc-script displays a connect banner.  If  the
       concentrator  supplies  a network list for split-tunneling these networks are added to the routing table.  Otherwise the default-route will
       be modified to point to the tunnel.  Further a host route to the concentrator is added in the later case.  If the client host  needs  DHCP,
       care must be taken to add another host route to the DHCP-Server around the tunnel.

       The vpnc-disconnect command is used to terminate the connection previously created by vpnc and restore the previous routing configuration.

CONFIGURATION
       The daemon reads configuration data from the following places:
       ·      command line options
       ·      config file(s) specified on the command line
       ·      /etc/vpnc/default.conf
       ·      /etc/vpnc.conf
       ·      prompting the user if not found above

       vpnc  can parse options and configuration files in any order. However the first place to set an option wins.  configuration filenames which
       do not contain a / will be searched at /etc/vpnc/<filename> and /etc/vpnc/<filename>.conf.  Otherwise <filename> and  <filename>.conf  will
       be used.  If no configuration file is specified on the command-line at all, both /etc/vpnc/default.conf and /etc/vpnc.conf will be loaded.

       Additionally, if the configuration file "-" is specified on the command-line vpnc will read configuration from stdin.  The configuration is
       parsed and the connection proceeds when stdin is closed or the special character CEOT (CTRL-D) is read.

OPTIONS
       The program options can be either given as arguments (but not all of them for security reasons) or be stored in a configuration file.

       --gateway <ip/hostname>
              IP/name of your IPSec gateway
       conf-variable: IPSec gateway <ip/hostname>

       --id <ASCII string>
              your group name
       conf-variable: IPSec ID <ASCII string>

       (configfile only option)
              your group password (cleartext)
       conf-variable: IPSec secret <ASCII string>

       (configfile only option)
              your group password (obfuscated)
       conf-variable: IPSec obfuscated secret <hex string>

       --username <ASCII string>
              your username
       conf-variable: Xauth username <ASCII string>

       (configfile only option)
              your password (cleartext)
       conf-variable: Xauth password <ASCII string>

       (configfile only option)
              your password (obfuscated)
       conf-variable: Xauth obfuscated password <hex string>

       --domain <ASCII string>
              (NT-) Domain name for authentication
       conf-variable: Domain <ASCII string>

       --xauth-inter
              enable interactive extended authentication (for challenge response auth)
       conf-variable: Xauth interactive

       --vendor <cisco/netscreen>
              vendor of your IPSec gateway
              Default: cisco
       conf-variable: Vendor <cisco/netscreen>

       --natt-mode <natt/none/force-natt/cisco-udp>
              Which NAT-Traversal Method to use:
              ·      natt -- NAT-T as defined in RFC3947
              ·      none -- disable use of any NAT-T method
              ·      force-natt -- always use NAT-T encapsulation even without presence of a NAT device (useful if the OS captures all  ESP  traf‐
                     fic)
              ·      cisco-udp -- Cisco proprietary UDP encapsulation, commonly over Port 10000
              Note: cisco-tcp encapsulation is not yet supported
              Default: natt
       conf-variable: NAT Traversal Mode <natt/none/force-natt/cisco-udp>

       --script <command>
              command is executed using system() to configure the interface, routing and so on. Device name, IP, etc. are passed using environment
              variables, see README. This script is executed right after ISAKMP is done, but before tunneling is enabled. It is called  when  vpnc
              terminates, too
              Default: /usr/share/vpnc-scripts/vpnc-script
       conf-variable: Script <command>

       --dh <dh1/dh2/dh5>
              name of the IKE DH Group
              Default: dh2
       conf-variable: IKE DH Group <dh1/dh2/dh5>

       --pfs <nopfs/dh1/dh2/dh5/server>
              Diffie-Hellman group to use for PFS
              Default: server
       conf-variable: Perfect Forward Secrecy <nopfs/dh1/dh2/dh5/server>

       --enable-1des
              enables weak single DES encryption
       conf-variable: Enable Single DES

       --enable-no-encryption
              enables using no encryption for data traffic (key exchanged must be encrypted)
       conf-variable: Enable no encryption

       --application-version <ASCII string>
              Application Version to report. Note: Default string is generated at runtime.
              Default: Cisco Systems VPN Client 1.6.4r661-4:Linux
       conf-variable: Application version <ASCII string>

       --ifname <ASCII string>
              visible name of the TUN/TAP interface
       conf-variable: Interface name <ASCII string>

       --ifmode <tun/tap>
              mode of TUN/TAP interface:
              ·      tun: virtual point to point interface (default)
              ·      tap: virtual ethernet interface
              Default: tun
       conf-variable: Interface mode <tun/tap>

       --ifmtu <0-65535>
              Set MTU for TUN/TAP interface (default 0 == automatic detect)
       conf-variable: Interface MTU <0-65535>

       --debug <0/1/2/3/99>
              Show verbose debug messages
              ·
                      0: Do not print debug information.
              ·
                      1: Print minimal debug information.
              ·
                      2: Show statemachine and packet/payload type information.
              ·
                      3: Dump everything exluding authentication data.
              ·      99: Dump everything INCLUDING AUTHENTICATION data (e.g. PASSWORDS).
       conf-variable: Debug <0/1/2/3/99>

       --no-detach
              Don't detach from the console after login
       conf-variable: No Detach

       --pid-file <filename>
              store the pid of background process in <filename>
              Default: /var/run/vpnc.pid
       conf-variable: Pidfile <filename>

       --local-addr <ip/hostname>
              local IP to use for ISAKMP / ESP / ... (0.0.0.0 == automatically assign)
              Default: 0.0.0.0
       conf-variable: Local Addr <ip/hostname>

       --local-port <0-65535>
              local ISAKMP port number to use (0 == use random port)
              Default: 500
       conf-variable: Local Port <0-65535>

       --udp-port <0-65535>
              Local UDP port number to use (0 == use random port).  This is only relevant if cisco-udp nat-traversal is used.  This is the _local_
              port, the remote udp port is discovered automatically.  It is especially not the cisco-tcp port.
              Default: 10000
       conf-variable: Cisco UDP Encapsulation Port <0-65535>

       --dpd-idle <0,10-86400>
              Send DPD packet after not receiving anything for <idle> seconds.  Use 0 to disable DPD completely (both ways).
              Default: 300
       conf-variable: DPD idle timeout (our side) <0,10-86400>

       --non-inter
              Don't ask anything, exit on missing options
       conf-variable: Noninteractive

       --auth-mode <psk/cert/hybrid>
              Authentication mode:
              ·      psk:    pre-shared key (default)
              ·      cert:   server + client certificate (not implemented yet)
              ·      hybrid: server certificate + xauth (if built with openssl support)
              Default: psk
       conf-variable: IKE Authmode <psk/cert/hybrid>

       --ca-file <filename>
              filename and path to the CA-PEM-File
       conf-variable: CA-File <filename>

       --ca-dir <directory>
              path of the trusted CA-Directory
              Default: /etc/ssl/certs
       conf-variable: CA-Dir <directory>

       --target-network <target network/netmask>
              Target network in dotted decimal or CIDR notation
              Default: 0.0.0.0/0.0.0.0
       conf-variable: IPSEC target network <target network/netmask>

       --password-helper <executable>
              path to password program or helper name
       conf-variable: Password helper <executable>

       --print-config
              Prints your configuration; output can be used as vpnc.conf

FILES
       /etc/vpnc.conf /etc/vpnc/default.conf
              The default configuration file. You can specify the same config directives as with  command  line  options  and  additionally  IPSec
              secret and Xauth password both supplying a cleartext password. Scrambled passwords from the Cisco configuration profiles can be used
              with IPSec obfuscated secret and Xauth obfuscated password.

              See EXAMPLES for further details.

       /etc/vpnc/*.conf
              vpnc will read configuration files in this directory when the config filename (with or without .conf) is specified  on  the  command
              line.

EXAMPLES
       This is an example vpnc.conf with pre-shared keys:

              IPSec gateway vpn.example.com
              IPSec ID ExampleVpnPSK
              IKE Authmode psk
              IPSec secret PskS3cret!
              Xauth username user@example.com
              Xauth password USecr3t

       And another one with hybrid authentication (requires that vpnc was built with openssl support):

              IPSec gateway vpn.example.com
              IPSec ID ExampleVpnHybrid
              IKE Authmode hybrid
              CA-Dir /etc/vpnc
              or
              CA-File /etc/vpnc/vpn-example-com.pem
              IPSec secret HybS3cret?
              Xauth username user@example.com
              Xauth password 123456

       The  lines  begin  with a keyword (no leading spaces!).  The values start exactly one space after the keywords, and run to the end of line.
       This lets you put any kind of weird character (except CR, LF and NUL) in your strings, but it does mean you  can't  add  comments  after  a
       string, or spaces before them.

       In  case the the CA-Dir option is used, your certificate needs to be named something like 722d15bd.X, where X is a manually assigned number
       to make sure that files with colliding hashes have different names. The number can be derived from the certificate file itself:

       openssl x509 -subject_hash -noout -in /etc/vpnc/vpn-example-com.pem

       See also the --print-config option to generate a config file, and the example file  in  the  package  documentation  directory  where  more
       advanced usage is demonstrated.

       Advanced features like manual setting of multiple target routes and disabling /etc/resolv.conf rewriting is documented in the README of the
       vpnc package.

AUTHOR
       This man-page has been written by Eduard Bloch <blade(at)debian.org> and Christian Lackas <delta(at)lackas.net>, based on  vpnc  README  by
       Maurice  Massar  <vpnc(at)unix-ag.uni-kl.de>.  Permission is granted to copy, distribute and/or modify this document under the terms of the
       GNU General Public License, Version 2 any later version published by the Free Software Foundation.

       On Debian systems, the complete text of the GNU General Public License can be found in /usr/share/common-licenses/GPL.

SEE ALSO
       pcf2vpnc(1), cisco-decrypt(1), ip(8), ifconfig(8), route(1), http://www.unix-ag.uni-kl.de/~massar/vpnc/

vpnc version 0.5.3                                                September 2014                                                           VPNC(8)
