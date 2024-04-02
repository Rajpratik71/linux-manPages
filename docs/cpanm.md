CPANM(1)                                                                             User Contributed Perl Documentation                                                                             CPANM(1)



NAME
       cpanm - get, unpack build and install modules from CPAN

SYNOPSIS
         cpanm Test::More                                 # install Test::More
         cpanm MIYAGAWA/Plack-0.99_05.tar.gz              # full distribution path
         cpanm http://example.org/LDS/CGI.pm-3.20.tar.gz  # install from URL
         cpanm ~/dists/MyCompany-Enterprise-1.00.tar.gz   # install from a local file
         cpanm --interactive Task::Kensho                 # Configure interactively
         cpanm .                                          # install from local directory
         cpanm --installdeps .                            # install all the deps for the current directory
         cpanm -L extlib Plack                            # install Plack and all non-core deps into extlib
         cpanm --mirror http://cpan.cpantesters.org/ DBI  # use the fast-syncing mirror

COMMANDS
       (arguments)
           Command line arguments can be either a module name, distribution file, local file path, HTTP URL or git repository URL. Following commands will all work as you expect.

               cpanm Plack
               cpanm Plack/Request.pm
               cpanm MIYAGAWA/Plack-1.0000.tar.gz
               cpanm /path/to/Plack-1.0000.tar.gz
               cpanm http://cpan.metacpan.org/authors/id/M/MI/MIYAGAWA/Plack-0.9990.tar.gz
               cpanm git://github.com/miyagawa/Plack.git

           Additionally, you can use the notation using "~" and "@" to specify version for a given module. "~" specifies the version requirement in the CPAN::Meta::Spec format, while "@" pins the exact
           version, and is a shortcut for "~"== VERSION"".

               cpanm Plack~1.0000                 # 1.0000 or later
               cpanm Plack~">= 1.0000, < 2.0000"  # latest of 1.xxxx
               cpanm Plack@0.9990                 # specific version. same as Plack~"== 0.9990"

           The version query including specific version or range will be sent to MetaCPAN to search for previous releases. The query will search for BackPAN archives by default, unless you specify "--dev"
           option, in which case, archived versions will be filtered out.

           For a git repository, you can specify a branch, tag, or commit SHA to build. The default is "master"

               cpanm git://github.com/miyagawa/Plack.git@1.0000        # tag
               cpanm git://github.com/miyagawa/Plack.git@devel         # branch

       -i, --install
           Installs the modules. This is a default behavior and this is just a compatibility option to make it work like cpan or cpanp.

       --self-upgrade
           Upgrades itself. It's just an alias for:

             cpanm App::cpanminus

       --info
           Displays the distribution information in "AUTHOR/Dist-Name-ver.tar.gz" format in the standard out.

       --installdeps
           Installs the dependencies of the target distribution but won't build itself. Handy if you want to try the application from a version controlled repository such as git.

             cpanm --installdeps .

       --look
           Download and unpack the distribution and then open the directory with your shell. Handy to poke around the source code or do manual testing.

       -U, --uninstall
           EXPERIMENTAL: Uninstalls the modules. Will remove the distribution files from your library path using the ".packlist" file.

           When used with "-l" or "-L", only the files under the local::lib directory will be removed.

           NOTE: If you have the "dual-life" module in multiple locations (i.e. "site_perl" and "perl" library path, with perl 5.12 or later), only the files in "site_perl" will be deleted.

           If the distribution has bin scripts and man, they will be kept in case the core installation still references that, although there's no guarantee that the script will continue working as
           expected with the older version of .pm files.

       -h, --help
           Displays the help message.

       -V, --version
           Displays the version number.

