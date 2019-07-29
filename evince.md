evince(1)                                                     General Commands Manual                                                    evince(1)

NAME
       evince - GNOME document viewer

       The Evince Document Viewer application for the GNOME desktop environment

SYNTAX
       evince  [--help]  [--page-label=PAGE | --page-index=NUMBER | --named-dest=DEST] [--fullscreen] [--presentation] [--preview] [--find=STRING]
       [filename(s)...]

DESCRIPTION
       evince

       Evince is a document viewer capable of displaying multiple and single page document formats like PDF  and  Postscript.   For  more  general
       information about Evince please visit our website at http://www.gnome.org/projects/evince/

OPTIONS
       -?, -h, --help
              Prints the command line options.

       -p, --page-label=PAGE
              Open the document on the page with the specified page label (or page number).

       -i, --page-index=NUMBER
              Open the document on the page with the specified page index (this is the exact page number, not a page label).

       -n, --named-dest=DEST
              Open the document on the specified named destination.

       -f, --fullscreen
              Run evince in fullscreen mode.

       -s, --presentation
              Run evince in presentation mode.

       -l, --find=string
              You can pass a word or phrase here. If it exists, evince will display the document and the first match.

       filename(s)...
              Specifies  the  file  to  open  when Evince starts. If this is not specified, Evince will open a blank window. Multiple files can be
              loaded if they are separated by spaces.  Evince also supports handling of remote files.  For example, you can pass the  location  on
              the web or load a file from a FTP server, like "ftp://adobe.com/sample.pdf".

Print preview options
       These  options  are  primarily  intended  for  use  with  the  GTK+  print  preview  function. For more information about these options see
       http://developer.gnome.org/gtk3/stable/GtkSettings.html#GtkSettings--gtk-print-preview-command

       -w, --preview
              Run evince as a previewer.

       --unlink-temp-file
              If evince is run in preview mode, this will unlink the temporary file created by GTK+.

       --print-settings %s %f
              This sends the full path of the PDF file, f, and the settings of the print dialog, s, to evince.

BUGS
       If you find a bug, please report it at http://bugzilla.gnome.org/enter_bug.cgi?product=evince.

GNOME                                                               19 Jun 2011                                                          evince(1)
