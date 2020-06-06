unopkg(1)                                                                                      User Command                                                                                     unopkg(1)

Name
       unopkg - LibreOffice Extension Manager

SYNOPSIS
       unopkg [add] <options> extension-path...
       unopkg [remove] <options> extension-identifier...
       unopkg [list] <options> extension-identifier...
       unopkg [reinstall] <options>
       unopkg [gui]
       unopkg [--help|-h]

DESCRIPTION
       LibreOffice is a fully featured office suite for the daily use with all features you would normally expect in an office suite.

       There exists many LibreOffice extensions all over the word. For example, see http://extensions.libreoffice.org/

       This tool allows managing the extensions from the command line.

SUB-COMMANDS
       add    add the given extensions

       remove remove extensions by the given identifiers

       reinstall
              reinstall all deployed extensions (only for experts)

       list   list information about the deployed extensions

       gui    raise Extension Manager Graphical User Interface (GUI)

OPTIONS
       --help|-h
              display help and exit

       --version|-V
              output version information and exit

       --verbose|-v
              verbose output

       --force|-f
              force overwriting existing extensions

       --log-file <file>
              custom log file; the default one is <cache-dir>/log.txt

       --shared|-f
              operate on the system installation deployment context; use only when no concurrent Office process(es) are running! (only for experts)

       --deployment-context <context>
              operate on explicit deployment context (only for experts)

TROUBLESHOOTING PROBLEMS
       See http://wiki.documentfoundation.org/BugReport for more details about how to report bugs in LibreOffice.

SEE ALSO
       http://www.documentfoundation.org/

AUTHOR
       This manual page was created by Petr Mladek <pmladek@suse.cz>.

LibreOffice Extension Manager                                                                   2008-03-18                                                                                      unopkg(1)
