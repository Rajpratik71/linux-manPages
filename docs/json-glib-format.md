JSON-GLIB-FORMAT(1)                                                                             User Commands                                                                             JSON-GLIB-FORMAT(1)



NAME
       json-glib-format - JSON-GLib formatting tool

SYNOPSIS
       json-glib-format [-h, --help] [--prettify] [--indent-spaces SPACES] URI [URI...]

DESCRIPTION
       json-glib-format offers a simple command line interface to format JSON data. It reads a list or URIs, applies the spacified formatting rules on the JSON data, and outputs the formatted JSON to the
       standard output.

       The resources to operate on are specified by the URI argument.

COMMANDS
       -h, --help
           Prints help and exits.

       -p, --prettify
           Prettifies the output, by adding spaces and indentation. This argument is useful to improve the readability of JSON data, at the expense of its size.

       --indent-spaces SPACES
           Changes the number of spaces using to indent the JSON data from the default of 2. This argument is only considered if --prettify is used.

AUTHOR
       Emmanuele Bassi
           Developer



JSON-GLib                                                                                                                                                                                 JSON-GLIB-FORMAT(1)
