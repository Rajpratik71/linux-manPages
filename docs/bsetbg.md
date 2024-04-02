bsetbg(1)                                                              v2.0                                                              bsetbg(1)

NAME
       bsetbg - utility to manipulate the appearance of the X11 desktop's root window.

SYNOPSIS
       bsetbg [options] image

DESCRIPTION
       bsetbg  is  intended  to  provide a standard method for the Blackbox window manager to alter the background of the root window (although it
       will work with any other window manager as well). bsetbg acts as a wrapper both to bsetroot and to a flexible variety of third-party appli‐
       cations that it uses when handling images files.

OPTIONS
       -f, -full image
              image is stretched to fill the entire desktop.

       -t, -tile image
              image is tiled on the desktop.

       -c, -center image
              image is centered on the desktop.

       -e, -exec program options fallback-arg image
              This option tells bsetbg to run a separate command by executing program with options, where options are arguments to program.

              If  a  fallback-arg  is supplied (-full, -tile, or -center as described above), bsetbg will assume that the last argument is a file‐
              name. In the case that program exits non-zero or isn't available on the target system, bsetbg will try to handle the file  with  the
              fallback argument.

              See the EXAMPLES section for more information on -exec.

       -p, -post list
              Specifies a list of arguments to pass to the $POST_COMMAND.

       -d, -debug
              Debugging mode. bsetbg will print commands without executing them.

       -g, -generate list
              Output  a  list  of default configuration values, suitable for redirecting into ~/.bsetbgrc. Any arguments that are supplied will be
              considered applications to search for in the system path, overriding bsetbg's internal defaults.

       -app imageApp
              Use this flag to specify which image application to use. This application may be one of the  pre-defined  list  or  any  application
              capable  of  displaying an image on the root window. This flag may be used in conjunction with passing application specific  parame‐
              ters to the application, in which case they should be enclosed in double quotes.

       -v, -version
              Output version number.

       -h, -help
              Output a brief usage message.

OTHER OPTIONS
       bsetbg will also accept all of the arguments for bsetroot.  Consult the bsetroot(1) man page for further information.

CONFIGURATION
       bsetbg will read its configuration values from the file ~/.bsetbgrc if it exists. Otherwise, it will scan the system path for a pre-defined
       list  of  image  applications  to  use (currently this list consists of qiv, xli, xv, wmsetbg, Esetroot, display, and xsetbg).  ~/.bsetbgrc
       should contain the following variables:

           CENTER="string"
              Application and arguments to be used to center an image on the root window when the -center argument is specified.

           FULL="string"
              Application and arguments to be used to stretch an image to fill the root window when the -full argument is specified.

           TILE="string"
              Application and arguments to be used to tile an image on the root window when the -tile argument is specified.

           DEFAULT="string"
              Action to take place by default if none of the above have been specified.

       The following variables are optional:

           NO_EXEC="boolean"
              If this variable is set, bsetbg will never modify the root window.

           POST_COMMAND="string"
              This variable specifies a command that bsetbg will run after every successful modification of the root window.

           LOG_LAST_CMD="boolean"
              If this variable is set, bsetbg will keep a logfile of the last two successful commands.

           LOGFILE="string"
              This variable can specify the logfile to be used when $LOG_LAST_CMD is defined.  The default is ~/.bsetbg_last_cmd .

       As mentioned above, bsetbg will function perfectly for the majority of users without having a configuration file. Power users who want more
       control over bsetbg's behavior should run bsetbg -g and use the output to create a ~/.bsetbgrc which may then be tweaked by hand.

EXAMPLES
       In this example, bsetbg will set the image in centered mode:

           bsetbg -center foo.png

       An example of the -exec argument:

           bsetbg -exec xv -root -quit -rmode 5 -rbg rgb:2/2/2 \      -center foo.png

       An example in which bsetbg creates a configuration file using xv and qiv:

            bsetbg -g xv qiv > ~/.bsetbgrc

       An example of the use of the -app argument:

           bsetbg -app qiv "-o rgb:d6/c5/a2 -x" -c foo.png

AUTHOR
       The author of bsetbg may be reached at tmk@lordzork.com.

SEE ALSO
       blackbox(1), bsetroot(1), qiv(1), xli(1), xv(1), display(1), wmsetbg(1)

bsetbg                                                             February 2002                                                         bsetbg(1)
