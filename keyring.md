KEYRING(1)                 General Commands Manual                 KEYRING(1)

NAME
       keyring - Python-Keyring command-line utility

SYNOPSIS
       keyring [get|set|del] SERVICE USERNAME

OPTIONS
       -h, --help
              Show the help message and exit.

       -p KEYRING_PATH, --keyring-path=KEYRING_PATH
              Specify path to the keyring backend to use.

       -b KEYRING_BACKEND, --keyring-backend=KEYRING_BACKEND
              Specify name of the keyring backend to use.

       --list-backends
              List the available keyring backends and exit.

DESCRIPTION
       keyring  provides a way to store, lookup and delete passwords in vari‐
       ous backends supported by Python-Keyring.

       Usage example:

       $ keyring set system username
       Password for 'username' in 'system':
       $ keyring get system username
       password

                                                                   KEYRING(1)
