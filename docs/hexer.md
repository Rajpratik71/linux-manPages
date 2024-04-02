HEXER(1)                                                      General Commands Manual                                                     HEXER(1)

NAME
       hexer - binary file editor

SYNOPSIS
       hexer [options] [file [...]]

DESCRIPTION
       hexer  is a multi-buffer editor for viewing and manipulating binary files.  It can't (shouldn't) be used for editing block devices, because
       it tries to load the whole file into a buffer (it should work for diskettes).  The most important features of hexer  are:   multi  buffers,
       multi  level undo, command line editing with completion, binary regular expressions (see below).  The user interface is kept similar to vi,
       so if you know how to use vi, you'll get started easily.

OPTIONS
       -R, --readonly

       -v, --view
           Edit files in read only mode.

       -r, --recover filename
           Recover the file filename after a crash. (not implemented)

       -c, --command command
           Start the editing session by executing the editor command command.  If command contains spaces, it must be surrounded by double quotes.
           It is possible to specify multiple commands on the command line:
           hexer -c command1 -c command2 ...

       -t, --tite
           Turn off the usage of the termcap/terminfo ti/te sequence.

       -h, --help
           Print out a short help message and exit.

       +command
           This is equivalent to the -c option.

       Note: The long options are not available on all systems.

CUSTOMIZING
       The  editor  reads its startup commands from the file ~/.hexerrc (another startup file may be specified by setting the environment variable
       HEXERRC).  Empty lines and lines starting with a `"'‐character (double quote) are ignored.  It is not possible to have a command and a com‐
       ment in the same line.

EDITOR COMMANDS
       As in vi, there are several editing modes:

       Command Mode
           Some  commands  in  Command  Mode can take a numeric argument.  To enter a numeric argument just type the (decimal) number.  The number
           will be echoed at the bottom line of the screen as you type.  To enter an octal number, type a `0' as the  first  digit.   To  enter  a
           hexadecimal  number,  type `0x' (this is not a problem, because the x-command with a zero counter wouldn't make sense anyway).  Some of
           the commands can take a visually selected area as an argument (see subsection Visual Mode).

           b      Move backwards to the beginning of a word.

           e      Move to the end of a word.

           G      If a numeric argument n is given, move the cursor to position n.  If no argument is specified, set the position to  the  end  of
                  the buffer.  The first byte in the buffer is at position `0', so the command to move to the beginning of the buffer is `0G'.

           Control-G
                  Display the buffer name, size, status and the current position at the bottom line.

           h j k l
                  Move  the  cursor.   The arrow keys work as well.  The numeric argument (if specified) determines the number rows or columns the
                  cursor will move.  Different from vi: the cursor can be positioned behind the last byte in the buffer.

           i      Enter Insert Mode (see below) at the current position of the point.  If a numeric argument n is given, the typed  text  will  be
                  inserted n times.  Note: Moving the cursor (using the arrow keys) will discard the numeric argument.

           n      Move to the next match using the current RE.  This is equivalent to typing `/', <Return>.

           N      Move to the previous match using the current RE.  This is equivalent to typing `?', <Return>.

           Control-O
                  Paste over.  Copy the kill buffer to the current position overwriting the contents of the current buffer.  If a numeric argument
                  n is given, the kill buffer is pasted n times.

           p      Paste.  Insert the kill buffer at the current position.  If a numeric argument n is given, the kill buffer is pasted n times.

           r      Replace a single byte using the Replace Mode.  If an area is selected, all bytes in  the  selected  area  are  replaced.   If  a
                  numeric argument is given, the specified number of bytes is replaced.

           R      Enter  Replace  Mode  (see below).  If a numeric argument n is given, the replace command is repeated n times.  Note: Moving the
                  cursor (using the arrow keys) will discard the numeric argument.

           Control-R
                  Redo the last undo.

           u      Undo the last change to the current buffer.

           Whenever possible hexer creates a file name.hexer in the current directory (the swapfile) for each buffer visited (where  name  is  the
           name  of  the  buffer).   All changes made to the buffer name are stored in that file, so it is possible to undo (and redo) all changes
           made to the buffer.  If the swapfile can't be created, the undo list is stored in the memory.

           v      Enter Visual Mode (see below).  Visual selection of areas.

           w      Move forward to the beginning of a word.

           x      Delete the byte under the cursor.  If a numeric argument n is given, n bytes are deleted.  In Visual Mode, the selected area  is
                  deleted.  Note: The bytes deleted using the x-command are not copied to the kill buffer.

           Control-X
                  The same as the x-command, but the bytes deleted are copied to the kill buffer.

           y      Yank.   Yank the byte under the cursor into the kill buffer.  If a numeric argument n is given, n bytes are yanked into the kill
                  buffer.  In Visual Mode, the selected area is copied to the kill buffer.

           zb     Place the cursor in the bottom line of the screen.

           zt     Place the cursor in the top line of the screen.

           zz     Place the cursor in the middle line of the screen.
                  Note that the commands zb, zt and zz don't change the position in the file - only the screen is scrolled (if necessary).

           :      Enter Exh Mode (see below).  The Exh Mode is similar to the ex-mode in vi, but not compatible.  If  an  area  is  selected,  the
                  bounds of the selection are copied to the command line.

           /      Search  forward  through  the  buffer using a RE(regular expression).  If no RE is specified, the RE given in the previous /- or
                  ?-command is reused.
                  Note: The REs in hexer are a little bit different from regular expressions in vi (see section REGULAR EXPRESSIONS).

           ?      Search reverse using a regular expression.

           .      Repeat the last change to the buffer at the current position.  This means that if the  previous  command  deleted  n  bytes  and
                  replaced them by m other bytes (n or m may be zero), the .-command will do exactly the same at the current position in the file.

           <      Shift the hex column left n bytes, where n is the (optional) numeric argument.  Note that the <-command only changes the way the
                  buffer is displayed in the hex column, the buffer itself is kept unchanged.

           >      Shift the hex column right n bytes.

           Control-^
                  Switch to the alternate buffer (see below).

           %      Enter a calculator command (see section CALCULATOR).

       Visual Mode
           Select an area on the buffer.  You can enter the Visual Mode by using the v-command or by specifying an area in Exh Mode.   The  selec‐
           tion  starts  at  the  cursor position when entering the Visual Mode and ends at the current cursor position.  You can leave the Visual
           Mode without performing a command on the selected area by pressing v or Escape.  To perform a command on the selected area simply enter
           the command as if you where in Command Mode.  Commands that can't use the selection will ignore it.  As in Command Mode, it is possible
           to specify a numeric argument.  Commands that can take the selection as an argument will ignore the numeric argument.

       Insert Mode
           In Insert Mode the bytes you type are inserted at the current position of the cursor.  At any time, you can toggle  the  active  column
           (hex  column  or  text column) by pressing the TAB-key.  If the hex column is active the bytes are entered as two digit hex numbers, if
           the text column is active, the bytes are entered as ASCII text.  The Delete- or BackSpace-key deletes the previously inserted byte.  If
           the  hex  column  is  active, the previously inserted nibble (hex digit) is deleted.  It is not possible to delete more bytes than have
           been inserted in the current insert command.  While in Insert Mode, you can move the cursor using the arrow keys.  Note that moving the
           cursor  discards the numeric argument given to the insert command.  To leave the Insert Mode, type Escape.  If a numeric argument n was
           given to the insert command and is hasn't been discarded by a cursor movement, the typed bytes are inserted n times.

       Replace Mode
           In Replace Mode you replace the bytes under the cursor as you type.  Hitting BackSpace restores the original contents  of  the  buffer.
           The  effect  of  a numeric argument is similar to the Insert Mode: the typed bytes are replaced n times.  As in Insert Mode, moving the
           cursor using the arrow keys discards the numeric argument.

       Exh Mode
           The Exh Mode in hexer is kept similar to the ex-mode in vi.  Typically, an exh command looks like:

           :area command arguments
                  Perform the command command on the area area.

           :command arguments
                  Perform the command command at the current position.

           :area  Select the area area.

           :position
                  Move the cursor to position position.

           An area may be defined as:

           position1,position2
                  The area starts at position1 and ends at position2 (inclusive).

           position
                  The area selects one byte at position

           %      The area selects the entire buffer.

           A position may be defined as:

           offset A decimal, octal (prefixed with `0') or hex (prefixed with `0x') number.

           .      The beginning of the buffer.

           $      The end of the buffer.

           /regexp/
                  A regular expression (see section REGULAR EXPRESSIONS).  The buffer is searched forward starting at the current position.  If  a
                  match was found, the current position is set to the position of the match.

           ?regexp?
                  The buffer is searched reverse.

           Commands may be abbreviated with a unique prefix of the command, some commands may be abbreviated with a single character, even if that
           character isn't a unique prefix of the command name.  Currently the following commands are supported:

           s, substitute
                  Synopsis: area s /regexp/replace/flags
                  Search for the regular expression regexp and replace it with replace (see section REGULAR EXPRESSIONS).  replace may contain `\'
                  references to subexpressions of regexp.  flags:

                  g:     global, this flag is ignored (it doesn't make sense in a binary editor).

                  c:     confirm, ask the user to confirm each substitution.

                  (Note  that  the `/' character used as separator could be any character, it's just common practice to use `/'.) Trailing separa‐
                  tors may be omitted.  If area is omitted, the whole buffer is searched.

           w, write
                  Synopsis: area w filename
                  Write area to the file filename.  If area is omitted. the whole buffer is written to the file, if filename is omitted, the file‐
                  name associated with the buffer is used.

           r, read
                  Synopsis: position r filename
                  Insert the contents of the file filename at position.  If position is omitted, the current position is used.

           e, edit
                  Synopsis: e name or: e #
                  Change  to  buffer  name.   If there is no such buffer, hexer tries to open a file named name and load it into a new buffer.  If
                  name is a hash sign (#), the alternate buffer is selected.  On success the current buffer becomes the alternate buffer.

           b, buffer
                  Synopsis: b name
                  or: b
                  Change to buffer name.  On success the current buffer becomes the alternate buffer.  If name is omitted, a list of  all  buffers
                  is displayed.

           n, next
                  Select the next buffer in the buffer list.

           N, previous
                  Select the previous buffer in th buffer list.

           S, skip
                  Select the next unvisited buffer in the buffer list.

           rewind Select the first buffer in the buffer list.

           wall   Write all unsaved buffers.

           c, close
                  Synopsis: c name
                  or: c!  name
                  or: c
                  or: c!
                  Close  the  buffer  name.  If name is omitted, the current buffer is closed.  If the buffer has been modified, but not saved, it
                  can't be closed using a :c-command; use :c!  to override.

           h, help
                  View an online help text.

           q, quit
                  Synopsis: q name
                  or: q!  name
                  or: q
                  or: q!
                  Close all buffers and exit the editor.  If an opened buffer has bee modified, but not saved, the :q-command can't be  performed;
                  use :q!  to override.

           map

           imap

           vmap   Synopsis: map from to
                  or: imap from to
                  or: vmap from to
                  The key sequence from is mapped to to.  To enter special keys (e.g. function keys), mask them using Control-V.  :map affects the
                  Command Mode only, :imap affects the Insert Mode only and :vmap affects the Visual Mode only.  It is not possible to re-map  key
                  sequences on the command line editor.

           unmap

           iunmap

           vunmap Synopsis: unmap from
                  or: iunmap from
                  or: vunmap from
                  Delete a key mapping created with :map, :imap or :vmap.

           set    Synopsis: set variable [...]
                  or: set variable=value [...]
                  or: set novariable [...]
                  or: set
                  There  are  not  too  many variables that could be modified, this might change though.  The following variables can be used: iso
                  (bool):  display the whole ISO-8859/1 character set; ascii (bool):  display ASCII characters only; TERM (string):  the  name  of
                  the  terminal;  maxmatch (number), specialnl (bool): see section REGULAR EXPRESSIONS.  :set called without an argument lists all
                  variables and values.

           d, delete
                  Synopsis: area d
                  Delete all bytes in area.  The deleted bytes are copied to the kill buffer.

           y, yank
                  Synopsis: area y
                  Copy the bytes in area to the kill buffer.

           version
                  Display the version number of hexer.

           zz     Place the cursor in the middle line of the screen.  Note that the screen is scrolled (if necessary); the cursor position is kept
                  unchanged.

           zt     Place the cursor in the top line of the screen.

           zb     Place the cursor in the bottom line of the screen.

           wq     The same as :x.

           x, exit
                  Save all buffers and exit the editor.

           If a command is called and can't use the given positions, areas or arguments, the additional positions, areas, arguments are ignored.
           Conditional commands: It is possible to specify a list of terminal names for which the given command should be executed. The syntax is:
                  :terminals:command
           where  terminals is a colon-separated list of terminal names.  The command is executed if and only if the value of TERM is in the list.
           I.e. you could have a command like
                  :xterm:set iso
           in your .hexerrc-file (use the ISO character set only if working on an xterm).

       Cursor Motion
           In Command Mode, Insert Mode, Replace Mode and Visual Mode, you can use the following cursor motion commands:

           Arrow Keys
                  Move the cursor.

           Control-F
                  Move forward one page.

           Control-B
                  Move back one page.

           Control-D
                  Move forward half a page.

           Control-U
                  Move back half a page.

COMMAND LINE EDITING
       On the command line you can use the following commands:

       UpArrow DownArrow
              Move up and down through the history of the current context.

       LeftArrow RightArrow
              Move the cursor.

       Control-A
              Move the cursor to the beginning of the line.

       Control-E
              Move the cursor to the end of the line.

       Control-K
              Delete all characters from the current cursor position up to the end of the line.

       Control-U
              Delete all characters from the beginning of the line up to the current cursor position.

       Delete

       BackSpace
              Delete the character left of the cursor.

       Control-D
              Delete the character under the cursor.

       Enter Return
              Accept the line.

       Escape Discard the line.  Note: This is different from vi.

       TAB    Try to complete currently typed word.  If the completion is not unique, the word is completed as far as unique.  If the  TAB-key  is
              hit twice on the same position,  a list of all possible completions is displayed.

REGULAR EXPRESSIONS
       In  this  section  it  is assumed that you are familiar with REs (regular expressions).  In most applications (egrep, vi, ...)  REs work on
       lines, that means it is not possible to use a RE containing a line break (newline character).  In hexer, the buffer is not  split  up  into
       distinct  lines and a newline character is considered to be a `normal' character, now here's the problem: imagine searching for "a.*b" in a
       5 MB file, this would take very long (might be up to several minutes on a slow machine).  That's why there's a  maxmatch  limit  (a  repeat
       operator  matches  at most maxmatch occurrences of its operand).  The default value of maxmatch is 1024, but it may be customized using the
       :set-command.  For simple expressions (expressions for which the length of the match can be determined from the expression) it is  possible
       to override the maxmatch limit by doubling the `*' or `+' operator, e.g. "a.**b" or "foo\(bar\)\+\+".
       Note  that  the  context specifiers `^'/`$' (beginning/end of a line) and `\<'/`\>' (beginning/end of a word) are available and actually do
       what you expect.  If you don't want the atoms `.' and `[^...]' to match the newline character you can set the specialnl  option  using  the
       :set-command.
       To  enter a special character, you can use the standard C `\'‐escape sequences.  To enter a character using its octal code, use a `\o'‐pre‐
       fix followed by up to three octal digits.  (C-style octal escapes are not supported, because `\0', ... `\9' are interpreted as  back-refer‐
       ences to subexpressions of the RE.)  To enter a character using it's hex code, type a `\x'-prefix followed by up to two hex digits; decimal
       codes can be entered using a `\d'‐prefix followed by up to three decimal digits.  It is possible to enter strings of codes by doubling  the
       base  specifier,  e.g.  "\xxfe  ff 5a 7e" or "\oo276 277 132 176".  Note that such a string is treated as an atom, i.e.  the RE "\xxff fe*"
       matches any number (< maxmatch) of repetitions of ff fe.
       It is possible to use all kinds of character `\'‐escapes (escapes representing a single character) within `[]'‐ranges.  Within a range, the
       `o'  selecting an octal base for the escape may be omitted, since back-references within a range don't make sense.  When specifying a mini‐
       mum and/or maximum number of repetitions using the `\{,}'‐operator, the numbers may be given in decimal (no prefix), octal (`0'-prefix)  or
       hex (`0x'-prefix).  If no maximum number is specified and the operand is not a simple expression, at most maxmatch matches will be found.

CALCULATOR
       Hexer  provides  a  simple calculator (myc) capable of all operations available in C.  To enter a myc command just enter a % (percent) sign
       and an expression in infix notation.  It is possible to use parentheses.  myc understands the following binary infix operators (from  high‐
       est  priority  to  lowest):  **  (power), * (multiply), / (divide), % (modulo), + (add), - (subtract), << (shift left), >> (shift right), <
       (less), <= (less or equal), > (greater), >= (greater or equal), == (equal), != (not equal), & (arithmetical and), |  (arithmetical  or),  ^
       (arithmetical  exclusive  or),  &&  (logical and), || (logical or), = (assign);  and the following unary prefix operators: - (negate, unary
       minus), !  (logical not), ~ (bitwise complement).  myc knows three data types: boolean, integer (32 bit), float (64 bit,  equivalent  to  C
       double).   On some esoteric platforms the precision of integer and float may be different.  As in C the result of a division depends on the
       data types of the operands.  An integer divided by an integer yields an integer.  If you want the result to be a float, make  sure  one  of
       the  operands is a float, e.g. type 4/7.  instead of 4/7 or a/(b+0.)  instead of a/b.  The power operation returns a float if the result is
       too large to fit in an integer.  The result of a calculation is stored in the special variables $$ and $n where n is the number of the com‐
       mand.

BUGS
       Probably.  Please report bugs to demetrio@cs.uni-sb.de.

COPYRIGHT
       hexer  is  not  in  the  public  domain,  but freely distributable.  It may be used for any non-commercial purpose.  See file COPYRIGHT for
       details.

AUTHOR
       Sascha Demetrio
       demetrio@cs.uni-sb.de

Hexer 0.2.3                                                     September 11, 2011                                                        HEXER(1)
