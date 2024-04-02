TTF2SVG(1)                                                         User Commands                                                        TTF2SVG(1)

NAME
       svgpp - font converter for SVG

ttf2svg
       <ttf-path> [-l <range-begin>] [-h <range-end>] [-autorange] [-ascii] [-id <id>] [-o <output-path>] [-testcard]

DESCRIPTION
       Converts a true type font into a SVG font.  <ttf-path> is the path of the font file to convert.

OPTIONS
       -l range-begin -h range-end
              specifies the range of characters (by codepoint, in decimal) to be converted,

       -ascii forces usage of the ASCII character map in the font, instead of the Unicode character map,

       -id id specifies the value for the id attribute of the generated font element,

       -o output-path
              specifies the pathname of the output SVG document containing the generated SVG font

       -testcard
              specifies  that  a  sequence  of SVG text elements should be appended to the output SVG file to test the characters in the SVG font,
              providing an easy way to validate that generated SVG font visually.

JAVA-WRAPPERS NOTE
       This program is a shell script wrapper based on java-wrappers(7).  You therefore benefit from several features; please see  the  java-wrap‐
       pers(7) manual page for more information about them.

AUTHORS
       ttf2svg is part of batik, written by the Apache Software Foundation.

       This manual page was written by Vincent Fourmond <fourmond@debian.org> for the Debian Project, but may be used by others.

SEE ALSO
       The web page of batik, http://xml.apache.org/batik

       java-wrappers(7)

Font converter for SVG                                             January 2008                                                         TTF2SVG(1)
