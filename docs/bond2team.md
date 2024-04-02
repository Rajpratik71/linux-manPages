BOND2TEAM(1)                                                                           Bonding to Team conversion tool                                                                           BOND2TEAM(1)



NAME
       bond2team — Converts bonding configuration to team

SYNOPSIS
       bond2team [options]

DESCRIPTION
       bond2team is a tool to convert bonding options to team trying as much as possible to keep the original functionality.

       The resulting files are saved in a temporary directory using ifcfg style by default. In the case of converting an ifcfg file, it translates the bonding options to team, preserving all other options.
       In that case, it converts the respective slave ifcfg files to team port, preserving all their other options too. In case of converting from given bonding options in the command line,  the  tool  can
       use the specified ports as team ports.

OPTIONS
       --master <interface>
              Specify the interface name or ifcfg file to convert. If the interface name is specified, the tool will look at /etc/sysconfig/network-scripts/ for the respective ifcfg file.

       --rename <interface>
              This  is  a convenient option to replace the original interface name by the specified name. For instance, if --master specifies bond0, it is possible to use --rename team0 to change the final
              interface name to team0.

       --ifcfg
              Set the output format to ifcfg config style. [default]

       --json Set the output format to JSON style. See teamd.conf(5) for further details.

       --bonding_opts '<bonding options>'
              Specify the bonding options to be converted instead of reading them from the ifcfg file.

       --port <interface>
              Set the specified interface as a team port.

       --configdir <directory>
              Change the ifcfg configuration path from /etc/sysconfig/network-scripts to the specified <directory>.

       --outputdir <directory>
              Set the output directory to <directory>.

       --stdout
              Print the result to the screen instead of writing to files.

       --debug
              Increase the debugging level.

       --quiet
              Disallow any messages to be printed to console.

       --version
              Print tool version to console and exit.

       --help Print help text to console and exit.

       --examples
              Print common usage examples to console and exit.

EXAMPLES
       To convert the current 'bond0' ifcfg configuration to team ifcfg:

       # bond2team --master bond0

       To convert the current 'bond0' ifcfg configuration to team ifcfg renaming the interface name to 'team0'.  Caution : firewall rules, alias interfaces, etc., that might be tied to the original  inter‐
       face name can break after the renaming because the tool will only change the ifcfg file, nothing else.

       # bond2team --master bond0 --rename team0

       To convert given bonding parameters with ports without any ifcfg:

       # bond2team --bonding_opts 'mode=1 miimon=500 primary=eth1 primary_reselect=0' --port eth1 --port eth2 --port eth3 --port eth4

       For more examples, see the option --examples.

CAVEATS
       The tool will not convert any other configuration which might be tied to the current setup. For instance, firewall rules, alias interfaces, bridges, and so on.

AUTHOR
       Flavio Leitner is the original author of the tool.  Jiri Pirko is the original author and current maintainer of libteam.

SEE ALSO
       teamd(8), teamdctl(8), teamd.conf(5), teamnl(8)



libteam                                                                                           2013-07-18                                                                                     BOND2TEAM(1)
