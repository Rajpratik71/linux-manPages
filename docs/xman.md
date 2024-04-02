XMAN(1)                                                                                 General Commands Manual                                                                                XMAN(1)

NAME
       xman - Manual page display program for the X Window System

SYNOPSIS
       xman [ -options ... ]

DESCRIPTION
       Xman  is  a  manual page browser.  The default size of the initial xman window is small so that you can leave it running throughout your entire login session.  In the initial window there are
       three options: Help will pop up a window with on-line help, Quit will exit, and Manual Page will pop up a window with a manual page browser in it.  Typing  Control-S  will  pop  up  a  window
       prompting for a specific manual page to display.  You may display more than one manual page browser window at a time from a single execution of xman.

       For further information on using xman, please read the on-line help information.  Most of this manual will discuss customization of xman.

OPTIONS
       Xman supports all standard Toolkit command line arguments (see X(7)).  The following additional arguments are supported.

       -helpfile filename
              Specifies a helpfile to use other than the default.

       -bothshown
              Allows both the manual page and manual directory to be on the screen at the same time.

       -notopbox
              Starts without the Top Menu with the three buttons in it.

       -geometry WxH+X+Y
              Sets the size and location of the Top Menu with the three buttons in it.

       -pagesize WxH+X+Y
              Sets the size and location of all the Manual Pages.

CUSTOMIZING XMAN
       Xman  allows  customization  of  both the directories to be searched for manual pages, and the name that each directory will map to in the Sections menu.  Xman determines which directories it
       will search by reading the MANPATH environment variable.  If no MANPATH is found then the directory is /usr/man is searched on POSIX systems.  This environment is expected to be a colon-sepa‐
       rated list of directories for xman to search.

       setenv MANPATH /mit/kit/man:/usr/man

       By default, xman will search each of the following directories (in each of the directories specified in the users MANPATH) for manual pages.  If manual pages exist in that directory then they
       are added to list of manual pages for the corresponding menu item.  A menu item is only displayed for those sections that actually contain manual pages.

       Directory   Section Name
       -           -
       man1        (1) User Commands
       man2        (2) System Calls
       man3        (3) Subroutines
       man4        (4) Devices
       man5        (5) File Formats
       man6        (6) Games
       man7        (7) Miscellaneous
       man8        (8) Sys. Administration
       manl        (l) Local
       mann        (n) New
       mano        (o) Old

       For instance, a user has three directories in her manual path and each contain a directory called man3.  All these manual pages will appear alphabetically sorted when  the  user  selects  the
       menu  item  called  (3) Subroutines.  If there is no directory called mano in any of the directories in her MANPATH, or there are no manual pages in any of the directories called mano then no
       menu item will be displayed for the section called (o) Old.

BSD AND LINUX SYSTEMS
       In newer BSD and Linux systems, Xman will search for a file named /etc/man.conf which will contain the list of directories containing manual pages. See man.conf(5) for a complete  description
       of the file format.

THE MANDESC FILE
       By using the mandesc file a user or system manager is able to more closely control which manual pages will appear in each of the sections represented by menu items in the Sections menu.  This
       functionality is only available on a section by section basis, and individual manual pages may not be handled in this manner.  (Although generous use of symbolic links  —  see  ln(1)  —  will
       allow almost any configuration you can imagine.)

       The format of the mandesc file is a character followed by a label.  The character determines which of the sections will be added under this label.  For instance suppose that you would like to
       create an extra menu item that contains all programmer subroutines.  This label should contain all manual pages in both sections two and three.  The mandesc file would look like this:

       2Programmer Subroutines
       3Programmer Subroutines

       This will add a menu item to the Sections menu that would bring up a listing of all manual pages in sections two and three of the Programmers Manual.  Since the label names  are  exactly  the
       same they will be added to the same section. Note, however, that the original sections still exist.

       If you want to completely ignore the default sections in a manual directory then add the line:

       no default sections

       anywhere  in  your  mandesc  file.   This keeps xman from searching the default manual sections In that directory only.  As an example, suppose you want to do the same thing as above, but you
       don't think that it is useful to have the System Calls or Subroutines sections any longer.  You would need to duplicate the default entries, as well as adding your new one.

       no default sections
       1(1) User Commands
       2Programmer Subroutines
       3Programmer Subroutines
       4(4) Devices
       5(5) File Formats
       6(6) Games
       7(7) Miscellaneous
       8(8) Sys. Administration
       l(l) Local
       n(n) New
       o(o) Old

       Xman will read any section that is of the from man<character>, where <character> is an upper or lower case letter (they are treated distinctly) or a numeral (0-9).  Be warned,  however,  that
       man(1) and catman(8) will not search directories that are non-standard.

