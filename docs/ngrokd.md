ngrokd(8)                                                   BSD System Manager's Manual                                                  ngrokd(8)

NAME
     nrgokd — secure introspectable tunnels to localhost

SYNOPSIS
     nrgokd [options]

DESCRIPTION
     ngrok creates a tunnel from the public internet to a port on your local machine. You can give this URL to anyone to allow them to try out a
     web site you're developing without doing any deployment.

     It captures all traffic through the tunnel. It displays information about the HTTP traffic for your inspection. Raw request/response bytes,
     parsed headers and form data, JSON/XML syntax checking and more are included. It can also replay requests.

     nrgokd is the server part that can be used instead of the public ngrok.com server.

     To get available options, use ngrokd -h.  The most important one is -domain which takes the domain where the tunnels are hosted.

SEE ALSO
     ngrok(8)

AUTHORS
     The nrgokd program was written by Alan Shreve.

BSD                                                              January 25, 2014                                                              BSD
