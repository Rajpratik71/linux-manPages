DH_PERL(1)                                     Debhelper                                    DH_PERL(1)

NAME
       dh_perl - calculates Perl dependencies and cleans up after MakeMaker

SYNOPSIS
       dh_perl [debhelper options] [-d] [library dirs ...]

DESCRIPTION
       dh_perl is a debhelper program that is responsible for generating the ${perl:Depends}
       substitutions and adding them to substvars files.

       The program will look at Perl scripts and modules in your package, and will use this
       information to generate a dependency on perl or perlapi. The dependency will be substituted
       into your package's control file wherever you place the token ${perl:Depends}.

       dh_perl also cleans up empty directories that MakeMaker can generate when installing Perl
       modules.

OPTIONS
       -d  In some specific cases you may want to depend on perl-base rather than the full perl
           package. If so, you can pass the -d option to make dh_perl generate a dependency on the
           correct base package. This is only necessary for some packages that are included in the
           base system.

           Note that this flag may cause no dependency on perl-base to be generated at all. perl-base
           is Essential, so its dependency can be left out, unless a versioned dependency is needed.

       -V  By default, scripts and architecture independent modules don't depend on any specific
           version of perl. The -V option causes the current version of the perl (or perl-base with
           -d) package to be specified.

       library dirs
           If your package installs Perl modules in non-standard directories, you can make dh_perl
           check those directories by passing their names on the command line. It will only check the
           vendorlib and vendorarch directories by default.

CONFORMS TO
       Debian policy, version 3.8.3

       Perl policy, version 1.20

SEE ALSO
       debhelper(7)

       This program is a part of debhelper.

AUTHOR
       Brendan O'Dea <bod@debian.org>

12.6.1ubuntu2                                 2019-09-17                                    DH_PERL(1)
