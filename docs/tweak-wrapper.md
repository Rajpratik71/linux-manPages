tweak(1)                                                           Simon Tatham                                                           tweak(1)

NAME
       tweak - efficient hex editor

SYNOPSIS
       tweak [-l | -f] [-e] [-w width] [-o offset] filename

DESCRIPTION
       tweak  is  a hex editor. It allows you to edit a file at very low level, letting you see the full and exact binary contents of the file. It
       can be useful for modifying binary files such as executables, editing disk or CD images, debugging programs that generate binary file  for‐
       mats incorrectly, and many other things.

       Unlike  simpler  hex  editors,  tweak  possesses  a fully functional insert mode. This is not useful when editing many of the types of file
       described above, but can be useful in other situations. Also, an insert mode makes it easy  to  use  tweak  to  construct  new  files  from
       scratch.

       When you open a file in tweak, you can expect to see the screen contents looking something like this:

       00000000   7F 45 4C 46 01 01 01 00   .ELF....
       00000008   00 00 00 00 00 00 00 00   ........
       00000010   02 00 03 00 01 00 00 00   ........
       00000018   D0 8E 04 08 34 00 00 00   ....4...
       00000020   2C EF 01 00 00 00 00 00   ,.......

       The central column shows you the hexadecimal value of each byte in the file you are editing. The column on the right shows the ASCII inter‐
       pretation of those bytes, where applicable. In the example above, the sequence 45 4C 46 on the first line translates into the ASCII  upper-
       case  letters  "ELF", but the subsequent sequence 01 01 01 00 does not have any printable ASCII representation and so the right-hand column
       simply prints dots.

       The column on the left shows the position within the file of the start of each row.

       In fact, when you start tweak, you will usually see 16 bytes of the file per row, not 8 as shown above. However, this  is  configurable  if
       your screen is narrower - or wider - than the usual 80 columns, or if the file you are editing consists of fixed-size records of some other
       size.

       By default, tweak does not load its entire input file into memory. Instead, it loads it lazily, reading from the  file  on  disk  when  you
       request  a view of a part of the file it doesn't have stored. When you modify the file, it stores your modifications in memory, but contin‐
       ues to refer to the original disk file for the parts you have not touched. This means you can edit  extremely  large  files  (for  example,
       entire  CD  images) without difficulty; opening such a file is instantaneous, making modifications causes tweak's memory usage to grow with
       the size of the changes rather than the size of the whole file, and only when saving the altered version will tweak have  to  read  through
       the entire input file to write the output.

       However,  this mode of operation has a disadvantage, which is that if the input file is modified by another program while tweak is running,
       tweak's internal data structures will not be sufficient to keep track, and it is likely that the file written out will contain a mixture of
       the old and new contents of the input file. Therefore, you can disable this lazy loading if you need to; see the -e option below.

OPTIONS
       This section lists the command-line options supported by tweak.

       -f     Runs  tweak  in "fix" mode, i.e. with the insert function entirely disabled. This might be useful if you are editing a file in which
              the insert mode is of no use (executables, for example, tend to have strong dependencies on  precise  file  offsets  which  make  it
              almost impossible to insert data in one without rendering it unusable) and you want to avoid turning it on by mistake.

       -l     Runs tweak in "look" mode. In this mode tweak does not allow you to modify the data at all; it becomes simply a tool for examining a
              file in detail.

       -e     Runs tweak in "eager" mode. In this mode tweak will read its entire input file when starting up. This causes it to take up more mem‐
              ory,  but  means  that  it has no dependency on the input file remaining unmodified, and other programs can alter it if they need to
              without causing trouble.

       -w width
              Specifies the number of bytes tweak will display per line. The default is 16, which fits neatly in an 80-column screen.

       -o offset
              If this option is specified, tweak will ensure that the given file offset occurs at the start of a line. For example, if you  loaded
              a file using the options -w 8 -o 0x13, you might see a display a bit like this:

              00000000                  7F 45 4C        .EL
              00000003   46 01 01 01 00 00 00 00   F.......
              0000000B   00 00 00 00 00 02 00 03   ........
              00000013   00 01 00 00 00 D0 8E 04   ........
              0000001B   08 34 00 00 00 2C EF 01   .4...,..

              By putting only three bytes of the file on the very first line, tweak has arranged that the file offset 0x13 (19 in decimal) appears
              at the beginning of the fourth line.

              You might use this option if you knew you were editing a file in a particular format. For example, if your file contained a  53-byte
              header followed by a series of 22-byte records, you might find it useful to specify the options -w 22 -o 53. This would arrange that
              after the header, each individual record of the file would appear on precisely one line of tweak's display.

       -D     If this option is specified, tweak will not attempt to load and edit a file at all, but will simply  produce  its  default  .tweakrc
              file  on standard output. This is a useful way to give yourself a starting point if you want to begin reconfiguring tweak's keyboard
              layout.

