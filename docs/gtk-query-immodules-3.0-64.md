GTK-QUERY-IMMODULE(1)                                                                           User Commands                                                                           GTK-QUERY-IMMODULE(1)



NAME
       gtk-query-immodules-3.0 - Input method module registration utility

SYNOPSIS
       gtk-query-immodules-3.0 [--update-cache] [MODULE...]

DESCRIPTION
       gtk-query-immodules-3.0 collects information about loadable input method modules for GTK+ and writes it to the default cache file location, or to stdout.

       If called without arguments, it looks for modules in the GTK+ input method module path.

       If called with arguments, it looks for the specified modules. The arguments may be absolute or relative paths.

       Normally, the output of gtk-query-immodules-3.0 is written to libdir/gtk-3.0/3.0.0/immodules.cache, where GTK+ looks for it by default. If it is written to some other location, the
       GTK_IM_MODULE_FILE environment variable can be set to point GTK+ at the file.

OPTIONS
       --update-cache
           Write the output to the default cache location instead of stdout

FILES
       libdir/gtk-3.0/3.0.0/immodules.cache
           The default im cache file used by GTK+ applications

ENVIRONMENT
       GTK_PATH
           Prepends directories to the input method module path

       GTK_IM_MODULE_FILE
           Specifies an alternative im module cache for GTK+ applications



GTK+                                                                                                                                                                                    GTK-QUERY-IMMODULE(1)
