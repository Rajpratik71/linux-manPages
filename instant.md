instant(1)                                                    General Commands Manual                                                   instant(1)

Name
       instant - manipulates ESIS from parsed SGML instance

Synopsis
       instant [ -bhuvxHISW ]  [ -t file]  [ -s file]  [ -c file]  [ -o file]  [ -D variable=value ...]  [ -i id]  [ -l directory]  [file]

Description
       The instant program manipulates an SGML document instance in a variety of ways, including translating into a form suitable for a formatting
       application and printing information about this instance.  Input to instant is the output of nsgmls, whose format is called Element  Struc‐
       ture Information Set (ESIS).

Flags
       The following are the possible command line options to instant. Output is sent to the standard output, except where otherwise noted.

       -t file
              Translate  the SGML instance to another form, usually suitable for a formatting application.  The file is called a translation spec,
              which specifies how the tags are to be translated. See transpec(5).  By convention, names for file use the suffix .ts, for  transla‐
              tion spec.

       -s file
              Specifies a file of mappings for SDATA entities in the instance.  The file is of two columns, separated by one or more tabs.  Spaces
              can not be used as the separator because spaces are allowable as the content of the columns.  The first column is the entity data to
              map,  the  second  is  the string that the data is mapped to.  The entity data is typically what is found in public ISO entity sets,
              such as the General Technical and Publishing sets.  The mappings are specific to the formatting application used.  For  example,  to
              map the em dash entity, [mdash ], in the Publishing set to the TeX representation, the first column would be [mdash ] and the second
              column ---.  Lines beginning with a # are comments, and are ignored. Empty lines are also ignored.

       -c file
              Specifies a file of string mappings for characters in the instance.  The file is of two columns,  separated  by  white  space.   The
              first  is  the character to map, the second is the string that the character is mapped to.  The mappings are specific to the format‐
              ting application used.  Lines beginning with a # are comments, and are ignored. Empty lines are also ignored.

       -d     strip newline at the beginning of data records

       -f length
              Set the threshold for the length, in characters, of an <Entry>, over which it is called a block of filled text, to length.

       -o file
              Write all output (except error and warning messages) to file file. By default, output goes to stdout.

       -h     Print a text representation of the hierarchy of the instance elements.  The deeper an element  is  in  the  tree,  the  more  it  is
              indented. The data content is not printed.

       -u     Print  a summary of the usage of each element in the instance.  Information given includes attributes, number of children, and depth
              in the hierarchy.

       -S     Print some statistics about element usage in the instance, including how often each element is used and  how  much  PCDATA  is  con‐
              tained.

       -x     Print the context of each element in the instance, from each element to the root of the document tree.

       -v     Validate  the  SGML instance based on the set of constraints or descriptions in the transpec file.  This flags tells instant to turn
              off normal output, leaving only diagnostics.

       -l directory
              Try to read the translation specs or other files from in the directory directory if not found in the  current  directory.   This  is
              called the library directory.  The environment variable TPT_LIB may also be used to specify this.

       -b     Interactive  browser mode. The user is prompted for actions, which include moving among and examining the various nodes in the hier‐
              archy of the instance, displaying information about them, etc.

       -I     List the IDs of all elements in the instance that have an ID.  The format is more suitable for other programs  than  humans.   Lines
              show  the ID, element GI, filename, and line, separated by colons.  (This depends on the -l option to nsgmls which provide filenames
              and line numbers.)

       -i id  When translating the instance, begin processing at the element whose ID is id instead of the topmost element.

       -D variable=value
              Define the variable variable with value value.

       -W     Do not print warning messages.

       -H     Print a help message briefly describing the options.

       file   Read the instance from the file file.  This is expected to be the output of the program nsgmls.  If not specified, instant reads the
              instance from its standard input.

       In some cases it makes no sense to combine options.  This is especially true if one of the options is to perform a translation. No checking
       is done for this.

Interactive Browser
       These are the commands to the interactive browser:

       cd args ...
              Change to a different element in the hierarchy.  cd id id will change to the element whose ID is id.  cd N will change  to  the  Nth
              child  element  of the current element.  Several values of N may be specified, so the program will change to successively descending
              elements in the hierarchy.  The string .. may appear for N to move up a level in the hierarchy (like in a unix file  system).   A  /
              may be specified for N to change to the top of the hierarchy.

       cont   Print the context of each element.

       data N Show the data content (PCDATA, RCDATA, and DATA) of child node N.

       find spec
              Find paths to elements matching spec, where spec may be one of:

              parent gi
                     Find all elements whose parent element is gi.

              child gi
                     Find all elements which have a child element gi.

              gi gi  Find all elements whose name is gi.

              attr name value
                     Find all elements that have a attribute name that have a value value.

       id ID  Show location of element whose ID is ID.  If ID is ?, it will list all IDs with the paths to them.

       ls     List  information  about  the  current  element  in  the  hierarchy.   This includes element name, line number in instance, context,
              attributes and their values, child elements, data directly within this element, and the order of the current element among its  sib‐
              lings.

       q relation element
              Report  whether  or not the current element has the relation relation to the named element element.  Values of relation are the same
              as for _followrel in transpec reference page.

       stat   Show statistics about the hierarchy.

       sum    Show a tag usage summary about the hierarchy.

       tran transpec outfile
              Write translated output using trans spec transpec to file outfile.  If outfile is not specified, output is sent to stdout.

       tree   Print a textual representation of the hierarchy of the instance, where deeper elements are indented more.

       where  Show current position in the hierarchy.

       <control-D>
              Exits the program.

       The stat, sum, tree, cont commands take an optional first argument (of any value), which means to only consider the entire instance instead
       of the hierarchy from the current element.

Files
       file.ts
              Translation specification file.

       file.sdata
              SDATA entity mapping file.

       file.cmap
              Character mapping file.

Related Information
       transpec(5), nsgmls(1), Standard Generalized Markup Language (SGML), ISO 8879.

                                                                     user cmd                                                           instant(1)
