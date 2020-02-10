GTK-BUILDER-TOOL(1)                                                                           User Commands                                                                           GTK-BUILDER-TOOL(1)

NAME
       gtk-builder-tool - GtkBuilder file utility

SYNOPSIS
       gtk-builder-tool [COMMAND] FILE

DESCRIPTION
       gtk-builder-tool can perform various operations on GtkBuilder .ui files.

       You should always test the modified .ui files produced by gtk-builder-tool before using them in production.

COMMANDS
       The following commands are understood:

       validate
           Validates the .ui file and report errors to stderr.

       simplify
           Simplifies the .ui file by removing properties that are set to their default values and write the resulting XML to stdout.

       enumerate
           Lists all the named objects that are created in the .ui file.

GTK+                                                                                                                                                                                  GTK-BUILDER-TOOL(1)
