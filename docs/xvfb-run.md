xvfb-run(1)                                                   General Commands Manual                                                  xvfb-run(1)

NAME
       xvfb-run - run specified X client or command in a virtual X server environment

SYNOPSIS
       xvfb-run [ options ] command

DESCRIPTION
       xvfb-run is a wrapper for the Xvfb(1x) command which simplifies the task of running commands (typically an X client, or a script containing
       a list of clients to be run) within a virtual X server environment.

       xvfb-run sets up an X authority file (or uses an existing user-specified one), writes a cookie to it (see xauth(1x)) and  then  starts  the
       Xvfb X server as a background process.  The process ID of Xvfb is stored for later use.  The specified command is then run using the X dis‐
       play corresponding to the Xvfb server just started and the X authority file created earlier.

       When the command exits, its status is saved, the Xvfb server is killed (using the process  ID  stored  earlier),  the  X  authority  cookie
       removed,  and  the  authority  file deleted (if the user did not specify one to use).  xvfb-run then exits with the exit status of command,
       except in error conditions (see EXIT STATUS below).

       xvfb-run requires the xauth command to function.

OPTIONS
       -a, --auto-servernum
              Try to get a free server number, starting at 99, or the argument to --server-num.

       -e file, --error-file=file
              Store output from xauth and Xvfb in file.  The default is /dev/null.

       -f file, --auth-file=file
              Store X authentication data in file.  By default, a temporary directory called xvfb-run.PID (where PID is the process ID of xvfb-run
              itself)  is  created  in the directory specified by the environment variable TMPDIR (or /tmp if that variable is null or unset), and
              the tempfile(1) command is used to create a file in that temporary directory called Xauthority.

       -h, --help
              Display a usage message and exit.

       -n servernumber, --server-num=servernumber
              Use servernumber as the server number (but see the -a, --auto-servernum option above).  The default is 99.

       -l, --listen-tcp
              Enable TCP port listening in the X server.  For security reasons (to avoid denial-of-service attacks or exploits), TCP port  listen‐
              ing is disabled by default.

       -p protocolname, --xauth-protocol=protocolname
              Use  protocolname as the X authority protocol to use.  The default is ‘.’, which xauth interprets as its own default protocol, which
              is MIT-MAGIC-COOKIE-1.

       -s arguments, --server-args=arguments
              Pass arguments to the Xvfb server.  Be careful to quote any whitespace characters that may occur within arguments  to  prevent  them
              from  regarded  as separators for xvfb-run's own arguments.  Also, note that specification of ‘-nolisten tcp’ in arguments may over‐
              ride the function of xvfb-run's own -l, --listen-tcp option, and that specification of the server number (e.g., ‘:1’) may be ignored
              because  of  the  way  the X server parses its argument list.  Use the xvfb-run option -n servernumber, --server-num=servernumber to
              achieve the latter function.  The default is ‘-screen 0 640x480x8’.

       -w delay, --wait=delay
              Ignored for compatibility with earlier versions.

ENVIRONMENT
       COLUMNS
              indicates the width of the terminal device in character cells.  This value is used for formatting diagnostic messages.  If not  set,
              the terminal is queried using stty(1) to determine its width.  If that fails, a value of ‘80’ is assumed.

       TMPDIR specifies the directory in which to place xvfb-run's temporary directory for storage of the X authority file; only used if the -f or
              --auth-file options are not specified.

OUTPUT FILES
       Unless the -f or --auth-file options are specified, a temporary directory and file within it are created  (and  deleted)  to  store  the  X
       authority  cookies used by the Xvfb server and client(s) run under it.  See tempfile(1).  If -f or --auth-file are used, then the specified
       X authority file is only written to, not created or deleted (though xauth creates an authority file itself if told to use use that does not
       already exist).

       An error file with a user-specified name is also created if the -e or --error-file options are specifed; see above.

EXIT STATUS
       xvfb-run uses its exit status as well as output to standard error to communicate diagnostics.

       0      xvfb-run  only uses this exit status if the -h, --help option is given.  In all other situations, this may be interpreted as success
              of the specified command.

       1      Xvfb did not start correctly.

       2      No command to run was specified.

       3      The xauth command is not available.

       4      The temporary directory that was going to be used already exists; since xvfb-run produces a uniquely named directory, this may indi‐
              cate an attempt by another process on the system to exploit a temporary file race condition.

       5      A problem was encountered while cleaning up the temporary directory.

       6      A problem was encountered while using getopt(1) to parse the command-line arguments.

EXAMPLES
       xvfb-run --auto-servernum --server-num=1 xlogo
              runs the xlogo(1x) demonstration client inside the Xvfb X server on the first available server number greater than or equal to 1.

       xvfb-run --server-args="-screen 0 1024x768x24" ico -faces
              runs the ico(1x) demonstration client (and passes it the -faces argument) inside the Xvfb X server, configured with a root window of
              1024 by 768 pixels and a color depth of 24 bits.

       Note that the demo X clients used in the above examples will not exit on their own, so they will have to be  killed  before  xvfb-run  will
       exit.

BUGS
       See  the  Debian  Bug  Tracking System ⟨http://bugs.debian.org/xvfb⟩.  If you wish to report a bug in xvfb-run, please use the reportbug(1)
       command.

AUTHOR
       xvfb-run was written by Branden Robinson and Jeff Licquia with sponsorship from Progeny Linux Systems.

SEE ALSO
       Xvfb(1x), xauth(1x)

Debian Project                                                      2004-11-12                                                         xvfb-run(1)
