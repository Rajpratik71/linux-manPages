bt-obex(1)                                                          bluez-tools                                                         bt-obex(1)

NAME
       bt-obex - a bluetooth OBEX client/server

SYNOPSIS
       bt-obex [OPTION...]

       Help Options:
         -h, --help

       Application Options:
         -a, --adapter=<name|mac>
         -s, --server [<path>]
         -p, --opp <name|mac> <file>
         -f, --ftp=<name|mac>

DESCRIPTION
       This utility implemented support of Object Push Profile (OPP) and File Transfer Profile (FTP).  You can send and receive files to/from
       remote device using this tool.

OPTIONS
       -h, --help
           Show help

       -a, --adapter <name|mac>
           Specify adapter to use by his Name or MAC address
           (if this option does not defined - default adapter used)

       -s, --server [<path>]
           Register agent at OBEX server and set incoming/root directory to
           `path` or current folder will be used; Agent is used to
           accept/reject incoming bluetooth object push requests

       -p, --opp <name|mac> <file>
           Send local file to the specified remote device using object push
           profile

       -f, --ftp <name|mac>
           Start FTP session with remote device; If session opened
           successfuly, FTP shell will be opened

           FTP commands:

               help                    Show help message
               exit                    Close FTP session
               cd <folder>             Change the current folder of the remote device
               mkdir <folder>          Create a new folder in the remote device
               ls                      List folder contents
               get <src> <dst>         Copy the src file (from remote device) to the dst file (on local filesystem)
               put <src> <dst>         Copy the src file (from local filesystem) to the dst file (on remote device)
               cp <src> <dst>          Copy a file within the remote device from src file to dst file
               mv <src> <dst>          Move a file within the remote device from src file to dst file
               rm <target>             Deletes the specified file/folder

AUTHOR
       Alexander Orlenko <zxteam@gmail.com>.

SEE ALSO
       bt-adapter(1) bt-agent(1) bt-device(1) bt-network(1)

                                                                    2014-08-01                                                          bt-obex(1)
