GTK-QUERY-IMMODULE(1)                                                                          [FIXME: manual]                                                                          GTK-QUERY-IMMODULE(1)



NAME
       gtk-query-immodules-2.0 - Input method module registration utility

SYNOPSIS
       gtk-query-immodules-2.0 [--update-cache] [module...]

DESCRIPTION
       gtk-query-immodules-2.0 collects information about loadable input method modules for GTK+ and writes it to the default cache file location, or to stdout.

       If called without arguments, it looks for modules in the GTK+ input method module path.

       If called with arguments, it looks for the specified modules. The arguments may be absolute or relative paths.

       Normally, the output of gtk-query-immodules-2.0 is written to libdir/gtk-2.0/2.10.0/immodules.cache, where GTK+ looks for it by default. If it is written to some other location, the environment
       variable GTK_IM_MODULE_FILE can be set to point GTK+ at the file.

OPTIONS
       --update-cache
           Write the output to the default cache location instead of stdout

ENVIRONMENT
       The environment variable GTK_PATH can be used to prepend directories to the input method module path.

BUGS
       None known yet.



[FIXME: source]                                                                                   08/02/2017                                                                            GTK-QUERY-IMMODULE(1)
