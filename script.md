SCRIPT(1)                       User Commands                       SCRIPT(1)

NAME
       script - make typescript of terminal session

SYNOPSIS
       script [options] [file]

DESCRIPTION
       script  makes  a  typescript of everything displayed on your terminal.
       It is useful for students who need a hardcopy record of an interactive
       session  as  proof  of  an  assignment,  as the typescript file can be
       printed out later with lpr(1).

       If the argument file is given, script saves the dialogue in this file.
       If no filename is given, the dialogue is saved in the file typescript.

OPTIONS
       -a, --append
              Append the output to file or to typescript, retaining the prior
              contents.

       -c, --command command
              Run the command rather than an interactive shell.   This  makes
              it  easy  for  a script to capture the output of a program that
              behaves differently when its stdout is not a tty.

       -e, --return
              Return the exit code of the child process.  Uses the same  for‐
              mat  as  bash  termination  on  signal termination exit code is
              128+n.

       -f, --flush
              Flush output after each write.  This is nice  for  telecoopera‐
              tion:  one person does `mkfifo foo; script -f foo', and another
              can supervise real-time what is being done using `cat foo'.

       --force
              Allow the default output destination, i.e. the typescript file,
              to  be a hard or symbolic link.  The command will follow a sym‐
              bolic link.

       -q, --quiet
              Be quiet (do not write start and done messages to standard out‐
              put).

       -t[file], --timing[=file]
              Output  timing  data  to standard error, or to file when given.
              This data contains two fields, separated by a space.  The first
              field  indicates  how much time elapsed since the previous out‐
              put.  The second field indicates how many characters were  out‐
              put  this  time.   This information can be used to replay type‐
              scripts with realistic typing and output delays.

       -V, --version
              Display version information and exit.

       -h, --help
              Display help text and exit.

NOTES
       The script ends when the forked  shell  exits  (a  control-D  for  the
       Bourne  shell  (sh(1)), and exit, logout or control-d (if ignoreeof is
       not set) for the C-shell, csh(1)).

       Certain interactive commands, such as vi(1),  create  garbage  in  the
       typescript  file.  script works best with commands that do not manipu‐
       late the screen, the results are meant to emulate a hardcopy terminal.

       It is not recommended to run script in  non-interactive  shells.   The
       inner  shell  of  script is always interactive, and this could lead to
       unexpected results.  If you use script  in  the  shell  initialization
       file,  you  have  to avoid entering an infinite loop.  You can use for
       example the .profile file, which is read by login shells only:

              if test -t 0 ; then
                  script
                  exit
              fi

       You should also avoid use of script in command pipes,  as  script  can
       read more input than you would expect.

ENVIRONMENT
       The following environment variable is utilized by script:

       SHELL  If  the  variable SHELL exists, the shell forked by script will
              be that shell.  If SHELL  is  not  set,  the  Bourne  shell  is
              assumed.  (Most shells set this variable automatically).

SEE ALSO
       csh(1) (for the history mechanism), scriptreplay(1)

HISTORY
       The script command appeared in 3.0BSD.

BUGS
       script  places  everything  in  the  log file, including linefeeds and
       backspaces.  This is not what the naive user expects.

       script is primarily designed for interactive terminal sessions.   When
       stdin  is  not  a  terminal (for example: echo foo | script), then the
       session can hang, because the interactive shell within the script ses‐
       sion misses EOF and script has no clue when to close the session.  See
       the NOTES section for more information.

AVAILABILITY
       The script command is part of the util-linux package and is  available
       from   Linux  Kernel  Archive  ⟨https://www.kernel.org/pub/linux/utils
       /util-linux/⟩.

util-linux                        June 2014                         SCRIPT(1)
