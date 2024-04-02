TEAMNL(8)                                                                                   Team Netlink Interface                                                                                  TEAMNL(8)



NAME
       teamnl — team network device Netlink interface tool

SYNOPSIS
       teamnl [-p port_name] [-a array_index] team_device command [command_args...]
       teamnl -h

DESCRIPTION
       teamnl  is  a  tool  enabling  interaction  with a team device via the team driver Netlink interface. This tools serves mainly for debugging purposes. Note that it makes no sense to use this tool to
       change options on team device controlled by a teamd instance.

OPTIONS
       -h, --help
              Print help text to console and exit.

       -p ifname, --port_name ifname
              Select per-port option of provided interface name.

       -a index, --array_index index
              Select array option of provided array index.

COMMAND
       ports  Dumps team ports.

       option Dumps team options.

       getoption opt_name
              Gets option by selected name.

       setoption opt_name opt_value
              Sets option by selected name.

       monitor opt_style
              Monitors changes made to options, ports and interface information. Style can be either "changed" (default) or "all".

SEE ALSO
       teamd(8), teamdctl(8), teamd.conf(5)

AUTHOR
       Jiri Pirko is the original author and current maintainer of libteam.



libteam                                                                                           2013-04-01                                                                                        TEAMNL(8)
