KDUMPCTL(8)                                                                                System Manager's Manual                                                                                KDUMPCTL(8)



NAME
       kdumpctl - control interface for kdump


SYNOPSIS
       kdumpctl COMMAND


DESCRIPTION
       kdumpctl is used to check or control the kdump service.  In most cases, you should use systemctl to start / stop / enable kdump service instead. However, kdumpctl provides more details for debug and
       a helper to setup ssh key authentication.


COMMANDS
       start  Start the service.

       stop   Stop the service.

       status Prints the current status of kdump service.  It returns non-zero value if kdump is not operational.

       restart
              Is equal to start; stop

       propagate
              Helps to setup key authentication for ssh storage since it's impossible to use password authentication during kdump.

       showmem
              Prints the size of reserved memory for crash kernel in megabytes.


SEE ALSO
       kdump.conf(5), mkdumprd(8)



kexec-tools                                                                                       2015-07-13                                                                                      KDUMPCTL(8)
