LIBVIRTD(8)                                                                               Virtualization Support                                                                              LIBVIRTD(8)

NAME
       libvirtd - libvirtd management daemon

SYNOPSIS
       libvirtd [ -dlv ] [ -f config_file ] [ -p pid_file ] [ -t timeout_seconds ]

       libvirtd --version

DESCRIPTION
       The libvirtd program is the server side daemon component of the libvirt virtualization management system.

       This daemon runs on host servers and performs required management tasks for virtualized guests.  This includes activities such as starting, stopping and migrating guests between host servers,
       configuring and manipulating networking, and managing storage for use by guests.

       The libvirt client libraries and utilities connect to this daemon to issue tasks and collect information about the configuration and resources of the host system and guests.

       By default, the libvirtd daemon listens for requests on a local Unix domain socket.  Using the -l|--listen command line option, the libvirtd daemon can be instructed to additionally listen on a
       TCP/IP socket.  The TCP/IP socket to use is defined in the libvirtd configuration file.

       Restarting libvirtd does not impact running guests.  Guests continue to operate and will be picked up automatically if their XML configuration has been defined.  Any guests whose XML
       configuration has not been defined will be lost from the configuration.

OPTIONS
       -h, --help
           Display command line help usage then exit.

       -d, --daemon
           Run as a daemon & write PID file.

       -f, --config FILE
           Use this configuration file, overriding the default value.

       -l, --listen
           Listen for TCP/IP connections.

       -p, --pid-file FILE
           Use this name for the PID file, overriding the default value.

       -t, --timeout SECONDS
           Exit after timeout period (in seconds) elapse with no client connections or registered resources.  Be aware that resources such as autostart networks will result in never reaching the
           timeout, even when there are no client connections.

       -v, --verbose
           Enable output of verbose messages.

           --version
           Display version information then exit.

SIGNALS
       On receipt of SIGHUP libvirtd will reload its configuration.

FILES
   When run as root.
       SYSCONFDIR/libvirtd.conf
           The default configuration file used by libvirtd, unless overridden on the command line using the -f|--config option.

       LOCALSTATEDIR/run/libvirt/libvirt-sock
       LOCALSTATEDIR/run/libvirt/libvirt-sock-ro
           The sockets libvirtd will use.

       SYSCONFDIR/pki/CA/cacert.pem
           The TLS Certificate Authority certificate libvirtd will use.

       SYSCONFDIR/pki/libvirt/servercert.pem
           The TLS Server certificate libvirtd will use.

       SYSCONFDIR/pki/libvirt/private/serverkey.pem
           The TLS Server private key libvirtd will use.

       LOCALSTATEDIR/run/libvirtd.pid
           The PID file to use, unless overridden by the -p|--pid-file option.

   When run as non-root.
       $XDG_CONFIG_HOME/libvirtd.conf
           The default configuration file used by libvirtd, unless overridden on the command line using the -f|--config option.

       $XDG_RUNTIME_DIR/libvirt/libvirt-sock
           The socket libvirtd will use.

       $HOME/.pki/libvirt/cacert.pem
           The TLS Certificate Authority certificate libvirtd will use.

       $HOME/.pki/libvirt/servercert.pem
           The TLS Server certificate libvirtd will use.

       $HOME/.pki/libvirt/serverkey.pem
           The TLS Server private key libvirtd will use.

       $XDG_RUNTIME_DIR/libvirt/libvirtd.pid
           The PID file to use, unless overridden by the -p|--pid-file option.

       If $XDG_CONFIG_HOME is not set in your environment, libvirtd will use $HOME/.config
       If $XDG_RUNTIME_DIR is not set in your environment, libvirtd will use $HOME/.cache

EXAMPLES
       To retrieve the version of libvirtd:

        # libvirtd --version
        libvirtd (libvirt) 0.8.2
        #

       To start libvirtd, instructing it to daemonize and create a PID file:

        # libvirtd -d
        # ls -la LOCALSTATEDIR/run/libvirtd.pid
        -rw-r--r-- 1 root root 6 Jul  9 02:40 LOCALSTATEDIR/run/libvirtd.pid
        #

BUGS
       Please report all bugs you discover.  This should be done via either:

       a) the mailing list
           <http://libvirt.org/contact.html>

       or,

       b) the bug tracker
           <http://libvirt.org/bugs.html>

       Alternatively, you may report bugs to your software distributor / vendor.

AUTHORS
       Please refer to the AUTHORS file distributed with libvirt.

COPYRIGHT
       Copyright (C) 2006-2012 Red Hat, Inc., and the authors listed in the libvirt AUTHORS file.

LICENSE
       libvirtd is distributed under the terms of the GNU LGPL v2.1+.  This is free software; see the source for copying conditions. There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A
       PARTICULAR PURPOSE

SEE ALSO
       virsh(1), virt-install(1), virt-xml-validate(1), virt-top(1), virt-df(1), <http://www.libvirt.org/>

libvirt-1.3.1                                                                                   2019-10-30                                                                                    LIBVIRTD(8)
