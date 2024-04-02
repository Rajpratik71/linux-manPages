REGISTER-PYTHON-ARGCOMPLETE(1)                                     User Commands                                    REGISTER-PYTHON-ARGCOMPLETE(1)

NAME
       register-python-argcomplete - register-python-argcomplete - argcomplete utility script

DESCRIPTION
       usage: register-python-argcomplete [-h] executable

       Register a Python executable for use with the argcomplete module.

       To perform the registration, source the output of this script in your bash shell (quote the output to avoid interpolation).

       Example:

              $ eval "$(register-python-argcomplete my-favorite-script.py)"

   positional arguments:
              executable

   optional arguments:
       -h, --help
              show this help message and exit

AUTHORS
       argcomplete module was written by Andrey Kislyuk

SEE ALSO
       Full documentation for argccomplete module is stored at https://argcomplete.readthedocs.org/en/latest/

register-python-argcomplete 0.3.3                                  January 2013                                     REGISTER-PYTHON-ARGCOMPLETE(1)
