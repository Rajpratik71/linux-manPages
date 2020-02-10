GETBUILDLOG(1)                                                                           General Commands Manual                                                                           GETBUILDLOG(1)

NAME
       getbuildlog - download build logs from Debian auto-builders

SYNOPSIS
       getbuildlog package [version-pattern] [architecture-pattern]

DESCRIPTION
       getbuildlog downloads build logs of package from Debian auto-builders. It downloads build logs of all versions and for all architectures if version-pattern and architecture-pattern are not spec‐
       ified or empty, otherwise only build logs whose versions match version-pattern and build logs whose architectures match architecture-pattern will be downloaded. The version and architecture pat‐
       terns are interpreted as extended regular expressions as described in grep(1).

       If version-pattern is "last" then only the logs for the most recent version of package found on buildd.debian.org will be downloaded.

       If version-pattern is "last-all" then the logs for the most recent version found on each build log index will be downloaded.

OPTIONS
       -h, --help
              Show usage information and examples.

       -V, --version
              Show version and copyright information.

EXAMPLES
       getbuildlog hello 2\.2-1 amd64
              Download amd64 build log for hello version 2.2-1.

       getbuildlog glibc "" mips.*
              Download mips(el) build logs of all glibc versions.

       getbuildlog wesnoth .*bpo.*
              Download all build logs of backported wesnoth versions.

AUTHOR
       Written by Frank S. Thomas <fst@debian.org>.

DEBIAN                                                                                       Debian Utilities                                                                              GETBUILDLOG(1)
