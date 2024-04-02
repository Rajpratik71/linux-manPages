MARKDOWN_PY(1)                                                General Commands Manual                                               MARKDOWN_PY(1)

NAME
       markdown_py - a Python implementation of John Gruber's Markdown.

SYNOPSIS
       markdown_py [options] [INPUT_FILE]
       (STDIN is assumed if no INPUT_FILE is given)

DESCRIPTION
       Command-line Markdown compiler based on python-markdown module, with extensions support.

OPTIONS
       --version
              Show program's version number and exit.

       -h, --help
              Show the help message and exit.

       -f OUTPUT_FILE, --file=OUTPUT_FILE
              Write output to OUTPUT_FILE. Defaults to STDOUT.

       -e ENCODING, --encoding=ENCODING
              Encoding for input and output files.

       -s SAFE_MODE, --safe=SAFE_MODE
              Deprecated! ´replace´, ´remove´ or ´escape´ HTML tags in input.

       -o OUTPUT_FORMAT, --output_format=OUTPUT_FORMAT
              ´xhtml1´ (default), ´html4´ or ´html5´.

       -n, --no_lazy_ol
              Observe number of first item of ordered lists.

       -x EXTENSION, --extension=EXTENSION
              Load extension EXTENSION.

       -c CONFIG_FILE, --extension_configs=CONFIG_FILE
              Read  extension configurations from CONFIG_FILE.  CONFIG_FILE must be of JSON or YAML format. YAML format requires python-yaml pack‐
              age to be installed. The parsed JSON or YAML must result in a Python dictionary which would be accepted by  the  ´extension_configs´
              keyword on the markdown.Markdown class. The extensions must also be loaded with the --extension option.

       -q, --quiet
              Suppress all warnings.

       -v, --verbose
              Print all warnings.

       --noisy
              Print debug messages.

                                                                                                                                    MARKDOWN_PY(1)
