BROADWAYD(1)                                                                                  User Commands                                                                                  BROADWAYD(1)

NAME
       broadwayd - Broadway display server

SYNOPSIS
       broadwayd [--port PORT] [--address ADDRESS] [--unixsocket ADDRESS] [:DISPLAY]

DESCRIPTION
       broadwayd is a display server for the Broadway GDK backend. It allows multiple GTK+ applications to display their windows in the same web browser, by connecting to broadwayd.

       When using broadwayd, specify the display number to use, prefixed with a colon, similar to X. The default display number is 1.

           broadwayd :5

       Then point your web browser at http://127.0.0.1:8084. Start your applications like this:

           BROADWAY_DISPLAY=:5 gtk3-demo

       You can add password protection for your session by creating a file in $XDG_CONFIG_HOME/broadway.passwd or $HOME/.config/broadway.passwd with a crypt(3) style password hash. A simple way to
       generate it is with openssl:

           openssl passwd -1  > ~/.config/broadway.passwd

OPTIONS
       --port
           Use PORT as the HTTP port, instead of the default 8080 + (DISPLAY - 1).

       --address
           Use ADDRESS as the HTTP address, instead of the default http://127.0.0.1:PORT.

       --unixsocket
           Use ADDRESS as the unix domain socket address. This option overrides --address and --port. It is available only on Unix-like systems.

GTK+                                                                                                                                                                                         BROADWAYD(1)
