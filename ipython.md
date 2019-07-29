IPYTHON(1)                                                                              General Commands Manual                                                                             IPYTHON(1)

NAME
       ipython - Tools for Interactive Computing in Python.

SYNOPSIS
       ipython [options] files...

       ipython subcommand [options]...

DESCRIPTION
       An  interactive  Python  shell  with automatic history (input and output), dynamic object introspection, easier configuration, command completion, access to the system shell, integration with
       numerical and scientific computing tools, web notebook, Qt console, and more.

       For more information on how to use IPython, see 'ipython --help', or 'ipython --help-all' for all available command‐line options.

ENVIRONMENT VARIABLES
       IPYTHONDIR
           This is the location where IPython stores all its configuration files.  The default is $HOME/.ipython if IPYTHONDIR is not defined.

           You can see the computed value of IPYTHONDIR with `ipython locate`.

FILES
       IPython uses various configuration files stored in profiles within IPYTHONDIR.  To generate the default configuration files and start configuring IPython, do  'ipython  profile  create',  and
       edit '*_config.py' files located in IPYTHONDIR/profile_default.

AUTHORS
       IPython is written by the IPython Development Team <https://github.com/ipython/ipython>.

                                                                                             July 15, 2011                                                                                  IPYTHON(1)
