GTK-LAUNCH(1)                                                                                User Commands                                                                               GTK-LAUNCH(1)

NAME
       gtk-launch - Launch an application

SYNOPSIS
       gtk-launch [OPTION...] APPLICATION [URI...]

DESCRIPTION
       gtk-launch launches an application using the given name. The application is started with proper startup notification on a default display, unless specified otherwise.

       gtk-launch takes at least one argument, the name of the application to launch. The name should match application desktop file name, as residing in /usr/share/application, with or without the
       '.desktop' suffix.

       If called with more than one argument, the rest of them besides the application name are considered URI locations and are passed as arguments to the launched application.

OPTIONS
       The following options are understood:

       -?, --help
           Prints a short help text and exits.

       --version
           Prints the program version and exits.

GTK+                                                                                                                                                                                     GTK-LAUNCH(1)
