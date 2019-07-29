SYSTEMD-ESCAPE(1)                                                 systemd-escape                                                 SYSTEMD-ESCAPE(1)

NAME
       systemd-escape - Escape strings for usage in system unit names

SYNOPSIS
       systemd-escape [OPTIONS...] [STRING...]

DESCRIPTION
       systemd-escape may be used to escape strings for inclusion in systemd unit names. The command may be used to escape and to undo escaping of
       strings.

       The command takes any number of strings on the command line, and will process them individually, one after another. It will output them
       separated by spaces to stdout.

       By default, this command will escape the strings passed, unless --unescape is passed which results in the inverse operation being applied.
       If --mangle is given, a special mode of escaping is applied instead, which assumes the string is already escaped but will escape everything
       that appears obviously non-escaped.

OPTIONS
       The following options are understood:

       --suffix=
           Appends the specified unit type suffix to the escaped string. Takes one of the unit types supported by systemd, such as ".service" or
           ".mount". May not be used in conjunction with --template=, --unescape or --mangle.

       --template=
           Inserts the escaped strings in a unit name template. Takes a unit name template such as foobar@.service May not be used in conjunction
           with --suffix=, --unescape or --mangle.

       --path, -p
           When escaping or unescaping a string, assume it refers to a file system path. This enables special processing of the initial "/" of the
           path.

       --unescape
           Instead of escaping the specified strings, undo the escaping, reversing the operation. May not be used in conjunction with --suffix=,
           --template= or --mangle.

       --mangle
           Like --escape, but only escape characters that are obviously not escaped yet, and possibly automatically append an appropriate unit
           type suffix to the string. May not be used in conjunction with --suffix=, --template= or --unescape.

       -h, --help
           Print a short help text and exit.

       --version
           Print a short version string and exit.

EXAMPLES
       Escape a single string:

           $ systemd-escape 'Hallöchen, Meister'
           Hall\xc3\xb6chen\x2c\x20Meister

       To undo escaping on a single string:

           $ systemd-escape -u 'Hall\xc3\xb6chen\x2c\x20Meister'
           Hallöchen, Meister

       To generate the mount unit for a path:

           $ systemd-escape -p --suffix=mount "/tmp//waldi/foobar/"
           tmp-waldi-foobar.mount

       To generate instance names of three strings

           $ systemd-escape --template=systemd-nspawn@.service 'My Container 1' 'containerb' 'container/III'
           systemd-nspawn@My\x20Container\x201.service systemd-nspawn@containerb.service systemd-nspawn@container-III.service

EXIT STATUS
       On success, 0 is returned, a non-zero failure code otherwise.

SEE ALSO
       systemd(1), systemctl(1)

systemd 229                                                                                                                      SYSTEMD-ESCAPE(1)
