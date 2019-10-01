show-installed(1)                                                                                                                                                                           show-installed(1)



NAME
       show-installed - show installed RPM packages and descriptions

SYNOPSIS
       show-installed [options]

DESCRIPTION
       show-installed gives a compact description of the packages installed (or given) making use of the comps groups found in the repositories.

OPTIONS
       -h, --help
              show this help message and exit

       -f FORMAT, --format=FORMAT
              yum, kickstart or human; yum gives the result as a yum command line; kickstart the content of a %packages section; "human" readable is default.

       -i INPUT, --input=INPUT
              File  to  read  the package list from instead of using the rpmdb. - for stdin. The file must contain package names only separated by white space (including newlines). rpm -qa --qf='%{name}\n'
              produces proper output.

       -o OUTPUT, --output=OUTPUT
              File to write the result to. Stdout is used if option is omitted.

       -q, --quiet
              Do not show warnings.

       -e, --no-excludes
              Only show groups that are installed completely. Do not use exclude lines.

       --global-excludes
              Print exclude lines at the end and not after the groups requiring them.

       --global-addons
              Print package names at the end and not after the groups offering them as addon.

       --addons-by-group
              Also show groups not selected to sort packages contained by them. Those groups are commented out with a "# " at the begin of the line.

       -m, --allow-mandatories
              Check if just installing the mandatory packages gives better results. Uses "." to mark those groups.

       -a, --allow-all
              Check if installing all packages in the groups gives better results. Uses "*" to mark those groups.

       --ignore-missing
              Ignore packages missing in the repos.

       --ignore-missing-excludes
              Do not produce exclude lines for packages not in the repository.




Florian Festi                                                                                  21 October 2010                                                                              show-installed(1)
