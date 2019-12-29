libreoffice(1)                               User Commands                              libreoffice(1)

Name
       libreoffice - LibreOffice office suite

SYNOPSIS
       libreoffice   [--accept=accept-string]   [--base]   [--calc]  [--convert-to  output_file_exten‐
       sion[:output_filter_name]  [--outdir  output_dir]  file]...    [--display   display]   [--draw]
       [--global]   [--headless]   [--help|-h|-?]  [--impress]  [--invisible]  [--infilter="<filter>"]
       [--math] [--minimized] [-n file]... [--nodefault] [--nolockcheck] [--nologo] [--norestore]  [-o
       file]...  [-p  file...]   [--print-to-file  [--printer-name printer_name] [--outdir output_dir]
       file]...  [--pt  printername  file...]   [--show  Impress  file]...  [--unaccept=accept-string]
       [--terminate_after_init] [--view file]... [--web] [--writer]  [file...]
       lobase
       localc
       lodraw
       lofromtemplate
       loimpress
       lomath
       loweb
       lowriter

DESCRIPTION
       LibreOffice  (LO for short) is a multi-platform office productivity suite.  It was derived from
       OpenOffice.org 3.3 Beta on September 28, 2010.

       libreoffice is a shell script that sets up the environment and passes the  command  line  argu‐
       ments to the soffice.bin binary.

       Alternatively, the following helper scripts start the respective module:

       sbase, scalc, sdraw, simpress, smath, sofficerc, swriter

OPTIONS
       --accept=accept-string
              Specifies a UNO-URL connect-string to create a UNO acceptor through which other programs
              can connect to access the API. Note that API access allows execution of  arbitrary  com‐
              mands.   The syntax of a UNO-URL connect-string is: uno:connection-type,params;protocol-
              name,params;ObjectName

       --base Starts the wizard for a new Base document.

       --calc Starts with a new Calc document.

       --convert-to output_file_extension[:output_filter_name] [--outdir output_dir] file...
              Batch converts files.  If --outdir is not specified then the current  working  directory
              is used as the output directory for the converted files. It implies --headless.

              Examples:

              --convert-to pdf *.doc

              Converts all .doc files to PDFs.

              --convert-to pdf:writer_pdf_Export --outdir /home/user *.doc

              Converts  all  .doc files to PDFs using the settings in the Writer PDF export dialog and
              saving them in /home/user.

       --display display
              This option specifies the X server to use; see X(7)

       --draw Starts with a new Draw document.

       --global
              Starts with a new Global document.

       --headless
              Starts in "headless mode", which allows using the application without user a interface.

              This special mode can be used when the application is controlled by external clients via
              the API.

              It  implies --invisible and strictly ignores any GUI environment.  --quickstart does not
              work with this parameter.

       --help|-h|-?
              Lists LibreOffice command line parameters.

       --impress
              Starts with a new Impress document.

       --invisible
              Starts in invisible mode.

              Neither the start-up logo nor the initial program window will be  visible.   LO  can  be
              controlled and documents and dialogs can be opened via the API.

              When started with this parameter, it can only be quit using the taskmanager (Windows) or
              the kill command (UNIX based systems).

              --quickstart does not work with this parameter.

       --infilter="<filter>"
              Force an input filter type if possible.  For example --infilter="Calc Office  Open  XML"
              only

       --math Starts with a new Math document.

       --minimized
              Keeps the splash screen minimized.

       -n template...
              Creates the a new document from the given templates.

       --nodefault
              Starts  LO  without  creating  a  new document.  The next time you start LO, the welcome
              screen is shown.

              It's used together with --nologo by quick starters. Note that --quickstart has no longer
              been supported since OpenOffice.org 2.0.0.

       --nolockcheck
              Disables the check for remote instances using the installation.

       --nologo
              Disables the splash screen at program start.

       --norestore
              Disables restart and file recovery after a system crash. It is possible that LO will try
              to restore a file it keeps crashing on, if that happens --norestore is the only  way  to
              start LO.

       --nosplash
              Disables the splash screen at program start.

       -o file...
              Opens the given files for editing, even templates.

              Without -o a template file would create a new document derived from that template.

       -p file...
              Prints  the  given files to the default printer and ends. The splash screen does not ap‐
              pear.

              If the file name contains spaces, then it must be enclosed in quotation marks.

       --print-to-file [--printer-name printer_name] [--outdir output_dir] file...
              Batch print files to file.  If --printer-name is not specified the  default  printer  is
              used.   If  --outdir  is not specified then the current working directory is used as the
              output directory for the converted files.

              Examples:

              --print-to-file *.doc

              Prints all .doc files to the current working directory using the default printer.

              --print-to-file --printer-name nasty_lowres_printer --outdir /home/user *.doc

              Prints all .doc files to /home/user directory using the nasty_lowres_printer.

       --pt printername file...
              Prints the given files to the printer printername and ends. The splash screen  does  not
              appear.

              If a file name contains spaces, then it must be enclosed in quotation marks.

       --quickstart --quickstart=no
              Starts LO with its quick starter.  --quickstart disable the quick starter.

              Does not work with --invisible or --headless.

       --show Impress file...
              Opens  the  given  Impress files, starts the presentation and quits after they have fin‐
              ished.

       --unaccept=accept-string
              Closes an acceptor that was created with --accept option.

              Use --unaccept=all to close all open acceptors.

       --terminate_after_init
              Starts LO and terminates after it registers some UNO services.  Doesn't show the  splash
              during startup.

       --view file...
              Opens the given files read-only creating a temporary copy of them at $TMPDIR.

       --web  Starts with a new HTML document.

       --writer
              Starts with a new Writer document.

TROUBLESHOOTING PROBLEMS
       See  http://wiki.documentfoundation.org/BugReport for more details on how to report bugs in Li‐
       breOffice.

SEE ALSO
       http://www.documentfoundation.org/

AUTHOR
       This manual page was created by Rene Engelhard <rene@debian.org> for the Debian GNU/Linux  Dis‐
       tribution,  because  the  original package does not have one. It was updated for Novell by Petr
       Mladek  <petr.mladek@novell.com>  and  adapted  for  LibreOffice   by   Philipp   Weissenbacher
       <philipp.weissenbacher@gmail.com>.

LibreOffice                                   2010-12-18                                libreoffice(1)
