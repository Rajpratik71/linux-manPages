page(1)                                                          Development Tools                                                         page(1)

__________________________________________________________________________________________________________________________________________________

NAME
       page - Parser Generator

SYNOPSIS
       page ?options...? ?input ?output??

__________________________________________________________________________________________________________________________________________________

DESCRIPTION
       The  application described by this document, page, is actually not just a parser generator, as the name implies, but a generic tool for the
       execution of arbitrary transformations on texts.

       Its genericity comes through the use of plugins for reading, transforming, and writing data, and the predefined set of plugins provided  by
       Tcllib  is  for the generation of memoizing recursive descent parsers (aka packrat parsers) from grammar specifications (Parsing Expression
       Grammars).

       page is written on top of the package page::pluginmgr, wrapping its functionality into a command line  based  application.  All  the  other
       page::*  packages  are  plugin  and/or  supporting packages for the generation of parsers. The parsers themselves are based on the packages
       grammar::peg, grammar::peg::interp, and grammar::mengine.

   COMMAND LINE
       page ?options...? ?input ?output??
              This is general form for calling page. The application will read the contents of the file input, process them under the  control  of
              the specified options, and then write the result to the file output.

              If  input  is  the string - the data to process will be read from stdin instead of a file. Analogously the result will be written to
              stdout instead of a file if output is the string -. A missing output or input specification causes the application to assume -.

              The detailed specifications of the recognized options are provided in section OPTIONS.

              path input (in)
                     This argument specifies the path to the file to be processed by the application, or -. The last value causes the  application
                     to read the text from stdin. Otherwise it has to exist, and be readable. If the argument is missing - is assumed.

              path output (in)
                     This  argument  specifies  where  to  write the generated text. It can be the path to a file, or -. The last value causes the
                     application to write the generated documented to stdout.

                     If the file output does not exist then [file dirname $output] has to exist and must be a writable directory, as the  applica‐
                     tion will create the fileto write to.

                     If the argument is missing - is assumed.

   OPERATION
       ... reading ... transforming ... writing - plugins - pipeline ...

   OPTIONS
       This section describes all the options available to the user of the application. Options are always processed in order. I.e. of both --help
       and --version are specified the option encountered first has precedence.

       Unknown options specified before any of the options -rd, -wr, or -tr will cause processing to abort with an error. Unknown  options  coming
       in  between  these  options, or after the last of them are assumed to always take a single argument and are associated with the last plugin
       option coming before them. They will be checked after all the relevant plugins, and thus the options they understand, are known. I.e.  such
       unknown options cause error if and only if the plugin option they are associated with does not understand them, and was not superceded by a
       plugin option coming after.

       Default options are used if and only if the command line did not contain any options at all. They will set the application  up  as  a  PEG-
       based parser generator. The exact list of options is

              -c peg

       And now the recognized options and their arguments, if they have any:

       --help

       -h

       -?     When  one of these options is found on the command line all arguments coming before or after are ignored. The application will print
              a short description of the recognized options and exit.

       --version

       -V     When one of these options is found on the command line all arguments coming before or after are ignored. The application will  print
              its own revision and exit.

       -P     This option signals the application to activate visual feedback while reading the input.

       -T     This  option  signals  the  application to collect statistics while reading the input and to print them after reading has completed,
              before processing started.

       -D     This option signals the application to activate logging in the Safe base, for the debugging of problems with plugins.

       -r parser

       -rd parser

       --reader parser
              These options specify the plugin the application has to use for reading the input. If the options are used multiple times  the  last
              one will be used.

       -w generator

       -wr generator

       --writer generator
              These  options  specify  the  plugin the application has to use for generating and writing the final output. If the options are used
              multiple times the last one will be used.

       -t process

       -tr process

       --transform process
              These options specify a plugin to run on the input. In contrast to readers and writers each use will not  supersede  previous  uses,
              but  add each chosen plugin to a list of transformations, either at the front, or the end, per the last seen use of either option -p
              or -a. The initial default is to append the new transformations.

       -a

       --append
              These options signal the application that all following transformations should be added at the end of the list of transformations.

       -p

       --prepend
              These options signal the application that all following transformations should be added at the beginning of the list of  transforma‐
              tions.

       --reset
              This  option signals the application to clear the list of transformations. This is necessary to wipe out the default transformations
              used.

       -c file

       --configuration file
              This option causes the application to load a configuration file and/or plugin. This is a plugin which in  essence  provides  a  pre-
              defined  set  of commandline options. They are processed exactly as if they have been specified in place of the option and its argu‐
              ments. This means that unknown options found at the beginning of the configuration file are associated with the last plugin, even if
              that  plugin was specified before the configuration file itself. Conversely, unknown options coming after the configuration file can
              be associated with a plugin specified in the file.

              If the argument is a file which cannot be loaded as a plugin the application will assume that its contents are a list of options and
              their  arguments,  separated  by space, tabs, and newlines. Options and argumentes containing spaces can be quoted via double-quotes
              (") and quotes ('). The quote character can be specified within in a quoted string by doubling it. Newlines in a quoted  string  are
              accepted as is.

   PLUGINS
       page  makes  use  of four different types of plugins, namely: readers, writers, transformations, and configurations. Here we provide only a
       basic introduction on how to use them from page. The exact APIs provided to and expected from the plugins can be found in the documentation
       for page::pluginmgr, for those who wish to write their own plugins.

       Plugins are specified as arguments to the options -r, -w, -t, -c, and their equivalent longer forms. See the section OPTIONS for reference.

       Each such argument will be first treated as the name of a file and this file is loaded as the plugin. If however there is no file with that
       name, then it will be translated into the name of a package, and this package is then loaded. For each type of plugins the package  manage‐
       ment  searches  not only the regular paths, but a set application- and type-specific paths as well. Please see the section PLUGIN LOCATIONS
       for a listing of all paths and their sources.

       -c name
              Configurations. The name of the package for the plugin name is "page::config::name".

              We have one predefined plugin:

              peg    It sets the application up as a parser generator accepting parsing expression grammars and writing a packrat parser  in  Tcl.
                     The actual arguments it specifies are:

                       --reset
                       --append
                       --reader    peg
                       --transform reach
                       --transform use
                       --writer    me

       -r name
              Readers. The name of the package for the plugin name is "page::reader::name".

              We have five predefined plugins:

              peg    Interprets  the  input  as  a parsing expression grammar (PEG) and generates a tree representation for it. Both the syntax of
                     PEGs and the structure of the tree representation are explained in their own manpages.

              hb     Interprets the input as Tcl code as generated by the writer plugin hb and generates its tree representation.

              ser    Interprets the input as the serialization of a PEG, as generated by the writer plugin ser, using the package grammar::peg.

              lemon  Interprets the input as a grammar specification as understood by Richard Hipp's LEMON parser generator and generates  a  tree
                     representation  for  it.  Both  the input syntax and the structure of the tree representation are explained in their own man‐
                     pages.

              treeser
                     Interprets the input as the serialization of a struct::tree. It is validated as such, but nothing else. It is not assumed  to
                     be the tree representation of a grammar.

       -w name
              Writers. The name of the package for the plugin name is "page::writer::name".

              We have eight predefined plugins:

              identity
                     Simply  writes the incoming data as it is, without making any changes. This is good for inspecting the raw result of a reader
                     or transformation.

              null   Generates nothing, and ignores the incoming data structure.

              tree   Assumes that the incoming data structure is a struct::tree and generates an indented textual  representation  of  all  nodes,
                     their parental relationships, and their attribute information.

              peg    Assumes that the incoming data structure is a tree representation of a PEG or other other grammar and writes it out as a PEG.
                     The result is nicely formatted and partially simplified (strings as sequences of characters). A pretty  printer  in  essence,
                     but can also be used to obtain a canonical representation of the input grammar.

              tpc    Assumes  that  the  incoming  data structure is a tree representation of a PEG or other other grammar and writes out Tcl code
                     defining a package which defines a grammar::peg object containing the grammar when it is loaded into an interpreter.

              hb     This is like the writer plugin tpc, but it writes only the statements which define stat expression  and  grammar  rules.  The
                     code making the result a package is left out.

              ser    Assumes  that  the incoming data structure is a tree representation of a PEG or other other grammar, transforms it internally
                     into a grammar::peg object and writes out its serialization.

              me     Assumes that the incoming data structure is a tree representation of a PEG or other other grammar and  writes  out  Tcl  code
                     defining a package which implements a memoizing recursive descent parser based on the match engine (ME) provided by the pack‐
                     age grammar::mengine.

       -t name
              Transformers. The name of the package for the plugin name is "page::transform::name".

              We have two predefined plugins:

              reach  Assumes that the incoming data structure is a tree representation of a PEG or other other grammar. It determines  which  non‐
                     terminal  symbols  and  rules  are reachable from start-symbol/expression. All nonterminal symbols which were not reached are
                     removed.

              use    Assumes that the incoming data structure is a tree representation of a PEG or other other grammar. It determines  which  non‐
                     terminal symbols and rules are able to generate a finite sequences of terminal symbols (in the sense for a Context Free Gram‐
                     mar). All nonterminal symbols which were not deemed useful in this sense are removed.

   PLUGIN LOCATIONS
       The application-specific paths searched by page either are, or come from:

       [1]    The directory            "~/.page/plugin"

       [2]    The environment variable PAGE_PLUGINS

       [3]    The registry entry       HKEY_LOCAL_MACHINE\SOFTWARE\PAGE\PLUGINS

       [4]    The registry entry       HKEY_CURRENT_USER\SOFTWARE\PAGE\PLUGINS

       The type-specific paths searched by page either are, or come from:

       [1]    The directory            "~/.page/plugin/<TYPE>"

       [2]    The environment variable PAGE_<TYPE>_PLUGINS

       [3]    The registry entry       HKEY_LOCAL_MACHINE\SOFTWARE\PAGE\<TYPE>\PLUGINS

       [4]    The registry entry       HKEY_CURRENT_USER\SOFTWARE\PAGE\<TYPE>\PLUGINS

       Where the placeholder <TYPE> is always one of the values below, properly capitalized.

       [1]    reader

       [2]    writer

       [3]    transform

       [4]    config

       The registry entries are specific to the Windows(tm) platform, all other platforms will ignore them.

       The contents of both environment variables and registry entries are interpreted as a list of paths, with the elements separated  by  either
       colon (Unix), or semicolon (Windows).

BUGS, IDEAS, FEEDBACK
       This  document, and the package it describes, will undoubtedly contain bugs and other problems.  Please report such in the category page of
       the Tcllib Trackers [http://core.tcl.tk/tcllib/reportlist].  Please also report any ideas for enhancements you may have for either  package
       and/or documentation.

SEE ALSO
       page::pluginmgr

KEYWORDS
       parser generator, text processing

CATEGORY
       Page Parser Generator

COPYRIGHT
       Copyright (c) 2005 Andreas Kupries <andreas_kupries@users.sourceforge.net>

tcllib                                                                  1.0                                                                page(1)
