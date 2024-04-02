JSON-GLIB-VALIDATE(1)                                                                           User Commands                                                                           JSON-GLIB-VALIDATE(1)



NAME
       json-glib-validate - JSON-GLib validation tool

SYNOPSIS
       json-glib-validate [-h, --help] URI [URI...]

DESCRIPTION
       json-glib-validate offers a simple command line interface to validate JSON data. It lets you list URIs that point to JSON data and checks that the data conforms to the JSON syntax.

       The resources to operate on are specified by the URI argument.

       If the JSON data is valid, json-glib-validate will terminate with an exit code of 0; if the data is invalid, an error will be printed on stderr and json-glib-validate will terminate with a nonzero
       exit code.

COMMANDS
       -h, --help
           Prints help and exits.

AUTHOR
       Emmanuele Bassi
           Developer



JSON-GLib                                                                                                                                                                               JSON-GLIB-VALIDATE(1)
