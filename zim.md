ZIM(1)                                                             User Commands                                                            ZIM(1)

NAME
       zim - A Desktop Wiki Editor

SYNOPSIS
       usage: zim [OPTIONS] [NOTEBOOK [PAGE]]
          or: zim --server [OPTIONS] [NOTEBOOK]
          or: zim --export [OPTIONS] NOTEBOOK [PAGE]
          or: zim --search NOTEBOOK QUERY
          or: zim --index  NOTEBOOK
          or: zim --plugin PLUGIN [ARGUMENTS]
          or: zim --manual [OPTIONS] [PAGE]
          or: zim --help

DESCRIPTION
       Zim  is a graphical text editor used to maintain a collection of wiki pages.  Each page can contain links to other pages, simple formatting
       and images.  Pages are stored in a folder structure, like in an outliner, and can have attachments. Creating a new page is as easy as link‐
       ing  to a nonexistent page.  All data is stored in plain text files with wiki formatting. Various plugins provide additional functionality,
       like a task list manager, an equation editor, a tray icon, and support for version control.

       Zim can be used to: * Keep an archive of notes * Take notes during meetings or lectures * Organize task lists  *  Draft  blog  entries  and
       emails * Do brainstorming

OPTIONS
       General Options:
         --gui            run the editor (this is the default)
         --server         run the web server
         --export         export to a different format
         --search         run a search query on a notebook
         --index          build an index for a notebook
         --plugin         call a specific plugin function
         --manual         open the user manual
         -V, --verbose    print information to terminal
         -D, --debug      print debug messages
         -v, --version    print version and exit
         -h, --help       print this text

       GUI Options:
         --list           show the list with notebooks instead of
                          opening the default notebook
         --geometry       window size and position as WxH+X+Y
         --fullscreen     start in fullscreen mode
         --standalone     start a single instance, no background process

       Server Options:
         --port           port to use (defaults to 8080)
         --template       name of the template to use
         --gui            run the gui wrapper for the server

       Export Options:
         -o, --output     output directory (mandatory option)
         --format         format to use (defaults to 'html')
         --template       name of the template to use
         --root-url       url to use for the document root
         --index-page     index page name
         -r, --recursive  when exporting a page, also export sub-pages
         -s, --singlefile export all pages to a single output file
         -O, --overwrite  force overwriting existing file(s)

       Search Options:
         None

       Index Options:
         None

       Try 'zim --manual' for more help.

AUTHOR
       Jaap Karssenberg <jaap.karssenberg@gmail.com>

SEE ALSO
       The full documentation for zim is maintained as a zim notebook. The command

              zim --manual

       should give you access to the complete manual.

       The website for zim can be found at http://www.zim-wiki.org

zim 0.65                                                            August 2016                                                             ZIM(1)