WIDGETS
       In  order  to  specify resources, it is useful to know the hierarchy of the widgets which compose xman.  In the notation below, indentation indicates hierarchical structure.  The widget class
       name is given first, followed by the widget instance name.

       Xman xman       (This widget is never used)
               TopLevelShell  topBox
                       Form  form
                               Label  topLabel
                               Command  helpButton
                               Command  quitButton
                               Command  manpageButton
                       TransientShell  search
                               DialogWidgetClass  dialog
                                       Label  label
                                       Text  value
                                       Command  manualPage
                                       Command  apropos
                                       Command  cancel
                       TransientShell  pleaseStandBy
                               Label  label
               TopLevelShell  manualBrowser
                       Paned  Manpage_Vpane
                               Paned  horizPane
                                       MenuButton  options
                                       MenuButton  sections
                                       Label  manualBrowser
                               Viewport  directory
                                       List  directory
                                       List  directory
                                       .
                                       . (one for each section,
                                       .  created on the fly)
                                       .
                               ScrollByLine  manualPage
                       SimpleMenu  optionMenu
                               SmeBSB  displayDirectory
                               SmeBSB  displayManualPage
                               SmeBSB  help
                               SmeBSB  search
                               SmeBSB  showBothScreens
                               SmeBSB  removeThisManpage
                               SmeBSB  openNewManpage
                               SmeBSB  showVersion
                               SmeBSB  quit
                       SimpleMenu  sectionMenu
                               SmeBSB  <name of section>
                                       .
                                       . (one for each section)
                                       .
                       TransientShell  search
                               DialogWidgetClass  dialog
                                       Label  label
                                       Text  value
                                       Command  manualPage
                                       Command  apropos
                                       Command  cancel
                       TransientShell  pleaseStandBy
                               Label  label
                       TransientShell  likeToSave
                               Dialog  dialog
                                       Label  label
                                       Text  value
                                       Command  yes
                                       Command  no
               TopLevelShell  help
                       Paned  Manpage_Vpane
                               Paned  horizPane
                                       MenuButton  options
                                       MenuButton  sections
                                       Label  manualBrowser
                               ScrollByLine  manualPage
                       SimpleMenu  optionMenu
                               SmeBSB  displayDirectory
                               SmeBSB  displayManualPage
                               SmeBSB  help
                               SmeBSB  search
                               SmeBSB  showBothScreens
                               SmeBSB  removeThisManpage
                               SmeBSB  openNewManpage
                               SmeBSB  showVersion
                               SmeBSB  quit

APPLICATION RESOURCES
       xman has the following application-specific resources which allow customizations unique to xman.

       manualFontNormal (Class Font)
                         The font to use for normal text in the manual pages.

       manualFontBold (Class Font)
                         The font to use for bold text in the manual pages.

       manualFontItalic (Class Font)
                         The font to use for italic text in the manual pages.

       directoryFontNormal (Class Font)
                         The font to use for the directory text.

       bothShown (Class Boolean)
                         Either `true' or `false,' specifies whether or not you want both the directory and the manual page shown at start up.

       directoryHeight (Class DirectoryHeight)
                         The height in pixels of the directory, when the directory and the manual page are shown simultaneously.

       topCursor (Class Cursor)
                         The cursor to use in the top box.

       helpCursor (Class Cursor)
                         The cursor to use in the help window.

       manpageCursor (Class Cursor)
                         The cursor to use in the manual page window.

       searchEntryCursor (Class Cursor)
                         The cursor to use in the search entry text widget.

       pointerColor (Class Foreground)
                         This is the color of all the cursors (pointers) specified above.  The name was chosen to be compatible with xterm.

       helpFile  (Class File)
                         Use this rather than the system default helpfile.

       topBox (Class Boolean)
                         Either `true' or `false,' determines whether the top box (containing the help, quit and manual page buttons) or a manual page is put on the screen at start-up.  The  default
                         is true.

       verticalList (Class Boolean)
                         Either `true' or `false,' determines whether the directory listing is vertically or horizontally organized.  The default is horizontal (false).

GLOBAL ACTIONS
       Xman  defines all user interaction through global actions.  This allows the user to modify the translation table of any widget, and bind any event to the new user action.  The list of actions
       supported by xman are:

       GotoPage(page) When used in a manual page display window this will allow the user to move between a directory and manual page display.  The page argument can be either  Directory  or  Manual‐
                      Page.

       Quit()         This action may be used anywhere, and will exit xman.

       Search(type, action)
                      Only useful when used in a search popup, this action will cause the search widget to perform the named search type on the string in the search popup's value widget. This action
                      will also pop down the search widget. The type argument can be either Apropos, Manpage or Cancel.  If an action of Open is specified then xman will open a new  manual  page  to
                      display the results of the search, otherwise xman will attempt to display the results in the parent of the search popup.

       PopupHelp()    This action may be used anywhere, and will popup the help widget.

       PopupSearch()  This  action  may  be  used  anywhere except in a help window.  It will cause the search popup to become active and visible on the screen, allowing the user search for a manual
                      page.

       CreateNewManpage()
                      This action may be used anywhere, and will create a new manual page display window.

       RemoveThisManpage()
                      This action may be used in any manual page or help display window.  When called it will remove the window, and clean up all resources associated with it.

       SaveFormattedPage(action)
                      This action can only be used in the likeToSave popup widget, and tells xman whether to Save or Cancel a save of the manual page that has just been formatted.

       ShowVersion()  This action may be called from any manual page or help display window, and will cause the informational display line to show the current version of xman.

FILES
       <manpath directory>/man<character>

       <manpath directory>/cat<character>

       <manpath directory>/mandesc

       /etc/X11/app-defaults/Xman
                                specifies required resources.

       /tmp                     Xman creates temporary files in /tmp for all unformatted man pages and all apropos searches.

SEE ALSO
       X(7), man(1), apropos(1), catman(8), Athena Widget Set

ENVIRONMENT
       DISPLAY        the default host and display to use.

       MANPATH        the search path for manual pages.  Directories are separated by colons (e.g. /usr/man:/mit/kit/man:/foo/bar/man).

       XENVIRONMENT   to get the name of a resource file that overrides the global resources stored in the RESOURCE_MANAGER property.

       XAPPLRESDIR    A string that will have ``Xman'' appended to it.  This string will be the full path name of a user app-defaults file to be merged into the resource database  after  the  system
                      app-defaults file, and before the resources that are attached to the display.
                      See X(7) for a full statement of rights and permissions.

AUTHORS
       Chris Peterson, MIT X Consortium from the V10 version written by Barry Shein formerly of Boston University.  Bug fixes and Linux support by Carlos A M dos Santos, for The XFree86 Project.

X Version 11                                                                                  xman 1.1.4                                                                                       XMAN(1)
