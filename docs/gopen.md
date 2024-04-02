GOPEN(1)                                                       GNUstep System Manual                                                      GOPEN(1)

NAME
       gopen - open files

SYNOPSIS
       gopen [-a application] [-o] [-p] [-NXHost hostname] [filename]

DESCRIPTION
       The gopen command allows you open a file (or directory) as if you had double clicked the object's icon.

       It is possible to specify one or more filenames which are interpreted relative to the current working directory.

       By  default,  gopen will open filename with the application currently assigned to the file's extension. But by specifing the -a flag on the
       command line you can tell gopen to open the file with another application.

       You can also directly print a file without ( -p ) or with ( -p -o ) opening it.

       As with most other GNUstep software, it is easily possible to attach the process to a remote window server using the -NXHost flag.

OPTIONS
       -a application
              use application to open filename

       -o     open filename (may be used in conjunction with -p ).

       -p     print filename instead of opening.

       -NXHost hostname
              attach to remote window server on hostname

EXAMPLES
       Open all files with a .txt extension in the current directory:

       gopen *.txt

       To open a source file in CodeEditor (instead of the current default application), type:

       gopen -a CodeEditor MySourceFile.m

       To print the .plan file in your home folder, use the -p flag:

       gopen -p ~/.plan

BUGS
       Using the -a application argument, gopen allows you to open any kind of file with any application you want. This does,  however,  not  work
       with applications employing the NSDocument architecture as they will only receive filenames whose types the application has registered.  To
       circumvent this limitation, applications may advertise their ability to open all kinds of files through the "*" filetype.   When  gopen  is
       used with only the -a application argument but no filename
        present, the application is simply launched without opening a specific file.

SEE ALSO
       GNUstep(7), openapp(1)

HISTORY
       gopen was written November 2001.

       This manual page was first written July 2003.

AUTHORS
       gopen was written by Gregory Casamento <greg_casamento@yahoo.com>.

       This man page was written by Martin Brecher <martin@mb-itconsulting.com>.

GNUstep                                                             August 2003                                                           GOPEN(1)