KEYS
       This section describes all the editing keys supported by tweak by default. The default key bindings for tweak are basically Emacs-like.

   Movement keys
       The Emacs cursor movement keys should all work, and their counterparts in ordinary function keys ought to work too:

       o      ^P and ^N go to the previous and next lines; Up and Down should do the same.

       o      ^B and ^F go back and forward one character; Left and Right should do the same.

       o      M-v and ^V go up and down one screenful at a time; Page Up and Page Down should do the same.

       o      ^A and ^E go to the beginning and end of the line; Home and End should do the same.

       Press M-< and M-> go to the beginning and end of the file.

       Press ^X g to go to a particular byte position in the file; you will be asked to type in the position you want. You can enter it  in  deci‐
       mal, or as a hex number with "0x" before it.

   Editing keys
       Press Return to move the cursor between the hex section of the screen and the ASCII section.

       When in the hex section, you can enter hexadecimal digits to alter data; when in the ASCII section, you can directly type ASCII text.

       In  ASCII  mode, you can also press ^Q to literally quote the next input character; for example, if you want to insert a Control-V, you can
       press ^Q^V and tweak will automatically insert the byte value 0x16.

       Press ^X^I, or the Insert key if you have one, to toggle between overwrite mode and insert mode. In insert mode, typing hex or ASCII  input
       will  insert  new bytes containing the values you provide. Also, you can then press Backspace to delete the byte to the left of the cursor,
       or ^D or Delete to delete the byte under the cursor.

   Cut and paste
       Press ^@ (this character may be generated by the key combination Control-@, or Control-2, or Control-Space) to mark the end of a  selection
       region. After you do this, the bytes between that mark and the cursor will be highlighted. Press ^@ again to abandon the selection.

       Press M-w while a selection is active to copy the selected region into tweak's cut buffer.

       In  insert mode, you also have the option of pressing ^W to cut the selected region completely out of the file and place it in the cut buf‐
       fer.

       Finally, press ^Y to paste the cut buffer contents back into the file (this will overwrite or insert depending on the current mode).

   Searching
       Press ^S to search for a byte sequence. You will be asked to enter some text to search for on the bottom line of the screen. You  can  type
       this  text  in  ASCII, or as a sequence of hex byte values prefixed with backslashes (\). For example, if you wanted to search for the byte
       value 5 followed by the word "hello", you might enter \05hello. If you want to specify a literal backslash character, you can either  enter
       it in hex (as \5C), or simply double it on input (\\).

       Press ^R to search backwards instead of forwards from the current cursor position.

       Since tweak deals in pure binary data, searches are always case-sensitive.

   Controlling the display
       If  you  press ^X w, you will be asked to enter a new display width. This has the same effect as passing the -w option on the command line.
       Similarly, pressing ^X o allows you to enter a new display offset, equivalent to the -o option.

       By default, the current file position and file size are displayed on tweak's status line in hex. If you prefer them  in  decimal,  you  can
       press ^X x or ^X h to toggle them between hex and decimal.

   Miscellaneous
       Press ^L to redraw the screen and recentre the cursor. Press ^Z to suspend tweak and return temporarily to the shell.

       Press ^X^S to save the file you are editing.

       Press ^X^C to exit tweak. (If you do this with changes unsaved, you will be asked whether you want to save them.)

CONFIGURATION FILE
       tweak's keyboard bindings are configurable. It will attempt to read a file from your home directory called .tweakrc, and if it finds one it
       will use the keyboard bindings described in it. If it does not find one, it will use its internal default bindings.

       Most of the directives in .tweakrc are of the form "bind command-name key". For example, "bind exit  ^X^C".  Additionally,  there  are  two
       other directives, width and offset, which give the default display parameters if no -w and -o options are specified.

       The easiest way to learn about the .tweakrc file is to begin by having tweak output its internal default one:

       tweak -D > $HOME/.tweakrc

       Then you can read the default file, learn the tweak internal command names, and edit the file to do what you want.

BUGS
       This  man  page  probably  ought  to  contain  an  explicit list of internal command names, rather than simply referring you to the default
       .tweakrc.

Simon Tatham                                                        2004-11-05                                                            tweak(1)
