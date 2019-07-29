MELD(1)                                                       General Commands Manual                                                      MELD(1)

NAME
       meld - Visual diff and merge tool for the GNOME Desktop

SYNOPSIS
       meld [options]
       meld [options] FILE1
       meld [options] DIR1
       meld [options] FILE1 FILE2 [FILE3]
       meld [options] DIR1 DIR2 [DIR3]

DESCRIPTION
       Meld  is  a  graphical diff viewer and merge application for the GNOME desktop.  It supports 2 and 3-file diffs, recursive directory diffs,
       diffing of directories under version control (Bazaar, CVS, Darcs, Fossil, Git, Mercurial, Monotone), as well as the ability to manually and
       automatically merge file differences.

OPTIONS
       --auto-compare, -a
              Automatically compare all differing files on startup.

       --auto-merge
              Automatically merge files

       --comparison-file=<file>
              Load a saved comparison from a Meld comparison file

       --diff FILE1|DIR1 FILE2|DIR2 [FILE3|DIR3]
              Create a diff tab for the given files or directories.  Note that "meld --diff FILE1 FILE2" is functionally equivalent to "meld FILE1
              FILE2".  However, the --diff argument can be given multiple times for one invocation of meld which allows the user to  automatically
              initiate multiple diffs when meld starts.  See examples below.

       --help, -h
              Print application help and usage.

       --label=<label>, -L <label>
              Set application window title to <label>.

       --newtab, -n
              Open the comparison as a new tab in an already-running instance.

       --output, -o
              Sets  the save path for the middle buffer in a three-pane merge view. This is useful for loading the middle buffer from one file and
              saving it to another, for example in use as a version control merge helper.

       --unified, -u
              Ignored for compatibility

       --version
              Print application version and exit.

EXAMPLES
       meld
              Run meld without initiating a diff.

       meld FILE1
              Initiate a diff between FILE1 and the version-controlled copy of FILE1.

       meld DIR1
              Initiate a recursive diff between DIR1 and the version-controlled copy of DIR1.

       meld FILE1 FILE2
              Initiate a diff between FILE1 and FILE2.

       meld FILE1 FILE2 FILE3
              Initiate a 3-way diff between FILE1, FILE2, and FILE3.

       meld DIR1 DIR2
              Initiate a recursive diff between directory DIR1 and DIR2.

       meld DIR1 DIR2 DIR3
              Initiate a recursive 3-way diff between directory DIR1, DIR2, and DIR3.

       meld --diff FILE1 FILE2 --diff FILE3 FILE4
              Initiate a diff between FILE1 and FILE2, and a separate diff between FILE3 and FILE4.

BUGS
       If you find a bug, please report it at https://bugzilla.gnome.org/buglist.cgi?product=meld or mail a description  of  the  issue  to  meld-
       list@gnome.org.

AUTHORS
       See the AUTHORS text file in meld's source code (http://git.gnome.org/browse/meld/tree/AUTHORS).

                                                                   26 Sept 2010                                                            MELD(1)