OPTIONS
       You can specify the default options in "PERL_CPANM_OPT" environment variable.

       -f, --force
           Force install modules even when testing failed.

       -n, --notest
           Skip the testing of modules. Use this only when you just want to save time for installing hundreds of distributions to the same perl and architecture you've already tested to make sure it builds
           fine.

           Defaults to false, and you can say "--no-notest" to override when it is set in the default options in "PERL_CPANM_OPT".

       --test-only
           Run the tests only, and do not install the specified module or distributions. Handy if you want to verify the new (or even old) releases pass its unit tests without installing the module.

           Note that if you specify this option with a module or distribution that has dependencies, these dependencies will be installed if you don't currently have them.

       -S, --sudo
           Switch to the root user with "sudo" when installing modules. Use this if you want to install modules to the system perl include path.

           Defaults to false, and you can say "--no-sudo" to override when it is set in the default options in "PERL_CPANM_OPT".

       -v, --verbose
           Makes the output verbose. It also enables the interactive configuration. (See --interactive)

       -q, --quiet
           Makes the output even more quiet than the default. It only shows the successful/failed dependencies to the output.

       -l, --local-lib
           Sets the local::lib compatible path to install modules to. You don't need to set this if you already configure the shell environment variables using local::lib, but this can be used to override
           that as well.

       -L, --local-lib-contained
           Same with "--local-lib" but with --self-contained set.  All non-core dependencies will be installed even if they're already installed.

           For instance,

             cpanm -L extlib Plack

           would install Plack and all of its non-core dependencies into the directory "extlib", which can be loaded from your application with:

             use local::lib '/path/to/extlib';

       --self-contained
           When examining the dependencies, assume no non-core modules are installed on the system. Handy if you want to bundle application dependencies in one directory so you can distribute to other
           machines.

       --mirror
           Specifies the base URL for the CPAN mirror to use, such as "http://cpan.cpantesters.org/" (you can omit the trailing slash). You can specify multiple mirror URLs by repeating the command line
           option.

           You can use a local directory that has a CPAN mirror structure (created by tools such as OrePAN or Pinto) by using a special URL scheme "file://". If the given URL begins with `/` (without any
           scheme), it is considered as a file scheme as well.

             cpanm --mirror file:///path/to/mirror
             cpanm --mirror ~/minicpan      # Because shell expands ~ to /home/user

           Defaults to "http://www.cpan.org/".

       --mirror-only
           Download the mirror's 02packages.details.txt.gz index file instead of querying the CPAN Meta DB. This will also effectively opt out sending your local perl versions to backend database servers
           such as CPAN Meta DB and MetaCPAN.

           Select this option if you are using a local mirror of CPAN, such as minicpan when you're offline, or your own CPAN index (a.k.a darkpan).

           Tip: It might be useful if you name these mirror options with your shell aliases, like:

             alias minicpanm='cpanm --mirror ~/minicpan --mirror-only'
             alias darkpan='cpanm --mirror http://mycompany.example.com/DPAN --mirror-only'

       --mirror-index
           EXPERIMENTAL: Specifies the file path to "02packages.details.txt" for module search index.

       --prompt
           Prompts when a test fails so that you can skip, force install, retry or look in the shell to see what's going wrong. It also prompts when one of the dependency failed if you want to proceed the
           installation.

           Defaults to false, and you can say "--no-prompt" to override if it's set in the default options in "PERL_CPANM_OPT".

       --dev
           EXPERIMENTAL: search for a newer developer release as well. Defaults to false.

       --reinstall
           cpanm, when given a module name in the command line (i.e. "cpanm Plack"), checks the locally installed version first and skips if it is already installed. This option makes it skip the check,
           so:

             cpanm --reinstall Plack

           would reinstall Plack even if your locally installed version is latest, or even newer (which would happen if you install a developer release from version control repositories).

           Defaults to false.

       --interactive
           Makes the configuration (such as "Makefile.PL" and "Build.PL") interactive, so you can answer questions in the distribution that requires custom configuration or Task:: distributions.

           Defaults to false, and you can say "--no-interactive" to override when it's set in the default options in "PERL_CPANM_OPT".

       --pp, --pureperl
           Prefer Pure perl build of modules by setting "PUREPERL_ONLY=1" for MakeMaker and "--pureperl-only" for Build.PL based distributions. Note that not all of the CPAN modules support this convention
           yet.

       --with-recommends, --with-suggests
           EXPERIMENTAL: Installs dependencies declared as "recommends" and "suggests" respectively, per META spec. When these dependencies fail to install, cpanm continues the installation, since they're
           just recommendation/suggestion.

           Enabling this could potentially make a circular dependency for a few modules on CPAN, when "recommends" adds a module that "recommends" back the module in return.

           There's also "--without-recommend" and "--without-suggests" to override the default decision made earlier in "PERL_CPANM_OPT".

           Defaults to false for both.

       --with-feature, --without-feature, --with-all-features
           EXPERIMENTAL: Specifies the feature to enable, if a module supports optional features per META spec 2.0.

               cpanm --with-feature=opt_csv Spreadsheet::Read

           the features can also be interactively chosen when "--interactive" option is enabled.

           "--with-all-features" enables all the optional features, and "--without-feature" can select a feature to disable.

       --configure-timeout, --build-timeout, --test-timeout
           Specify the timeout length (in seconds) to wait for the configure, build and test process. Current default values are: 60 for configure, 3600 for build and 1800 for test.

       --configure-args, --build-args, --test-args, --install-args
           EXPERIMENTAL: Pass arguments for configure/build/test/install commands respectively, for a given module to install.

               cpanm DBD::mysql --configure-args="--cflags=... --libs=..."

           The argument is only enabled for the module passed as a command line argument, not dependencies.

       --scandeps
           Scans the depencencies of given modules and output the tree in a text format. (See "--format" below for more options)

           Because this command doesn't actually install any distributions, it will be useful that by typing:

             cpanm --scandeps Catalyst::Runtime

           you can make sure what modules will be installed.

           This command takes into account which modules you already have installed in your system. If you want to see what modules will be installed against a vanilla perl installation, you might want to
           combine it with "-L" option.

       --format
           Determines what format to display the scanned dependency tree. Available options are "tree", "json", "yaml" and "dists".

           tree    Displays the tree in a plain text format. This is the default value.

           json, yaml
                   Outputs the tree in a JSON or YAML format. JSON and YAML modules need to be installed respectively. The output tree is represented as a recursive tuple of:

                     [ distribution, dependencies ]

                   and the container is an array containing the root elements. Note that there may be multiple root nodes, since you can give multiple modules to the "--scandeps" command.

           dists   "dists" is a special output format, where it prints the distribution filename in the depth first order after the dependency resolution, like:

                     GAAS/MIME-Base64-3.13.tar.gz
                     GAAS/URI-1.58.tar.gz
                     PETDANCE/HTML-Tagset-3.20.tar.gz
                     GAAS/HTML-Parser-3.68.tar.gz
                     GAAS/libwww-perl-5.837.tar.gz

                   which means you can install these distributions in this order without extra dependencies. When combined with "-L" option, it will be useful to replay installations on other machines.

       --save-dists
           Specifies the optional directory path to copy downloaded tarballs in the CPAN mirror compatible directory structure i.e. authors/id/A/AU/AUTHORS/Foo-Bar-version.tar.gz

           If the distro tarball did not come from CPAN, for example from a local file or from GitHub, then it will be saved under vendor/Foo-Bar-version.tar.gz.

       --uninst-shadows
           Uninstalls the shadow files of the distribution that you're installing. This eliminates the confusion if you're trying to install core (dual-life) modules from CPAN against perl 5.10 or older,
           or modules that used to be XS-based but switched to pure perl at some version.

           If you run cpanm as root and use "INSTALL_BASE" or equivalent to specify custom installation path, you SHOULD disable this option so you won't accidentally uninstall dual-life modules from the
           core include path.

           Defaults to true if your perl version is smaller than 5.12, and you can disable that with "--no-uninst-shadows".

           NOTE: Since version 1.3000 this flag is turned off by default for perl newer than 5.12, since with 5.12 @INC contains site_perl directory before the perl core library path, and uninstalling
           shadows is not necessary anymore and does more harm by deleting files from the core library path.

       --uninstall, -U
           Uninstalls a module from the library path. It finds a packlist for given modules, and removes all the files included in the same distribution.

           If you enable local::lib, it only removes files from the local::lib directory.

           If you try to uninstall a module in "perl" directory (i.e. core module), an error will be thrown.

           A dialog wil be prompted to confirm the files to be deleted. If you pass "-f" option as well, the dialog will be skipped and uninstallation will be forced.

       --cascade-search
           EXPERIMENTAL: Specifies whether to cascade search when you specify multiple mirrors and a mirror doesn't have a module or has a lower version of the module than requested. Defaults to false.

       --skip-installed
           Specifies whether a module given in the command line is skipped if its latest version is already installed. Defaults to true.

           NOTE: The "PERL5LIB" environment variable have to be correctly set for this to work with modules installed using local::lib, unless you always use the "-l" option.

       --skip-satisfied
           EXPERIMENTAL: Specifies whether a module (and version) given in the command line is skipped if it's already installed.

           If you run:

             cpanm --skip-satisfied CGI DBI~1.2

           cpanm won't install them if you already have CGI (for whatever versions) or have DBI with version higher than 1.2. It is similar to "--skip-installed" but while "--skip-installed" checks if the
           latest version of CPAN is installed, "--skip-satisfied" checks if a requested version (or not, which means any version) is installed.

           Defaults to false.

       --verify
           Verify the integrity of distribution files retrieved from PAUSE using CHECKSUMS and SIGNATURES (if found). Defaults to false.

       --report-perl-version
           Whether it report the locally installed perl version to the various web server as part of User-Agent. Defaults to true, and you can disable it by using "--no-report-perl-version".

       --auto-cleanup
           Specifies the number of days in which cpanm's work directories expire. Defaults to 7, which means old work directories will be cleaned up in one week.

           You can set the value to 0 to make cpan never cleanup those directories.

       --man-pages
           Generates man pages for executables (man1) and libraries (man3).

           Defaults to true (man pages generated) unless "-L|--local-lib-contained" option is supplied in which case it's set to false. You can disable it with "--no-man-pages".

       --lwp
           Uses LWP module to download stuff over HTTP. Defaults to true, and you can say "--no-lwp" to disable using LWP, when you want to upgrade LWP from CPAN on some broken perl systems.

       --wget
           Uses GNU Wget (if available) to download stuff. Defaults to true, and you can say "--no-wget" to disable using Wget (versions of Wget older than 1.9 don't support the "--retry-connrefused"
           option used by cpanm).

       --curl
           Uses cURL (if available) to download stuff. Defaults to true, and you can say "--no-curl" to disable using cURL.

           Normally with "--lwp", "--wget" and "--curl" options set to true (which is the default) cpanm tries LWP, Wget, cURL and HTTP::Tiny (in that order) and uses the first one available.

SEE ALSO
       App::cpanminus

COPYRIGHT
       Copyright 2010 Tatsuhiko Miyagawa.

AUTHOR
       Tatsuhiko Miyagawa



perl v5.16.3                                                                                      2013-06-19                                                                                         CPANM(1)
