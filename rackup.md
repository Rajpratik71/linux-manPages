RACKUP(1)                                                                                    RACKUP(1)

NAME
       rackup

       rackup(1) -- An utility for run Rack-based applications

SYNOPSIS
       rackup [ruby options] [rack options] [rackup config]

DESCRIPTION
       Rackup is a useful tool for running Rack applications, which uses the Rack::Builder DSL to con‐
       figure middleware and build up applications easily.

       rackup automatically figures out the environment it is run in, and  runs  your  application  as
       FastCGI, CGI, or standalone with Mongrel or WEBrick -all from the same configuration.

OPTIONS
       Ruby options:

       -e, --eval [LINE]
              evaluate a LINE of code

       -d, --debug
              set debugging flags (set $DEBUG to true)

       -w, --warn
              turn warnings on for your script

       -I, --include [PATH]
              specify $LOAD_PATH (may be used more than once)

       -r, --require [LIBRARY]
              require the library, before executing your script

       Rack options:

       -s, --server [SERVER]
              serve using SERVER (webrick/mongrel)

       -o, --host [HOST]
              listen on HOST (default: 0.0.0.0)

       -p, --port [PORT]
              use PORT (default: 9292)

       -E, --env [ENVIRONMENT]
              use ENVIRONMENT for defaults (default: development)

       -D, --daemonize
              run daemonized in the background

       -P, --pid [FILE]
              file to store PID (default: rack.pid)

       Common options:

       -h, --help
              Show the help message

       --version
              Show version

EXAMPLES
       This is a simple example on how to start an application based on Rack with rackup:

       $ rackup -Ilib blog/config.ru

       [2010-12-10 15:01:11] INFO WEBrick 1.3.1

       [2010-12-10 15:01:11] INFO ruby 1.9.2 (2010-08-18) [x86_64-linux]

       [2010-12-10 15:01:11] INFO WEBrick::HTTPServer#start: pid=4496 port=9292

AUTHORS
       Copyright (C) 2007, 2008, 2009, 2010 Christian Neukirchen <http://purl.org/net/chneukirchen>

       For  a  complete  list  of  authors  and  contributors  to the project, please take a look here
       https://github.com/rack/rack/contributors

       This manual page was written by Ermenegildo Fiorito fiorito.g@gmail.com for the Debian Project

SEE ALSO
       ruby(1) http://rack.rubyforge.org

                                             December 2010                                   RACKUP(1)
