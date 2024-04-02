PYDOC3.5(1)                                                   General Commands Manual                                                  PYDOC3.5(1)

NAME
       pydoc3.5 - the Python documentation tool

SYNOPSIS
       pydoc3.5 name

       pydoc3.5 -k keyword

       pydoc3.5 -p port

       pydoc3.5 -g

       pydoc3.5 -w module [...]

DESCRIPTION
       pydoc3.5  name  Show  text documentation on something.  name may be the name of a Python keyword, topic, function, module, or package, or a
       dotted reference to a class or function within a module or module in a package.  If name contains a '/', it is used as the path to a Python
       source file to document. If name is 'keywords', 'topics', or 'modules', a listing of these things is displayed.

       pydoc3.5 -k keyword Search for a keyword in the synopsis lines of all available modules.

       pydoc3.5 -p port Start an HTTP server on the given port on the local machine.

       pydoc3.5 -g Pop up a graphical interface for finding and serving documentation.

       pydoc3.5  -w  name  [...]  Write out the HTML documentation for a module to a file in the current directory.  If name contains a '/', it is
       treated as a filename; if it names a directory, documentation is written for all the contents.

AUTHOR
       Moshe Zadka, based on "pydoc --help"

                                                                                                                                       PYDOC3.5(1)
