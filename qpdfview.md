QPDFVIEW(1)                                                   General Commands Manual                                                  QPDFVIEW(1)

NAME
       qpdfview - tabbed document viewer

SYNOPSIS
       qpdfview [options] [--] [file[#page]] [file[#src:name:line:column]] ...

DESCRIPTION
       qpdfview  is a simple viewer for document files in the portable document format (PDF). It uses the Poppler library for rendering and the Qt
       toolkit for its interface.

OPTIONS
       --help Displays usage information.

       --quiet
              Suppresses warning messages which are displayed if the program fails to open a file.

       --search text
              Initiates a search for text in the current tab.

       --unique
              If an instance of qpdfview is started with this option, any files that are opened using this option afterwards, are opened  as  tabs
              in the original window. If a file is already opened in a tab of the original window, it is merely reloaded.

       --instance name
              Uses  name  as  the name of the instance contacted or created using the "--unique" option. This allows one to run multiple instances
              and remotely open and refresh tabs in any of them by passing the instance name. The argument must only contain the  characters  "[A-
              Z][a-z][0-9]_" and must not begin with a digit.

       --choose-instance
              Can  be combined with the "--unique" option to display a dialog at start-up where the instance name can be chosen with all instances
              that have tabs stored as suggestions.

       [file[#page]]
              file specifies the file to open. The optional parameter page opens the file at the given page. Multiple files will be opened in sep‐
              arate tabs.

       [file[#src:name:line:column]]
              Forward search using SyncTeX is performed using the optional parameters name which is the name of the source file, line which is the
              line number in the source file and column which is the column number in the source file where the number 0 matches all lines respec‐
              tively columns.

INTER-PROCESS COMMUNICATION
       If  the program is invoked using the "--unique" option, it registers an introspectable D-Bus interface at "local.qpdfview/MainWindow" which
       can be  used  to  communicate  with  the  application.  If  the  "--instance"  option  is  used,  the  D-Bus  interface  is  registered  at
       "local.qpdfview.name/MainWindow".

CONFIGURATION FILE
       qpdfview uses a configuration file usually located at
              "~/.config/qpdfview/qpdfview.conf".

       The  icon  theme  used by Qt can be changed by setting the key "iconTheme" in the section "mainWindow". The application-wide Qt style sheet
       can be changed by setting the key "styleSheet" in the section "mainWindow".

       The tile size in pixels used for tiled rendering can be adjusted by setting the key "tileSize" in the section "pageItem". The default value
       is 1024 pixels.

       The  mimimum resp. maximum scale factor can be modified by changing the keys "minimumScaleFactor" resp. "maximumScaleFactor" in the section
       "documentView". The default values are 0.1 resp. 10.0.

       The timeout for auto-refresh resp. prefetch can be changed by setting the keys "autoRefreshTimeout" resp. "prefetchTimeout" in the  section
       "documentView". The defaults are 750 resp. 250 milliseconds.

EXAMPLES
              The command
       qpdfview foo.pdf#3 bar.pdf
              opens  "foo.pdf" in the first tab displaying the third page of the document and "bar.pdf" in the second tab displaying the beginning
              of the document.

              The command
       qpdfview --quiet foobar/*
              opens all files that can be opened in the directory "foobar", suppressing warning messages for files that cannot be opened.

              The command
       qpdfview --search foo bar.pdf
              opens "bar.pdf" in the first tab and starts a search for "foo".

              Subsequent execution of the commands
       qpdfview --unique foo.pdf bar.pdf
              and
       qpdfview --unique foo.pdf#5
              opens "foo.pdf" and "bar.pdf", then reloads "foo.pdf" and displays its fifth page.

              Subsequent execution of the commands
       qpdfview --unique foo.pdf
              and
       qpdfview bar.pdf
              and
       qpdfview --unique foo1.pdf bar1.pdf
              opens "foo.pdf" in the first window, "bar.pdf" in a second window and then "foo1.pdf" and "bar1.pdf" in additional tabs in the first
              window.

              Subsequent execution of the commands
       qpdfview --unique --instance a foo1.pdf bar1.pdf
              and
       qpdfview --unique --instance b foo2.pdf bar2.pdf
              and
       qpdfview --unique foo3.pdf bar3.pdf
              and
       qpdfview --unique --instance a foo1.pdf#4 bar4.pdf
              opens  "foo1.pdf"  and  "bar1.pdf" in the first window, "foo2.pdf" and "bar2.pdf" in the second window, "foo3.pdf" and "bar3.pdf" in
              the third window and then reloads "foo1.pdf" and displays its fourth page and opens "bar4.pdf" in an additional  tab  in  the  first
              window.

              Subsequent execution of the commands
       qpdfview --unique --instance a foo.pdf bar.pdf
              and
       qpdfview --unique --instance a --search foobar
              opens "foo.pdf" and "bar.pdf" in a window and then starts a search for the term "foobar" in the document in the active tab (which is
              the last opened "bar.pdf").

              The command
       qpdfview --unique foobar.pdf#src:foobar.tex:42:0
              opens or refreshes "foobar.pdf" jumping to and highlighting the position that corresponds to  line  42  of  the  source  file  "foo‐
              bar.tex".

              The lines
       [documentView]
       autoRefreshTimeout=1250
       [mainWindow]
       styleSheet="QTabBar::tab { max-width: 150px; }"
              will configure the auto-refresh timeout to 1250 milliseconds and the change the maximum tab width to 150 pixel.

BUGS
       If you find a bug, please report it at
              "https://launchpad.net/qpdfview".

                                                                     July 2012                                                         QPDFVIEW(1)
