PROXY(1)                                                           User Commands                                                          PROXY(1)

NAME
       proxy - Display the proxy server that should be used to reach a given a network resource

SYNOPSIS
       proxy

DESCRIPTION
       Display the proxy server that should be used to reach a given a network resource.

       libproxy is a library that provides automatic proxy configuration management using different backends.

EXAMPLE
       echo http://www.example.com/ | proxy
         http://webcache:3128 direct://

AUTHOR
       This manual page was written by Laurent Bigonville ⟨bigon@debian.org⟩, for the Debian GNU/Linux system (but may be used by others).

SEE ALSO
       libproxy ⟨http://code.google.com/p/libproxy/⟩.

libproxy                                                          September 2013                                                          PROXY(1)
