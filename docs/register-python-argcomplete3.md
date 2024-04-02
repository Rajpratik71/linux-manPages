REGISTER-PYTHON-ARGCOMPLETE(1)                                     User Commands                                    REGISTER-PYTHON-ARGCOMPLETE(1)

NAME
       register-python-argcomplete - register-python-argcomplete - argcomplete utility script

DESCRIPTION
       usage: register-python-argcomplete [-h] [--no-defaults]

       [--complete-arguments ...] [-s {bash,tcsh}]
              executable

       Register a Python executable for use with the argcomplete module.

       To perform the registration, source the output of this script in your bash shell (quote the output to avoid interpolation).

       Example:

              $ eval "$(register-python-argcomplete my-favorite-script.py)"

       For Tcsh

              $ eval `register-python-argcomplete --shell tcsh my-favorite-script.py`

   positional arguments:
       executable
              executable to completed (when invoked by exactly this name)

   optional arguments:
       -h, --help
              show this help message and exit

       --no-defaults
              When no matches are generated, do not fallback to readline's default completion

       --complete-arguments ...
              arguments to call complete with; use of this option discards default options

       -s {bash,tcsh}, --shell {bash,tcsh}
              output code for the specified shell

AUTHORS
       argcomplete module was written by Andrey Kislyuk

SEE ALSO
       Full documentation for argccomplete module is stored at https://argcomplete.readthedocs.org/en/latest/

register-python-argcomplete 1.8.1                                  January 2017                                     REGISTER-PYTHON-ARGCOMPLETE(1)
