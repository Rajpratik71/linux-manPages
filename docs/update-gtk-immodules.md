UPDATE-GTK-IMMODULES(1)                                                                         User Commands                                                                         UPDATE-GTK-IMMODULES(1)



NAME
       update-gtk-immodules - Update GTK+ immodule cache

SYNOPSIS
       update-gtk-immodules [HOST_TRIPLET]

DESCRIPTION
       update-gtk-immodules is a wrapper around gtk-query-immodules-2.0 that tries to help with multilib installations. It is meant to be used in %post scripts of rpm packages that install input method
       modules for GTK+ 2.x.


       It needs to be given a GNU-style host triplet as argument, such as "x86_64-redhat-linux-gnu". This argument determines where the tool saves the gtk.immodules file that it creates. It must be the
       same as the host triplet that GTK+ was configured with.


FILES
       $libdir/gtk-2.0/2.10.0/immodules.cache - the file created by update-gtk-immodules.


SEE ALSO
       gtk-query-immodules-2.0(1)



GTK+                                                                                                                                                                                  UPDATE-GTK-IMMODULES(1)
