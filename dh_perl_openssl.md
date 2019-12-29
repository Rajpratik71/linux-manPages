DH_PERL_OPENSSL(1)                User Contributed Perl Documentation               DH_PERL_OPENSSL(1)

NAME
       dh_perl_openssl - add dependencies required for OpenSSL modules

SYNOPSIS
       dh_perl_openssl [debhelper options]

DESCRIPTION
       dh_perl_openssl is a debhelper program that is responsible for adding a dependency on
       perl-openssl-abi-* to the ${perl:Depends} substitution variable.  Such a dependency is needed
       for packages that expose the OpenSSL binary interface to Perl code, such as pointers to
       "SSL_CTX" structs.

       A debhelper addon is also provided.  This makes it possible to just use

         #!/usr/bin/make -f
         %:
                 dh $@ --with perl_openssl

       for debian/rules.

SEE ALSO
       debhelper(7)

       <http://bugs.debian.org/848113>

COPYRIGHT AND LICENSE
       Based on dh_perl_dbi in the libdbi-perl package by Angar Buchardt.

       Copyright 2010, Ansgar Burchardt <ansgar@debian.org>

       Copyright 2016, Niko Tyni <ntyni@debian.org>

       This program is free software, you can redistribute it and/or modify it under the same terms as
       Perl itself.

perl v5.26.1                                  2018-02-05                            DH_PERL_OPENSSL(1)
