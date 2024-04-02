wlfreerdp(1)                                                                                       FreeRDP                                                                                       wlfreerdp(1)



NAME
       wlfreerdp - FreeRDP wayland client

SYNOPSIS
       wlfreerdp [file] [default_client_options] [/v:<server>[:port]] [/version] [/help]

DESCRIPTION
       wlfreerdp  is  a  wayland  Remote Desktop Protocol (RDP) client which is part of the FreeRDP project. A RDP server is built-in to many editions of Windows. Alternative servers included xrdp and VRDP
       (VirtualBox).

OPTIONS
       The wayland client also supports a lot of the default client options which are not described here. For details on those see the xfreerdp(1) man page.

       /v:<server>[:port]
              The server hostname or IP, and optionally the port, to connect to.

       /version
              Print the version and exit.

       /help  Print the help and exit.

EXIT STATUS
       0      Successful program execution.

       not 0  On failure.


SEE ALSO
       xfreerdp(1) wlog(7)


AUTHOR
       FreeRDP <team@freerdp.com>



2.0.0-rc4                                                                                         2017-01-12                                                                                     wlfreerdp(1)
