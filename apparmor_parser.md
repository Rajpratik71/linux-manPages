APPARMOR_PARSER(8)                                                                                 AppArmor                                                                                APPARMOR_PARSER(8)



NAME
       apparmor_parser - loads AppArmor profiles into the kernel

SYNOPSIS
       apparmor_parser [options] <command> [profile]...

       apparmor_parser [options] <command>

       apparmor_parser [-hv] [--help] [--version]

DESCRIPTION
       apparmor_parser is used as a general tool to compile, and manage AppArmor policy, including loading new apparmor.d(5) profiles into the Linux kernel.

       AppArmor profiles restrict the operations available to processes.

       The profiles are loaded into the Linux kernel by the apparmor_parser program, which by default takes its input from standard input. The input supplied to apparmor_parser should be in the format
       described in apparmor.d(5).

COMMANDS
       The command set is broken into four subcategories.

       unprivileged commands
           Commands that don't require any privilege and don't operate on profiles.

       unprivileged profile commands
           Commands that operate on a profile either specified on the command line or read from stdin if no profile was specified.

       privileged commands
           Commands that require the MAC_ADMIN capability within the affected AppArmor namespace to load policy into the kernel or filesystem write permissions to update the affected privileged files
           (cache etc).

       privileged profile commands
           Commands that require privilege and operate on profiles.

Unprivileged commands
       -V, --version
           Print the version number and exit.

       -h, --help
           Give a quick reference guide.

Unprivileged profile commands
       -N, --names
           Produce a list of policies from a given set of profiles (implies -K).

       -p, --preprocess
           Apply preprocessing to the input profile(s) by flattening includes into the output profile and dump to stdout.

       -S, --stdout
           Writes a binary (cached) profile to stdout (implies -K and -T).

       -o file, --ofile file
           Writes a binary (cached) profile to the specified file (implies -K and -T)

Privileged commands
       --purge-cache
           Unconditionally clear out cached profiles.

Privileged profile commands
       -a, --add
           Insert the AppArmor definitions given into the kernel. This is the default action. This gives an error message if a AppArmor definition by the same name already exists in the kernel, or if the
           parser doesn't understand its input. It reports when an addition succeeded.

       -r, --replace
           This flag is required if an AppArmor definition by the same name already exists in the kernel; used to replace the definition already in the kernel with the definition given on standard input.

       -R, --remove
           This flag is used to remove an AppArmor definition already in the kernel.  Note that it still requires a complete AppArmor definition as described in apparmor.d(5) even though the contents of
           the definition aren't used.

OPTIONS
       -B, --binary
           Treat the profile files specified on the command line (or stdin if none specified) as binary cache files, produced with the -S or -o options, and load to the kernel as specified by -a, -r, and
           -R (implies -K and -T).

       -C, --Complain
           Force the profile to load in complain mode.

       -b n, --base n
           Set the base directory for resolving #include directives defined as relative paths.

       -I n, --Include n
           Add element n to the search path when resolving #include directives defined as an absolute paths.

       -f n, --subdomainfs n
           Set the location of the apparmor security filesystem (default is "/sys/kernel/security/apparmor").

       -m n, --match-string n
           Only use match features "n".

       -n n, --namespace-string n
           Force a profile to load in the namespace "n".

       -X, --readimpliesX
           In the case of profiles that are loading on systems were READ_IMPLIES_EXEC is set in the kernel for a given process, load the profile so that any "r" flags are processed as "mr".

       -k, --show-cache
           Report the cache processing (hit/miss details) when loading or saving cached profiles.

       -K, --skip-cache
           Perform no caching at all: disables -W, implies -T.

       -T, --skip-read-cache
           By default, if a profile's cache is found in the location specified by --cache-loc and the timestamp is newer than the profile, it will be loaded from the cache. This option disables this cache
           loading behavior.

       -W, --write-cache
           Write out cached profiles to the location specified in --cache-loc.  Off by default. In cases where abstractions have been changed, and the parser is running with "--replace", it may make sense
           to also use "--skip-read-cache" with the "--write-cache" option.

       --skip-bad-cache
           Skip updating the cache if it contains cached profiles in a bad or inconsistent state

       -L, --cache-loc
           Set the location of the cache directory.  If not specified the cache location defaults to /etc/apparmor.d/cache

       -Q, --skip-kernel-load
           Perform all actions except the actual loading of a profile into the kernel.  This is useful for testing profile generation, caching, etc, without making changes to the running kernel profiles.

           This also removes the need for privilege to execute the commands that manage policy in the kernel

       -q, --quiet
           Do not report on the profiles as they are loaded, and not show warnings.

       -v, --verbose
           Report on the profiles as they are loaded, and show warnings.

       -d, --debug
           Given once, only checks the profiles to ensure syntactic correctness.  Given twice, dumps its interpretation of the profile for checking.

       -D n, --dump=n
           Debug flag for dumping various structures and passes of policy compilation.  A single dump flag can be specified per --dump option, but the dump flag can be passed multiple times.  Note progress
           flags tend to also imply the matching stats flag.

             apparmor_parser --dump=dfa-stats --dump=trans-stats <file>

           Use --help=dump to see a full list of which dump flags are supported

       -O n, --optimize=n
           Set the optimization flags used by policy compilation.  A sinlge optimization flag can be toggled per -O option, but the optimize flag can be passed multiple times.  Turning off some phases of
           the optimization can make it so that policy can't complete compilation due to size constraints (it is entirely possible to create a dfa with millions of states that will take days or longer to
           compile).

           Note: The parser is set to use a balanced default set of flags, that will result in resonable compression but not take excessive amounts of time to complete.

           Use --help=optimize to see a full list of which optimization flags are supported.

CONFIG FILE
       An optional config file /etc/apparmor/parser.conf can be used to specify the default options for the parser, which then can be overridden using the command line options.

       The config file ignores leading whitespace and treats lines that begin with # as comments.  Config options are specified one per line using the same format as the longform command line options
       (without the preceding --).

       Eg.
           #comment

           optimize=no-expr-tree
           optimize=compress-fast

       As with the command line some options accumulate and others override, ie. when there are conflicting versions of switch the last option is the one chosen.

       Eg.
           Optimize=no-minimize
           Optimize=minimize

       would result in Optimize=minimize being set.

       The Include, Dump, and Optimize options accululate except for the inversion option (no-X vs. X), and a couple options that work by setting/clearing multiple options (compress-small).  In that case
       the option will override the flags it sets but will may accumulate with others.

       All other options override previously set values.

BUGS
       If you find any bugs, please report them at <https://bugs.launchpad.net/apparmor/+filebug>.

SEE ALSO
       apparmor(7), apparmor.d(5), subdomain.conf(5), aa_change_hat(2), and <http://wiki.apparmor.net>.



AppArmor 2.8.2                                                                                    2017-07-04                                                                               APPARMOR_PARSER(8)
