GDK-PIXBUF-QUERY-(1)                                                                            User Commands                                                                            GDK-PIXBUF-QUERY-(1)



NAME
       gdk-pixbuf-query-loaders - GdkPixbuf loader registration utility

SYNOPSIS
       gdk-pixbuf-query-loaders [--update-cache] [MODULE...]

DESCRIPTION
       gdk-pixbuf-query-loaders collects information about loadable modules for gdk-pixbuf and writes it to the default cache file location, or to stdout.

       If called without arguments, it looks for modules in the gdk-pixbuf loader directory.

       If called with arguments, it looks for the specified modules. The arguments may be absolute or relative paths.

       Normally, the output of gdk-pixbuf-queryloaders is written to libdir/gdk-pixbuf-2.0/2.10.0/loaders.cache, where gdk-pixbuf looks for it by default. If it is written to some other location, the
       environment variable GDK_PIXBUF_MODULE_FILE can be set to point gdk-pixbuf at the file.

OPTIONS
       --update-cache
           Write the output to the default cache location instead of stdout

ENVIRONMENT
       The environment variable GDK_PIXBUF_MODULEDIR can be used to specify a different loader directory. The default gdk-pixbuf loader directory is libdir/gdk-pixbuf-2.0/version/loaders.



gdk-pixbuf                                                                                                                                                                               GDK-PIXBUF-QUERY-(1)
