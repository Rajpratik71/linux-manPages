ERUBIS(1)                                    User Commands                                   ERUBIS(1)

NAME
       erubis - eRuby style template engine for multiple languages

SYNOPSIS
       erubis [..options..] [file ...]

DESCRIPTION
       Embedded  templating  engine for multiple languages.  Erubis will take a template file as input
       and output code to convey that data in the language specified.  The following output  languages
       are supported:

               * Ruby
               * PHP
               * C
               * Java
               * Scheme
               * Perl
               * JavaScript

OPTIONS
       -h, --help
              help

       -v     version

       -x     show converted code

       -X     show converted code, only ruby code and no text part

       -N     numbering: add line numbers            (for '-x/-X')

       -U     unique: compress empty lines to a line (for '-x/-X')

       -C     compact: remove empty lines            (for '-x/-X')

       -b     body only: no preamble nor postamble   (for '-x/-X')

       -z     syntax checking

       -e     escape (equal to '--E Escape')

       -p pattern
              embedded pattern (default '<% %>')

       -l lang
              convert but no execute (ruby/php/c/java/scheme/perl/js)

       -E e1,e2,...
              enhancer names (Escape, PercentLine, BiPattern, ...)

       -I path
              library include path

       -K kanji
              kanji code (euc/sjis/utf8) (default none)

       -c context
              context data string (yaml inline style or ruby code)

       -f datafile
              context data file ('*.yaml', '*.yml', or '*.rb')

       -T     don't expand tab characters in YAML file

       -S     convert mapping key from string to symbol in YAML file

       -B     invoke 'result(binding)' instead of 'evaluate(context)'

       --pi=name
              parse '<?name ... ?>' instead of '<% ... %>'

   supported properties:
              * (common)

       --escapefunc=nil
              : escape function name

       --pattern="<% %>"
              : embed pattern

       --trim=true
              : trim spaces around <% ... %>

       --preamble=nil
              : preamble (no preamble when false)

       --postamble=nil
              : postamble (no postamble when false)

       --escape=nil
              : escape expression or not in default

              * (basic) * (pi)

       --pi="rb"
              : PI (Processing Instrunctions) name

       --embchar="@"
              : char for embedded expression pattern('@{...}@')

              * ruby * php * c

       --indent=""
              : indent spaces (ex. '  ')

       --out="stdout"
              : output file pointer name

              * java

       --indent=""
              : indent spaces (ex. '  ')

       --buf="_buf"
              : output buffer name

       --bufclass="StringBuffer" : output buffer class (ex. 'StringBuilder')

              * scheme

       --func="_add"
              : function name (ex. 'display')

              * perl

       --func="print"
              : function name

              * javascript

       --docwrite=true
              : use 'document.write()' when true

EXAMPLES
       Run 'erubis -l php example.ephp' to convert the embedded document to php code.

       example.ephp:
        <?xml version="1.0"?>
        <html>
         <body>
          <p>Hello <%= $user %>!</p>
          <table>
           <tbody>
            <% $i = 0; %>
            <% foreach ($list as $item) { %>
            <%   $i++; %>
            <tr bgcolor="<%= $i % 2 == 0 ? '#FFCCCC' : '#CCCCFF' %>">
             <td><%= $i %></td>
             <td><%== $item %></td>
            </tr>
            <% } %>
           </tbody>
          </table>
         </body>
        </html>

SEE ALSO
       http://rubyforge.org/projects/erubis/

erubis 2.6.2                                 January 2009                                    ERUBIS(1)
