yum-config-manager(1)                                                                                                                                                                   yum-config-manager(1)



NAME
       yum-config-manager - manage yum configuration options and yum repositories

SYNOPSIS
       yum-config-manager [options] [section ...]

DESCRIPTION
       yum-config-manager is a program that can manage main yum configuration options, toggle which repositories are enabled or disabled, and add new repositories.

       Unless --add-repo is used, the program will output the current configuration of the selected sections, and optionally save it back to the corresponding files.

       By  default, if no positional arguments are specified, the program will select the [main] section and each enabled repository.  You can override this by specifying your own list of sections as argu‐
       ments (these may also include disabled repositories).  A section can either be main or a repoid.

OPTIONS
       -h, --help
              Display a help message, and then quit.

       --setopt=option=value
              Set any config option in yum config or repo files. For options in the global config just use: --setopt=option=value for  repo  options  use:  --setopt=repoid.option=value.   The  latter  form
              accepts wildcards in repoid that will be expanded to the selected sections.  If repoid contains no wildcard, it will automatically be selected; this is useful if you are addressing a disabled
              repo, in which case you don't have to additionally pass it as an argument.

       --save Save the current options (useful with --setopt).

       --enable
              Enable the specified repos (automatically saves). To enable all repositories run "yum-config-manager --enable \*".

       --disable
              Disable the specified repos (automatically saves). To disable all repositories run "yum-config-manager --disable \*".

       --add-repo=ADDREPO
              Add (and enable) the repo from the specified file or url.

ADDITIONAL OPTIONS
       Yum-config-manager inherits all other options from yum. See the yum(8) man page for more information.


EXAMPLES
       Show the configuration of [main] and the repos foo and bar:

              yum-config-manager main foo bar

       Enable the repos foo and bar:

              yum-config-manager --enable foo bar

       Change a global option:

              yum-config-manager --setopt=installonly_limit=5 --save

       Change a repo option of the repo foo (works even if foo is disabled):

              yum-config-manager --setopt=foo.skip_if_unavailable=1 --save

       Change a repo option of more repos at once:

              yum-config-manager --setopt=\*.skip_if_unavailable=1 --save foo bar baz

       Change a repo option of all the enabled repos:

              yum-config-manager --setopt=\*.skip_if_unavailable=1 --save

       Change a repo option of all the configured (that is, enabled and disabled) repos:

              yum-config-manager --setopt=\*.skip_if_unavailable=1 --save \*


SEE ALSO
       yum.conf (5)
       http://yum.baseurl.org/


AUTHORS
       See the Authors file included with this program.



                                                                                               13 January 2013                                                                          yum-config-manager(1)
