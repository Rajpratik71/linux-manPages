MULTIMARKDOWN(1p)                                       User Contributed Perl Documentation                                      MULTIMARKDOWN(1p)

NAME
       multimarkdown - Convert MultiMarkdown syntax to (X)HTML

DESCRIPTION
       This program is distributed as part of Perl's Text::MultiMarkdown module, illustrating sample usage.

       multimarkdown can be invoked on any file containing MultiMarkdown-syntax, and will produce the corresponding (X)HTML on STDOUT:

           $ cat file.txt
           [MultiMarkdown][] *extends* the very well-known [Markdown][] syntax.

           [MultiMarkdown]: http://fletcherpenney.net/What_is_MultiMarkdown
           [Markdown]: http://daringfireball.net/projects/markdown/

           $ multimarkdown file.txt
           <p><a href="http://fletcherpenney.net/What_is_MultiMarkdown">MultiMarkdown</a> <em>extends</em> the very well-known <a href="http://daringfireball.net/projects/markdown/">Markdown</a> syntax.</p>

       If no file is specified, it will expect its input from STDIN:

           $ echo "A **simple** test" | multimarkdown
           <p>A <strong>simple</strong> test</p>

OPTIONS
       version
           Shows the full information for this version

       shortversion
           Shows only the version number

       html4tags
           Produce HTML 4-style tags instead of XHTML - XHTML requires elements that do not wrap a block (i.e. the "hr" tag) to state they will
           not be closed, by closing with "/>". HTML 4-style will plainly output the tag as it comes:

               $ echo '---' | multimarkdown
               <hr />
               $ echo '---' | multimarkdown --html4tags
               <hr>

       help
           Shows this documentation

AUTHOR
       Copyright 2004 John Gruber

       Copyright 2006 Fletcher Penny

       Copyright 2008 Tomas Doran

       The manpage was written by Gunnar Wolf <gwolf@debian.org> for its use in Debian systems, but can be freely used elsewhere.

       For full licensing information, please refer to Text::MultiMarkdown.pm's full documentation.

SEE ALSO
       Text::MultiMarkdown, <http://fletcherpenney.net/What_is_MultiMarkdown>

perl v5.18.2                                                        2014-07-20                                                   MULTIMARKDOWN(1p)
