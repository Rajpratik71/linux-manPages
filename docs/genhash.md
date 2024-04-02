genhash(1)                                                                                 General Commands Manual                                                                                 genhash(1)



NAME
       genhash - md5 hash generation tool for remote web pages

SYNOPSIS
       genhash [options] [-s server-address] [-p port] [-u url]

DESCRIPTION
       genhash  is  a tool used for generating md5sum hashes of remote web pages.  genhash can use HTTP or HTTPS to connect to the web page.  The output by this utility includes the HTTP header, page data,
       and the md5sum of the data.  This md5sum can then be used within the keepalived(8) program, for monitoring HTTP and HTTPS services.

OPTIONS
       --use-ssl, -S
              Use SSL to connect to the server.

       --server <host>, -s
              Specify the ip address to connect to.

       --port <port>, -p
              Specify the port to connect to.

       --url <url>, -u
              Specify the path to the file you want to generate the hash of.

       --use-virtualhost <host>, -V
              Specify the virtual host to send along with the HTTP headers.

       --hash <alg>, -H
              Specify the hash algorithm to make a digest of the target page.  Consult the help screen for list of available ones with a mark of the default one.

       --verbose, -v
              Be verbose with the output.

       --help, -h
              Display the program help screen and exit.

       --release, -r
              Display the release number (version) and exit.



SEE ALSO
       keepalived(8), keepalived.conf(5)

AUTHOR
       genhash was written by Alexandre Cassen <acassen@linux-vs.org>.

       This man page was contributed by Andres Salomon <dilinger@voxel.net> for the Debian GNU/Linux system (but may be used by others).




                                                                                                   Feb 2004                                                                                        genhash(1)
