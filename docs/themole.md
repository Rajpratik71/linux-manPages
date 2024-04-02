THEMOLE(1)                                                    General Commands Manual                                                   THEMOLE(1)

NAME
       themole - automatic SQL injection exploitation tool

SYNOPSIS
       themole [ -h ] [ -u url ] [ -n needle ] [-t num_threads]

DESCRIPTION
       The Mole is a command line interface SQL Injection exploitation tool.  This application is able to exploit both union-based and blind bool‐
       ean-based injections.

       Every action The Mole can execute is triggered by a specific command.  All this application requires in order to exploit a SQL Injection is
       the URL(including the parameters) and a needle(a string) that appears in the server's response whenever the injection parameter generates a
       valid query, and does not appear otherwise.

OPTIONS
       -h     Shows the help message and exits.

       -u url Sets the url of the mole's instance to url.

       -n needle
              Sets the needle of the mole's instance to needle. It must be a string that appears when the injection returns  true  and  disappears
              when the injection is false.

       -t threads
              Sets the max number of concurrent requests that the mole will be making.  Cannot be changed at runtime.

SEE ALSO
       The program provides interactive documentation, refer also to the official README file.

AUTHOR
       This manual page was written by Santiago Alessandri <salessandri@nasel.com.ar>

                                                                 November 24 2011                                                       THEMOLE(1)
