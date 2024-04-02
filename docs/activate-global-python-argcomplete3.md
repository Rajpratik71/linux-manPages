ACTIVATE-GLOBAL-PYTHON-ARGCOMPLETE(1)                              User Commands                             ACTIVATE-GLOBAL-PYTHON-ARGCOMPLETE(1)

NAME
       activate-global-python-argcomplete - activate-global-python-argcomplete - argcomplete utility script

DESCRIPTION
       usage: activate-global-python-argcomplete [-h] [--dest DEST] [--user]

       [--no-defaults]
              [--complete-arguments ...]

       Activate the generic bash-completion script for the argcomplete module.

   optional arguments:
       -h, --help
              show this help message and exit

       --dest DEST
              Specify the bash completion modules directory to install into

       --user Install into user directory (~/.bash_completion.d/)

       --no-defaults
              When no matches are generated, do not fallback to readline's default completion

       --complete-arguments ...
              arguments to call complete with; use of this option discards default options

AUTHORS
       argcomplete module was written by Andrey Kislyuk

SEE ALSO
       Full documentation for argccomplete module is stored at https://argcomplete.readthedocs.org/en/latest/

activate-global-python-argcomplete 1.8.1                           January 2017                              ACTIVATE-GLOBAL-PYTHON-ARGCOMPLETE(1)
