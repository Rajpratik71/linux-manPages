DH_PERL_DBI(1)                                          User Contributed Perl Documentation                                         DH_PERL_DBI(1)

NAME
       dh_perl_dbi - add dependencies required for DBI modules

SYNOPSIS
       dh_perl_dbi [debhelper options]

DESCRIPTION
       dh_perl_dbi is a debhelper program that is responsible for adding a dependency on perl-dbdabi-* to the ${perl:Depends} substitution
       variable.  Such a dependency is required for packages that use the DBD<>DBI binary interface; do not use this for packages that only use
       the DBI module.

       A debhelper addon is also provided.  This makes it possible to just use

         #!/usr/bin/make -f
         %:
                 dh $@ --with perl_dbi

       for debian/rules.

SEE ALSO
       debhelper(7)

       <http://bugs.debian.org/577209>

COPYRIGHT AND LICENSE
       Copyright 2010, Ansgar Burchardt <ansgar@debian.org>

       This program is free software, you can redistribute it and/or modify it under the same terms as Perl itself.

perl v5.22.1                                                        2015-12-17                                                      DH_PERL_DBI(1)
