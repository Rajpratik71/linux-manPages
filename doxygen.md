DOXYGEN(1)                                                                                      User Commands                                                                                      DOXYGEN(1)



NAME
       doxygen - documentation system for various programming languages

DESCRIPTION
       Doxygen is a documentation system for C++, C, Java, Objective-C, IDL (Corba and Microsoft flavors) and to some extent PHP, C#, and D.

       You can use doxygen in a number of ways:

       1) Use doxygen to generate a template configuration file:

              doxygen [-s] -g [configName]

              If - is used for configName doxygen will write to standard output.

       2) Use doxygen to update an old configuration file:

              doxygen [-s] -u [configName]

       3) Use doxygen to generate documentation using an existing configuration file:

              doxygen [configName]

              If - is used for configName doxygen will read from standard input.

       4) Use doxygen to generate a template file controlling the layout of the generated documentation:

              doxygen -l layoutFileName.xml

       5) Use doxygen to generate a template style sheet file for RTF, HTML or Latex.

       RTF:   doxygen -w rtf styleSheetFile

       HTML:  doxygen -w html headerFile footerFile styleSheetFile [configFile]

       LaTeX: doxygen -w latex headerFile footerFile styleSheetFile [configFile]

       6) Use doxygen to generate an rtf extensions file

       RTF:   doxygen -e rtf extensionsFile

       If -s is specified the comments in the config file will be omitted.  If configName is omitted `Doxyfile' will be used as a default.

AUTHOR
       Doxygen version 1.8.5, Copyright Dimitri van Heesch 1997-2013

SEE ALSO
       doxywizard(1).



doxygen 1.8.5                                                                                     June 2014                                                                                        DOXYGEN(1)
