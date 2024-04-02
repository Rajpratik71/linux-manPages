VBOXWEBSRV(1)                                User Commands                               VBOXWEBSRV(1)

NAME
       vboxwebsrv - x86 virtualization solution

SYNOPSIS
       vboxwebsrv [options]

DESCRIPTION
       Oracle VM VirtualBox web service (C) 2007-2019 Oracle Corporation All rights reserved.

       Supported  options (default values in brackets): --help, -h:            Print this help message
       and exit.  --background, -b:      Run in background (daemon mode).  --host, -H:             The
       host  to  bind to (localhost).  --port, -p:            The port to bind to (18083).  --ssl, -s:
       Enable SSL/TLS encryption.  --keyfile, -K:         Server key and certificate file, PEM  format
       ("").   --passwordfile,  -a:     File  name  for  password  to  server key ("").  --cacert, -c:
       CA certificate file, PEM  format  ("").   --capath,  -C:           CA  certificate  path  ("").
       --dhfile, -D:          DH file name or DH key length in bits ("").  --randfile, -r:        File
       containing seed for random number generator ("").  --timeout, -t:          Session  timeout  in
       seconds;  0  =  disable  timeouts (300).  --check-interval, -i:  Frequency of timeout checks in
       seconds (5).  --threads, -T:         Maximum number of worker threads to run in parallel (100).
       --keepalive,  -k:       Maximum number of requests before a socket will be closed (100).  --au‐
       thentication, -A:  Authentication method for the webservice ("").   --verbose,  -v:          Be
       verbose.   --pidfile,  -P:          Name  of  the PID file which is created when the daemon was
       started.  --logfile, -F:         Name of file to write log  to  (no  file).   --logrotate,  -R:
       Number  of  log  files (0 disables log rotation).  --logsize, -S:         Maximum size of a log
       file to trigger rotation (bytes).  --loginterval, -I:     Maximum time interval to trigger  log
       rotation (seconds).

vboxwebsrv                                   January 2019                                VBOXWEBSRV(1)
