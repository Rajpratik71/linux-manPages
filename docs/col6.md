col1(1)                                                                byobu                                                               col1(1)

NAME
       col1 .. col9, NF - awk and print a column (based on the name of the program, 1-9)

SYNOPSIS
       col1 [SEPARATOR]

DESCRIPTION
       col1  is  a  simple  script that conveniently splits and prints a given column, where the column to print is the name of the script program
       you're running (col1-col9).  col2-col9 are symlinks to col1; their behavior simply changes based on the name called.

       NF can be used to print the last field.

       The program takes one optional argument, the input field separator (whitespace, by default).

EXAMPLES
       Rather than:
        mount | awk '{print $3}'

       Try:
        mount | col3

       Instead of:
        cat /etc/passwd | awk -F":" '{print $7}'

       You can just do:
        cat /etc/passwd | col7 :

       Or
        cat /etc/passwd | NF :

SEE ALSO
       awk(1)

AUTHOR
       This manpage and the utility was written by Dustin Kirkland <kirkland@ubuntu.com> for Ubuntu systems (but may be used by others).   Permis‐
       sion  is  granted to copy, distribute and/or modify this document under the terms of the GNU General Public License, Version 3 published by
       the Free Software Foundation.

       On Debian systems, the complete text of the GNU General Public License can be found in /usr/share/common-licenses/GPL, or  on  the  web  at
       http://www.gnu.org/licenses/gpl.txt.

byobu                                                               27 Sep 2010                                                            col1(1)
