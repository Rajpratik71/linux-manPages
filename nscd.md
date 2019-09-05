NSCD(8)                                                                                   Linux Programmer's Manual                                                                                   NSCD(8)



NAME
       nscd - name service cache daemon

DESCRIPTION
       Nscd is a daemon that provides a cache for the most common name service requests.  The default configuration file, /etc/nscd.conf, determines the behavior of the cache daemon.  See nscd.conf(5).

       Nscd  provides  caching  for  accesses  of  the  passwd(5), group(5), hosts(5) service(5) and netgroup databases through standard libc interfaces, such as getpwnam(3), getpwuid(3), getgrnam(3), get-
       grgid(3), gethostbyname(3), and others.

       There are two caches for each database: a positive one for items found, and a negative one for items not found.  Each cache has a separate TTL (time-to-live) period for  its  data.   Note  that  the
       shadow file is specifically not cached.  getspnam(3) calls remain uncached as a result.

OPTIONS
       --help will give you a list with all options and what they do.

NOTES
       The  daemon  will try to watch for changes in configuration files appropriate for each database (e.g., /etc/passwd for the passwd database or /etc/hosts and /etc/resolv.conf for the hosts database),
       and flush the cache when these are changed.  However, this will happen only after a short delay (unless the inotify(7) mechanism is available and glibc 2.9 or later is  available),  and  this  auto-
       detection  does not cover configuration files required by nonstandard NSS modules, if any are specified in /etc/nsswitch.conf.  In that case, you need to run the following command after changing the
       configuration file of the database so that nscd invalidates its cache:

           $ nscd -i <database>

SEE ALSO
       nscd.conf(5), nsswitch.conf(5)

COLOPHON
       This page is part of release 4.02 of the Linux man-pages project.  A description of the project,  information  about  reporting  bugs,  and  the  latest  version  of  this  page,  can  be  found  at
       http://www.kernel.org/doc/man-pages/.



GNU                                                                                               2015-05-07                                                                                          NSCD(8)
