DCONF(1)                        User Commands                        DCONF(1)

NAME
       dconf - Simple tool for manipulating a dconf database

SYNOPSIS
       dconf read KEY

       dconf list DIR

       dconf write KEY VALUE

       dconf reset [-f] PATH

       dconf compile OUTPUT KEYFILEDIR

       dconf update

       dconf watch PATH

       dconf dump DIR

       dconf load DIR

       dconf help [COMMAND]

DESCRIPTION
       The dconf program can perform various operations on a dconf database,
       such as reading or writing individual values or entire directories.
       This tool operates on dconf directly, without using gsettings schema
       information. Therefore, it cannot perform type and consistency checks
       on values. The gsettings(1) utility is an alternative if such checks
       are needed.

       The DIR arguments must be directory paths (starting and ending with
       '/'), the KEY arguments must be key paths (starting, but not ending
       with '/') and the PATH arguments can be either directory or key paths.

       The OUTPUT argument must the location to write a (binary) dconf
       database to and the KEYFILEDIR argument must be a .d directory
       containing keyfiles.

       VALUE arguments must be in GVariant format, so e.g. a string must
       include explicit quotes: "'foo'". This format is also used when
       printing out values.

       Note that dconf needs a D-Bus session bus connection to write changes
       to the dconf database.

COMMANDS
       read
           Read the value of a key.

       list
           List the sub-keys and sub-directories of a directory.

       write
           Write a new value to a key.

       reset
           Reset a key or an entire directory. For directories, -f must be
           specified.

       compile
           Compile a binary database from keyfiles.

           The result is always in little-endian byte order, so it can be
           safely installed in 'share'. If it is used on a big endian
           machine, dconf will automatically byteswap the contents on read.

       update
           Update the system dconf databases.

       watch
           Watch a key or directory for changes.

       dump
           Dump an entire subpath to stdout. The output is in a keyfile-like
           format, with values in GVariant syntax.

       load
           Populate a subpath from stdin. The expected format is the same as
           produced by dump.

       help
           Display help and exit. If COMMAND is given, display help for this
           command.

ENVIRONMENT
       DCONF_PROFILE
           This environment variable determines which dconf profile to use.
           See dconf(7).

SEE ALSO
       dconf(7), gsettings(1), dconf-editor(1)

dconf                                                                DCONF(1)
