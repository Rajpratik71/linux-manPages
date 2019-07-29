tcldocstrip(1)                                                Textprocessing toolbox                                                tcldocstrip(1)

__________________________________________________________________________________________________________________________________________________

NAME
       tcldocstrip - Tcl-based Docstrip Processor

SYNOPSIS
       tcldocstrip output ?options? input ?guards?

       tcldocstrip ?options? output (?options? input guards)...

       tcldocstrip -guards input

__________________________________________________________________________________________________________________________________________________

DESCRIPTION
       The application described by this document, tcldocstrip, is a relative of docstrip, a simple literate programming tool for LaTeX.

       tcldocstrip is based upon the package docstrip.

   USE CASES
       tcldocstrip was written with the following three use cases in mind.

       [1]    Conversion  of  a  single input file according to the listed guards into the stripped output. This handles the most simple case of a
              set of guards specifying a single document found in a single input file.

       [2]    Stitching, or the assembly of an output from several sets of guards, in a specific order, and possibly from different files. This is
              the second common case. One document spread over several inputs, and/or spread over different guard sets.

       [3]    Extraction  and  listing of all the unique guard expressions and guards used within a document to help a person which did not author
              the document in question in familiarizing itself with it.

   COMMAND LINE
       tcldocstrip output ?options? input ?guards?
              This is the form for use case [1]. It converts the input file according to the specified guards and options. The result  is  written
              to  the named output file.  Usage of the string - as the name of the output signals that the result should be written to stdout. The
              guards are document-specific and have to be known to the caller. The options will be explained later, in section OPTIONS.

              path output (in)
                     This argument specifies where to write the generated document. It can be the path to a file or directory,  or  -.   The  last
                     value causes the application to write the generated documented to stdout.

                     If the output does not exist then [file dirname $output] has to exist and must be a writable directory.

              path inputfile (in)
                     This argument specifies the path to the file to process. It has to exist, must be readable, and written in docstrip format.

       tcldocstrip ?options? output (?options? input guards)...
              This  is the form for use case [2]. It differs from the form for use case [1] by the possibility of having options before the output
              file, which apply in general, and specifying more than one inputfile, each with its own set of input specific options and guards.

              It extracts data from the various input files, according to the specified options and guards, and writes the  result  to  the  given
              output,  in  the  order of their specification on the command line. Options specified before the output are global settings, whereas
              the options specified before each input are valid only just for this input file. Unspecified values are taken from the  global  set‐
              tings,  or defaults. As for form [1] using the string - as output causes the application to write to stdout.  Using the string . for
              an input file signals that the last input file should be used again. This enables the assembly of the output  from  one  input  file
              using multiple and different sets of guards, without having to specify the full name of the file every time.

       tcldocstrip -guards input
              This  is the form for use case [3].  It determines the guards, and unique guard expressions used within the provided input document.
              The found strings are written to stdout, one string per line.

   OPTIONS
       This section describes all the options available to the user of the application, with the exception of the option -guards. This option  was
       described already, in section COMMAND LINE.

       -metaprefix string
              This option is inherited from the command docstrip::extract provided by the package docstrip.

              It  specifies  the string by which the '%%' prefix of a metacomment line will be replaced. Defaults to '%%'. For Tcl code this would
              typically be '#'.

       -onerror mode
              This option is inherited from the command docstrip::extract provided by the package docstrip.

              It controls what will be done when a format error in the text being processed is detected. The settings are:

              ignore Just ignore the error; continue as if nothing happened.

              puts   Write an error message to stderr, then continue processing.

              throw  Throw an error. ::errorCode is set to a list whose first element is DOCSTRIP, second element is the type of error, and  third
                     element is the line number where the error is detected. This is the default.

       -trimlines bool
              This option is inherited from the command docstrip::extract provided by the package docstrip.

              Controls whether spaces at the end of a line should be trimmed away before the line is processed. Defaults to true.

       -preamble text

       -postamble text

       -nopreamble

       -nopostamble
              The  -no*amble options deactivate file pre- and postambles altogether, whereas the -*amble options specify the user part of the file
              pre- and postambles. This part can be empty, in that case only the standard parts are shown. This is the default.

              Preambles, when active, are written before the actual content of a generated file. In the same manner postambles are,  when  active,
              written after the actual content of a generated file.

BUGS, IDEAS, FEEDBACK
       This document, and the package it describes, will undoubtedly contain bugs and other problems.  Please report such in the category docstrip
       of the Tcllib Trackers [http://core.tcl.tk/tcllib/reportlist].  Please also report any ideas for enhancements you may have for either pack‐
       age and/or documentation.

SEE ALSO
       docstrip

KEYWORDS
       \.dtx, LaTeX, conversion, docstrip, documentation, literate programming, markup, source

CATEGORY
       Documentation tools

COPYRIGHT
       Copyright (c) 2005 Andreas Kupries <andreas_kupries@users.sourceforge.net>

tcllib                                                                  1.0                                                         tcldocstrip(1)
