MARKDOWN(1p)                                            User Contributed Perl Documentation                                           MARKDOWN(1p)

NAME
       markdown - Convert Markdown syntax to (X)HTML

DESCRIPTION
       This program is distributed as part of Perl's Text::Markdown module, illustrating sample usage.

       Markdown can be invoked on any file containing Markdown-syntax, and will produce the corresponding (X)HTML on STDOUT:

           $ cat file.txt
           This is a *test*.

           Absolutely _nothing_ to see here. _Just a **test**_!

           * test
           * Yup, test.
           $ markdown file.txt
           <p>This is a <em>test</em>.</p>

           <p>Absolutely <em>nothing</em> to see here. <em>Just a <strong>test</strong></em>!</p>

           <ul>
           <li>test</li>
           <li>Yup, test.</li>
           </ul>

       If no file is specified, it will expect its input from STDIN:

           $ echo "A **simple** test" | markdown
           <p>A <strong>simple</strong> test</p>

OPTIONS
       version
           Shows the full information for this version

       shortversion
           Shows only the version number

       html4tags
           Produce HTML 4-style tags instead of XHTML - XHTML requires elements that do not wrap a block (i.e. the "hr" tag) to state they will
           not be closed, by closing with "/>". HTML 4-style will plainly output the tag as it comes:

               $ echo '---' | markdown
               <hr />
               $ echo '---' | markdown --html4tags
               <hr>

       help
           Shows this documentation

AUTHOR
       Copyright 2004 John Gruber

       Copyright 2008 Tomas Doran

       The manpage was written by Gunnar Wolf <gwolf@debian.org> for its use in Debian systems, but can be freely used elsewhere.

       For full licensing information, please refer to Text::Markdown.pm's full documentation.

SEE ALSO
       Text::Markdown, <http://daringfireball.net/projects/markdown/>

perl v5.20.2                                                        2015-08-13                                                        MARKDOWN(1p)
