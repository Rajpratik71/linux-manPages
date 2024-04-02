bt-agent(1)                                                         bluez-tools                                                        bt-agent(1)

NAME
       bt-adapter - a bluetooth agent

SYNOPSIS
       bt-agent [OPTION...]

       Help Options:
         -h, --help

       Application Options:
         -c, --capability=<capability>
         -p, --pin
         -d, --daemon

DESCRIPTION
       This interactive utility is used to manage incoming Bluetooth requests (eg. request of pincode, request of authorize a connection/service
       request, etc).

OPTIONS
       -h, --help
           Show help

       -c, --capability <capability>
           Specify the input and output capabilities of the agent.
           `capability` can be one of:
               DisplayOnly
               DisplayYesNo (default)
               KeyboardOnly
               NoInputNoOutput
           (if this option does not defined - `DisplayYesNo' will be used)

       -p, --pin <file path<gt>
           Use a file that holds a list of authorization codes for each device by name or mac address.
           The contents of the file should be in this format:
               AA:BB:CC:DD:EE:FF    123456
               RemoteDeviceName     *         (accept any pin code)
           If a pin file is included, it will check the passkey of the pairing device against the key included in the file. It will automatically
       authorize the device if the key matches, otherwise it will request the user for manual authorization.

       -d, --daemon
           Run the agent as a background process (as a daemon).
           The agent will rely on a pin file and request no manual user authorization. Any devices that attempt to pair without a valid passkey
       defined in the pin file will be automatically rejected.

AUTHOR
       Alexander Orlenko <zxteam@gmail.com>.

SEE ALSO
       bt-adapter(1) bt-device(1) bt-network(1)

                                                                    2014-08-03                                                         bt-agent(1)
