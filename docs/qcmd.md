QCMD(1)                                General Commands Manual                                QCMD(1)

NAME
       qmv, qcp - Rename or copy files quickly, editing the file names in a text editor

SYNOPSIS
       qcp [OPTION]... [FILE]...

       qmv [OPTION]... [FILE]...

       qcmd --command=COMMAND [OPTION]... [FILE]...

DESCRIPTION
       This manual page document describes the qcp, qmv and qcmd commands.

       The  qmv  program  allows  files  to  be renamed by editing their names in any text editor. By
       changing a letter in a text document, a letter in a filename can be changed. Since  the  files
       are listed after each other, common changes can be made more quickly.

       The qcp program works like qmv, but copies files instead of moving them.

       The  qmv  program  was  built  with  safety  in mind - bogus renames caused by human error are
       avoided by performing as many checks as possible.  Because of this, qmv supports  an  interac‐
       tive  mode where each step in the rename procedure can be executed manually. The default is to
       start qmv in non-interactive mode. However, when there is a conflict or error, qmv  will  drop
       to  interactive  mode  (instead  of losing all user-made changes). For more information on the
       renaming process and interactive mode, see below. This also applies to qcp.

       The qcmd program works just like qmv and qcp but allows you to specify which command  to  exe‐
       cute.

       The  ls(1)  program  is  used  to  list  files to rename or copy. Therefore qmv, qcp, and qcmd
       accepts some ls options.

RENAMING/COPYING PROCESS
       The process of renaming or copying files consists of many steps. They are:

       List files
              Generate a list files to rename from command-line arguments by using ls(1).

       Create an editable text file
              The edit format creates an editable text file with the file names.

       Start the editor
              Start the text editor and wait until the user has finished editing it.

       Read the edited text file
              The edit format reads the edited text file now with updated file names.

       Check rename and reorder to resolve conflicts (qmv only)
              This is a complicated step which involves the following tasks:

              Tag renames where the destination file already exists, renames where the  old  file  is
              now  missing  or  inaccessible, and renames renames where the new name was not changed.
              Perform a topologic sort on the renames, so  that  renaming  b->c,  a->b  is  possible.
              Resolve  cross references by renaming into temporary names, so that renaming e->f, f->e
              (or e->f, f->g, g->e and so on) is possible.

              This step results in a plan of renames.

       Display the plan.
              Display the plan to the user.

       Apply the plan.
              Apply the plan by actually renaming or copying files (unless --dummy was specified).

       If an error occurs during any of the above steps (except the first), qmv/qcp  drops  the  user
       into  the  interactive  mode.  This way no changes should be lost, and errors can be corrected
       manually before continuing.  See below for a description of the interactive mode.

OPTIONS
       These programs follow the usual GNU command line syntax, with long options starting  with  two
       dashes (`-').

       -a, --all
              (Passed to ls.) Do not hide entries starting with `.'.

       -A, --almost-all
              (Passed to ls.) Do not list implied `.' and `..'.

       -B, --ignore-backups
              (Passed to ls.) Do not list implied entries ending with `~'.

       -c     (Passed to ls.) Sort by ctime (time of last modification).

       --command=COMMAND
              Execute COMMAND instead of mv or cp.

       -d, --directory
              (Passed to ls.) List directory entires instead of contents.

       -r, --reverse
              (Passed to ls.) Reverse order while sorting.

       -R, --recursive
              (Passed to ls.) List subdirectories recursively.

       -S     (Passed to ls.) Sort by file size.

       --sort=WORD
              (Passed  to ls.) Sort by extension (-X), none (-U), size (-S), time (-t), version (-v),
              status (-c), time (-t), atime (-u), or access (-u).

       --time=WORD
              (Passed to ls.) If sorting is done by time (--sort=time), sort by atime,  access,  use,
              ctime or status time.

       -t     (Passed to ls.) Sort by modification time.

       -u     (Passed to ls.) Sort by access time.

       -U     (Passed to ls.) Do not sort; list entries in directory order.

       -X     (Passed to ls.) Sort alphabetically by entry extension.

       -f, --format=FORMAT
              Change edit format of text file. See below for possible values.

       -o, --options=OPTIONS
              Pass options to the selected edit format. OPTIONS is in the format

              OPTION[=VALUE][,OPTION[=VALUE]...]

              For a list of available options for each format, use --options=help or see below.

       -i, --interactive
              Start in command mode (see below for information on this mode).

       -e, --editor=PROGRAM
              Specify program to edit text file with. The default program is determined by looking at
              the VISUAL environment variable, or if that is not set, the  EDITOR  environment  vari‐
              able. If that is not set either, use the program called editor.

       --ls=PROGRAM
              Specify  path  of  the  ls  program.  If you omit the directory, the executable will be
              searched for in the directories specified by the PATH environment variable.

       -v, --verbose
              Be more verbose about what is being done.

       --dummy
              Do everything as usually, except actually renaming any files ("dummy" mode).

       --help Show summary of options.

       --version
              Output version information and exit.

EDIT FORMATS
       An edit format is responsible for generating a text file for editing, and parsing it  once  it
       has been edited. The default format is dual-column, but there are other formats as well.

       Not  all  edit formats take the same options. Therefore, it is necessary to specify them using
       the --options (-o) option. This option takes a list of "suboptions" similar to the  -o  option
       in mount(8).

       Available  edit  formats are `single-column' (or `sc'), `dual-column' (or `dc'), and `destina‐
       tion-only' (or `do'). The default format is dual-column.

