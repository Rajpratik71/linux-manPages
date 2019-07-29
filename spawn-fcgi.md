spawn-fcgi(1)                                                 General Commands Manual                                                spawn-fcgi(1)

NAME
       spawn-fcgi - Spawns FastCGI processes

SYNOPSIS
       spawn-fcgi [options] [ -- <fcgiapp> [fcgi app arguments]]

       spawn-fcgi -v

       spawn-fcgi -h

DESCRIPTION
       spawn-fcgi is used to spawn remote and local FastCGI processes.

       While  it is obviously needed to spawn remote FastCGI backends (the web server can only spawn local ones), it is recommended to spawn local
       backends with spawn-fcgi, too.

       Reasons why you may want to use spawn-fcgi instead of something else:

       *  Privilege separation without needing a suid-binary or running a server as root.

       *  You can restart your web server and the FastCGI applications without restarting the others.

       *  You can run them in different chroot()s.

       *  Running your FastCGI applications doesn't depend on the web server you are running,  which  allows  for  easier  testing  of  other  web
          servers.

OPTIONS
       spawn-fcgi accepts the following options:

       -f <path>
               Filename  of  the  FastCGI  application  to  spawn. This option is deprecated and it is recommend to always specify the application
               (absolute path) and its parameters after "--"; the fcgiapp parameter is directly used for the exec() call, while for  starting  the
               binary given with -f /bin/sh is needed (which may not be available in a chroot).

               This option is ignored if fcgiapp is given.

       -d <path>
               Change the current directory before spawning the application.

       -a <address>
               IPv4/IPv6 address to bind to; only used if -p is given too. Defaults to "0.0.0.0" (IPv4).

       -p <port>
               TCP port to bind to; you cannot combine this with the -s option.

       -s <path>
               Path to the Unix domain socket to bind to; you cannot combine this with the -p option.

       -C <children>
               (PHP only) Number of children to spawn by setting the PHP_FCGI_CHILDREN environment variable. Default is not to overwrite the envi‐
               ronment variable; php will spawn no children if the variable is not set (same as setting it to 0).

       -F <children>
               Number of children to fork, defaults to 1. This option doesn't work with -n, have a look at multiwatch(1) if you want to  supervise
               multiple forks on the same socket.

       -b <backlog>
               backlog  to allow on the socket (default 1024). This is usually limited by the kernel too, check sysctl net.core.somaxconn (default
               128) for linux.

               backlog is the queue of connections that the kernel accepts before the userspace application sees them.

       -P <path>
               Name of the PID file for spawned processes (ignored in no-fork mode)

       -n      No forking should take place (for daemontools)

       -M <mode>
               Change file mode of the Unix domain socket (octal integer); only used if -s is given too.  Defaults  to  read+write  for  user  and
               group (0660) as far as the umask allows it.

       -?, -h  General usage instructions

       -v      Shows version information and exits

       The following options are only available if you invoke spawn-fcgi as root:

       -c <directory>
               Chroot to specified directory; the Unix domain socket is created inside the chroot unless -S is given.

       -S      Create Unix domain socket before chroot().

       -u      User ID to change to.

       -g      Group ID to change to. Defaults to primary group of the user given for -u.

       -U      Change user of the Unix domain socket, defaults to the value of -u. (only used if -s is given)

       -G      Change group of the Unix domain socket, defaults to the primary group of the user given for -U; if -U wasn't given, defaults to the
               value of -g. (only used if -s is given)

SEE ALSO
       svc(8), supervise(8), see http://cr.yp.to/daemontools.html

       multiwatch(1), see http://cgit.stbuehler.de/gitosis/multiwatch/about/

                                                                 21 November 2012                                                    spawn-fcgi(1)
