novnc_server(1)                                                                                 USER COMMANDS                                                                                 novnc_server(1)



NAME
       novnc_server | noVNC proxy server

SYNOPSIS
       novnc_server [--listen PORT] [--vnc VNC_HOST:PORT] [--cert CERT]

       Starts the WebSockets proxy and a mini-webserver and provides a cut-and-paste URL to go to.

           --listen PORT         Port for proxy/webserver to listen on
                                 Default: 6080
           --vnc VNC_HOST:PORT   VNC server host:port proxy target
                                 Default: localhost:5900
           --cert CERT           Path to combined cert/key file
                                 Default: self.pem


AUTHOR
       Joel Martin (github@martintribe.org)


SEE ALSO
       websockify(1)



version 0.3                                                                                      June 8, 2012                                                                                 novnc_server(1)