DUAL-COLUMN FORMAT
       The dual-column format (`dual-column' or `dc') displays files in  two  columns.  This  is  the
       default  and  recommended  format.  The leftmost column is usually the source file name (which
       should not be edited), and the rightmost column the destination file name.

       Supported options:

       swap   Swap location of old and new names when editing. I.e. the leftmost column  is  now  the
              destination file name, and the rightmost the source file name.

       separate
              Put a blank line between all renames.

       tabsize=SIZE
              By  default,  tab  characters  of  size  8 are used to separate the columns.  With this
              option the width of these tab characters can be changed.

       spaces Use space characters instead of tab characters when indenting.

       width=WIDTH
              This option specifies the character position (horizontally) which the second file  name
              starts at.

       autowidth
              Normally, if the source file name is longer than width characters, the destination name
              is printed on the next line instead.  With this option enabled  however,  qmv/qcp  will
              adjust  the  width  so  that  source and destination file names can be displayed on one
              line.

              If a width has been specified with width prior to autowidth, that width will be used as
              a minimum width.

              Example: Assume that width=10,autowidth is specified. Even if all source file names are
              shorter than five characters, the split width would be 10. If there had been  one  file
              name  longer  than  10 characters, the final width would have been more than 10 charac‐
              ters.

              This option is enabled by default.

       indicator1=TEXT
              Text to put before the first file name (column).

       indicator2=TEXT
              Text to put before the second file name (column).

       help   Show summary of edit format options.

SINGLE-COLUMN FORMAT
       The single-column format (`single-column' or `sc') displays files in a single column  -  first
       source file name and on the next line the destination file name.

       Supported options:

       swap   Swap  location  of old and new names when editing. I.e. the first line will contain the
              destination file name, and the next line the source file name.

       separate
              Put a blank line between all renames.

       indicator1=TEXT
              Text to put before the first file name.

       indicator2=TEXT
              Text to put before the second file name.

       help   Show summary of edit format options.

DESTINATION-ONLY FORMAT
       The destination-only format (`destination-only' or `do') displays files only  the  destination
       file  name,  one on each line. This format is generally not recommended, since the only way to
       identify source file name is by looking at the line number. But it may  be  useful  with  some
       text editors.

       Supported options:

       separate
              Put a blank line between all renames (file names).

INTERACTIVE MODE
       In  interactive mode qmv/qcp reads commands from the keyboard, parses them, and executes them.
       This is done using GNU readline.

       The following commands are available:

       ls, list [OPTIONS].. [FILES]..
              Select files to rename. If no files are specified, select all files in  current  direc‐
              tory.  The  accepted options are those which are passed to ls(1). Use `help ls' to dis‐
              play a list of these.

       import FILE
              Read files to rename from a text file. Each line should correspond to an existing  file
              to rename.

       ed, edit
              Edit  renames  in  a text editor. If this command has been run before, and not `all' is
              specified, only edit renames with errors.

       plan   Display the current rename-plan. (This plan is created after `edit'.)

       apply  Apply the current plan, i.e. rename files. Only those files marked as OK  in  the  plan
              will be renamed.

       retry  If  some  rename  failed  earlier  during  `apply', this command will try those renames
              again.

       show   Display the value of the specified configuration variable, or  all  variables  if  none
              specified. See below for a list of configuration variables.

       set VARIABLE VALUE
              Set the value of a configuration variable.

       exit, quit
              Exit  the program. If there are unapplied changes, the user will be notified so, and it
              will be necessary to run this command an extra time to exit the program.

       help [ls|usage]
              If `ls' is specified, display list options. If `usage' is specified,  display  accepted
              command line options. Otherwise display help on commands in interactive mode.

       version
              Display version information.

VARIABLES
       The following variables are available in interactive mode:

       dummy BOOLEAN

       editor STRING

       format STRING

       options STRING
              These variables corresponds to the options with the same name.

       tempfile STRING
              This  variable  contains the name of the temporary file which is edited with `edit'. It
              cannot be set; only be read with `show'.

       A boolean value is specified as `0', `false', `no', `off' or `1',  `true',  `yes',  and  `on'.
       Strings are specified without quotes.

EXAMPLES
       Edit names of files in current directory.
            qmv

       Edit names of files with extension `.c'. Sort files by modification time.
            qmv -t *.c

       Edit names of files using the nedit editor and with column width 100.
            qmv -enedit -owidth=100

REPORTING BUGS
       Report bugs to <oskar@osk.mine.nu>.

AUTHOR
       The author of renameutils and this manual page is Oskar Liljeblad <oskar@osk.mine.nu>.

COPYRIGHT
       Copyright © 2001, 2002, 2004, 2005, 2007, 2008, 2011 Oskar Liljeblad

       This  is free software; see the source for copying conditions.  There is NO warranty; not even
       for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

qcmd (renameutils)                         December 4, 2007                                   QCMD(1)
