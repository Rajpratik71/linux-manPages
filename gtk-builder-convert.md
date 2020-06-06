GTK-BUILDER-CONVER(1)                                                                          [FIXME: manual]                                                                          GTK-BUILDER-CONVER(1)



NAME
       gtk-builder-convert - Glade file conversion utility

SYNOPSIS
       gtk-builder-convert [--skip-windows] [--target-version version] [--root name] {input} {output}

DESCRIPTION
       gtk-builder-convert converts glade files into XML files which can be loaded with GtkBuilder.

       It expects the name of a glade file as the first argument, and writes its output the file specified as the second argument.

OPTIONS
       --skip-windows, -w
           Convert everything but GtkWindow subclasses.

       --target-version, -t
           Some widgets and properties are different between GTK+ versions 2.0 and 3.0, so this option allows to set the desired GTK+ target version.

       --root, -r
           Convert only the widget named name and its children.

BUGS
       Toolbars are not handled.

       Support for accessibility is not yet implemented.

       The script requires a python interpreter to run.



[FIXME: source]                                                                                   08/02/2017                                                                            GTK-BUILDER-CONVER(1)
