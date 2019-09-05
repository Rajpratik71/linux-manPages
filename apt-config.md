APT-CONFIG(8)                                                                                     APT                                                                                    APT-CONFIG(8)

NAME
       apt-config - APT Configuration Query program

SYNOPSIS
       apt-config [--empty] [--format '%f "%v";%n'] [-o=config_string] [-c=config_file] {shell | dump | {-v | --version} | {-h | --help}}

DESCRIPTION
       apt-config is an internal program used by various portions of the APT suite to provide consistent configurability. It accesses the main configuration file /etc/apt/apt.conf in a manner that
       is easy to use for scripted applications.

       Unless the -h, or --help option is given, one of the commands below must be present.

       shell
           shell is used to access the configuration information from a shell script. It is given pairs of arguments, the first being a shell variable and the second the configuration value to
           query. As output it lists shell assignment commands for each value present. In a shell script it should be used as follows:

               OPTS="-f"
               RES=`apt-config shell OPTS MyApp::options`
               eval $RES
           This will set the shell environment variable $OPTS to the value of MyApp::options with a default of -f.

           The configuration item may be postfixed with a /[fdbi]. f returns file names, d returns directories, b returns true or false and i returns an integer. Each of the returns is normalized
           and verified internally.

       dump
           Just show the contents of the configuration space.

OPTIONS
       All command line options may be set using the configuration file, the descriptions indicate the configuration option to set. For boolean options you can override the config file by using
       something like -f-,--no-f, -f=no or several other variations.

       --empty
           Include options which have an empty value. This is the default, so use --no-empty to remove them from the output.

       --format '%f "%v";%n'
           Defines the output of each config option. %t will be replaced with its individual name, %f with its full hierarchical name and %v with its value. Use uppercase letters and special
           characters in the value will be encoded to ensure that it can e.g. be safely used in a quoted-string as defined by RFC822. Additionally %n will be replaced by a newline, and %N by a tab.
           A % can be printed by using %%.

       -h, --help
           Show a short usage summary.

       -v, --version
           Show the program version.

       -c, --config-file
           Configuration File; Specify a configuration file to use. The program will read the default configuration file and then this configuration file. If configuration settings need to be set
           before the default configuration files are parsed specify a file with the APT_CONFIG environment variable. See apt.conf(5) for syntax information.

       -o, --option
           Set a Configuration Option; This will set an arbitrary configuration option. The syntax is -o Foo::Bar=bar.  -o and --option can be used multiple times to set different options.

SEE ALSO
       apt.conf(5)

DIAGNOSTICS
       apt-config returns zero on normal operation, decimal 100 on error.

BUGS
       APT bug page[1]. If you wish to report a bug in APT, please see /usr/share/doc/debian/bug-reporting.txt or the reportbug(1) command.

AUTHORS
       Jason Gunthorpe

       APT team

NOTES
        1. APT bug page
           http://bugs.debian.org/src:apt

APT 1.6.8                                                                                  30 November 2013                                                                              APT-CONFIG(8)
