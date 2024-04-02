CPANSIGN(1)                                                                          User Contributed Perl Documentation                                                                          CPANSIGN(1)



NAME
       cpansign - CPAN signature management utility

SYNOPSIS
           % cpansign              # verify an existing SIGNATURE, or
                                   # make a new one if none exists

           % cpansign file.par     # verify or sign a PAR file

           % cpansign sign         # make signature; overwrites existing one
           % cpansign -s           # same thing

           % cpansign verify       # verify a signature
           % cpansign -v           # same thing
           % cpansign -v --skip    # ignore files in MANIFEST.SKIP

           % cpansign help         # display this documentation
           % cpansign -h           # same thing

DESCRIPTION
       This utility lets you create and verify SIGNATURE files.

SEE ALSO
       Module::Signature

AUTHORS
       Audrey Tang <autrijus@autrijus.org>

COPYRIGHT
       Copyright 2002, 2003, 2006 by Audrey Tang.

       This program is free software; you can redistribute it and/or modify it under the same terms as Perl itself.

       See <http://www.perl.com/perl/misc/Artistic.html>



perl v5.16.3                                                                                      2012-11-02                                                                                      CPANSIGN(1)
