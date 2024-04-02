THE(1)                                                                  THE                                                                 THE(1)

NAME
       the - The Hessling Editor.

SYNOPSIS
       the [-h?nmrsbk] [-p profile] [-a profile_arg] [-l line_num] [-c col_num] [-w width] [-u display_length] [-k[fmt]] [[dir] [file [...]]]

DESCRIPTION
       THE  is  a  text editor that uses both command line commands and key bindings to operate. It is intended to be similar to the VM/CMS System
       Product Editor, XEDIT and to KEDIT from Mansfield Software.

       THE was originally written to be used by people already familiar with the above editors. For this reason, the documentation  provides  lim‐
       ited information on using THE, and concentrates more on reference material, such as command syntax and configuration.

   OPTIONS
       -h, -? Print a usage message on standard error and exit successfully.

       -n     Run  THE  without  any  profile.  Normally THE tries to find a profile file and execute this on startup. This switch suppresses that
              search and execute and runs THE in its default mode. This switch is useful for determining if a bug in THE occurs only with  certain
              user-specific customizations.

       -m     On ports of THE that support colour, this switch forces THE into monochrome mode. More a testing feature than a user feature.

       -r     This switch enables THE to be run in read-only mode. In this mode commands that alter the contents of a file are invalid.

       -s     On Unix platforms, this switch enables the writing of a core file if THE crashes.  Normally, THE traps any internal errors and exits
              gracefully.  This switch is a testing feature rather than a user feature.

       -b     When you want to use THE as a non-interactive tool for manipulating the contents of one or more files, this switch will disable  any
              display of file contents and disable keyboard interaction. Normally used in conjunction with a specific profile; see -p option.

       -q     Run  quietly in batch mode. This will suppress the introductory informative message displayed when errors are encountered running in
              batch.

       -k[fmt]
              Allows 'soft label keys'. This allows the display of one (or two) lines at the bottom of the screen with 'buttons'  intended  to  be
              used  to  represent  function keys. These 'soft label keys' can be manipulated with the <SET SLK> command.  The 'fmt' optional extra
              argument is a single digit representing the format of the display of the 'buttons'.

               1 - displays 8 'buttons' in a 4-4 layout
               2 - displays 8 'buttons' in a 3-2-3 layout
               3 - displays 12 'buttons' in a 4-4-4 layout
               4 - displays 12 'buttons' in a 4-4-4 layout with an index line
               5 - displays 10 'buttons' in a 5-5 layout

              Not all platforms support all 5 format options.  On those ports of THE that are mouse-aware, the mouse can be pressed on a 'button',
              and the command assigned the the corresponding function key is executed.

       -l line_num
              This switch specifies the line number to make current when THE starts.

       -c column_num
              This switch specifies the column number to make current when THE starts.

       -p profile
              Specifies the THE profile to run instead of the default profile.

       -a profile_arg
              Specifies the arguments that are passed to the profile specified with the -p switch.

       -w width
              Specifies the maximum line width for a line in the current edit session. Can be overridden with the <SET WIDTH> command.

       -u display_length
              THE  can  run  as  a  binary  editor.  Specifying this switch tells THE to read in the file and display it in 'lines' that are ´dis‐
              play_length´ long.  All end-of-line characters in the file are ignored and are treated as other characters in the file.

       -X X11_switches
              With the X11 port of THE, standard X11 switches can be specified with this switch to dynamically configure the way THE  displays  or
              behaves.  You can also specify XCurses-specific switches here as well.  For more information on the XCurses switches available, con‐
              sult the PDCurses documentation.

       -1     Tells THE to run in 'Single Instance Mode'. The first time THE is run with the -1 switch, it starts as normal. Subsequent executions
              of  THE  with the -1 command-line switch will not start a new instance of THE, rather it will edit the file(s) specified on the com‐
              mand-line in the currently running instance of THE.  This feature is currently only available with the X11 port of the using XCurses
              2.5 and greater.  If the first instance of THE with the -1 switch crashes for any reason, subsequent attempts to run THE with the -1
              switch will hang.  To fix this remove the file (really a FIFO); $HOME/.thefifo and then run THE with the -1 switch again.

       [dir [file [...]]]
              File(s) and/or directory to be edited.

FILES
       /etc/therc
              Global profile file for THE.

       $HOME/.therc
              Local profile file for THE.

       /usr/share/THE/THE_Help.txt
              THE help file name.

ENVIRONMENT VARIABLES
       THE uses the following environment variables:

       THE_HOME_DIR
              The directory in which THE looks for its help file(s) and macro(s).

       THE_HELP_FILE
              The fully qualified file name containing help information.

       THE_PROFILE_FILE
              The fully qualified file name for the local profile file.

       THE_MACRO_PATH
              A list of all directories in which THE is to look for <macro> files.

SEE ALSO
       THE Reference Manual

AUTHOR
       Mark Hessling <mark@rexx.org>.

COPYRIGHT
       Copyright 1991-2010 Mark Hessling. All rights reserved.  THE is distributed under the terms of the GNU General  Public  License  and  comes
       with NO WARRANTY. See the file COPYING for details.

       On Debian systems, the complete text of the GNU General Public License version 2 can be found in `/usr/share/common-licenses/GPL-2'.

WWW
       http://hessling-editor.sourceforge.net

REPORTING BUGS
       Report bugs to <thelist@uiuc.edu>.

MANUAL AUTHORS
       Mark Hessling <mark@rexx.org>.
       Alen Zekulic <alen@nms.hr>.

Debian GNU/Linux                                                   February 2010                                                            THE(1)
