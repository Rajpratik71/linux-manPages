GTK-BUILDER-TOOL(1)                          User Commands                         GTK-BUILDER-TOOL(1)

NAME
       gtk-builder-tool - GtkBuilder file utility

SYNOPSIS
       gtk-builder-tool [COMMAND] [OPTION...] FILE

DESCRIPTION
       gtk-builder-tool can perform various operations on GtkBuilder .ui files.

       You should always test the modified .ui files produced by gtk-builder-tool before using them in
       production.

COMMANDS
       The following commands are understood:

       validate
           Validates the .ui file and report errors to stderr.

       simplify
           Simplifies the .ui file by removing properties that are set to their default values and
           write the resulting XML to stdout, or back to the input file.

       enumerate
           Lists all the named objects that are created in the .ui file.

       preview
           Preview the .ui file. This command accepts options to specify the ID of an object and a
           .css file to use.

SIMPLIFY OPTIONS
       The simplify command accepts the following options:

       --replace
           Write the content back to the .ui file instead of stdout.

PREVIEW OPTIONS
       The preview command accepts the following options:

       --id=ID
           The ID of the object to preview. If not specified, gtk-builder-tool will choose a suitable
           object on its own.

       --css=FILE
           Load style information from the given .css file.

GTK+                                                                               GTK-BUILDER-TOOL(1)
