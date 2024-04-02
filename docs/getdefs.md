getdefs(1)                                                         User Commands                                                        getdefs(1)

NAME
       getdefs - AutoGen Definition Extraction Tool

SYNOPSIS
       getdefs [option-name value]

       All arguments are named options.

       If no input argument is provided or is set to simply "-", and if stdin is not a tty, then the list of input files will be read from stdin.

DESCRIPTION
       This  program  extracts  AutoGen definitions from a list of source files.  Definitions are delimited by /*=<entry-type> <entry-name>0fP and
       =*/0fP.

OPTIONS
   Specify which definitions are of interest and what to say about them
       defs-to-get=reg-ex
              Regexp to look for after the "/*=".

              If you want definitions only from a particular category, or even with names matching particular patterns, then specify this  regular
              expression for the text that must follow the /*=.

       subblock=sub-def
              subblock definition names.  This option may appear an unlimited number of times.

              This option is used to create shorthand entries for nested definitions.  For example, with:

              using subblock thus --subblock=arg=argname,type,null

              and defining an arg thus arg: this, char *

              will then expand to: arg = { argname = this; type = "char *"; @;}
              The  "this,  char  *"  string is separated at the commas, with the white space removed.  You may use characters other than commas by
              starting the value string with a punctuation character other than a single or double quote character.  You may also omit  intermedi‐
              ate values by placing the commas next to each other with no intervening white space.  For example, "+mumble++yes+" will expand to:
              arg = { argname = mumble; null = "yes"; @;}.

       listattr=def
              attribute with list of values.  This option may appear an unlimited number of times.

              This  option  is  used  to create shorthand entries for definitions that generally appear several times.  That is, they tend to be a
              list of values.  For example, with:
              listattr=foo defined, the text:
              foo: this, is, a, multi-list will then expand to:
              foo = 'this', 'is', 'a', 'multi-list';
              The texts are separated by the commas, with the white space removed.  You may use characters other than commas by starting the value
              string with a punctuation character other than a single or double quote character.

   specify how to number the definitions
       ordering [=file-name], --no-ordering
              Alphabetize or use named file.  The no-ordering form will disable the option.  This option is enabled by default.

              By default, ordering is alphabetical by the entry name.  Use, no-ordering if order is unimportant.  Use ordering with no argument to
              order without case sensitivity.  Use ordering=<file-name> if chronological order is important.  getdefs will maintain the text  con‐
              tent of file-name.  file-name need not exist.

       first-index=first-index
              The  first  index to apply to groups.  This option takes an integer number as its argument.  The default first-index for this option
              is:
                   0

              By default, the first occurrence of a named definition will have an index of zero.  Sometimes, that needs to be  a  reserved  value.
              Provide this option to specify a different starting point.

   Definition insertion options
       filelist [=file]
              Insert source file names into defs.

              Inserts the name of each input file into the output definitions.  If no argument is supplied, the format will be:
                  infile = '%s';
              If an argument is supplied, that string will be used for the entry name instead of infile.

       assign=ag-def
              Global assignments.  This option may appear an unlimited number of times.

              The argument to each copy of this option will be inserted into the output definitions, with only a semicolon attached.

       common-assign=ag-def
              Assignments common to all blocks.  This option may appear an unlimited number of times.

              The argument to each copy of this option will be inserted into each output definition, with only a semicolon attached.

       copy=file
              File(s) to copy into definitions.  This option may appear an unlimited number of times.

              The content of each file named by these options will be inserted into the output definitions.

       srcfile [=file]
              Insert source file name into each def.

              Inserts  the name of the input file where a definition was found into the output definition.  If no argument is supplied, the format
              will be:
                  srcfile = '%s';
              If an argument is supplied, that string will be used for the entry name instead of srcfile.

       linenum [=def-name]
              Insert source line number into each def.

              Inserts the line number in the input file where a definition was found into the output definition.  If no argument is supplied,  the
              format will be:
                  linenum = '%s';
              If an argument is supplied, that string will be used for the entry name instead of linenum.

   specify which files to search for markers
       input=src-file
              Input file to search for defs.  This option may appear an unlimited number of times.  This option is the default option.

              All  files that are to be searched for definitions must be named on the command line or read from stdin.  If there is only one input
              option and it is the string, "-", then the input file list is read from stdin.  If a command line argument is not an option name and
              does  not  contain an assignment operator (=), then it defaults to being an input file name.  At least one input file must be speci‐
              fied.

   Definition output disposition options:
       output=file
              Output file to open.  This option is a member of the autogen class of options.

              If you are not sending the output to an AutoGen process, you may name an output file instead.

       autogen [=ag-cmd], --no-autogen
              Invoke AutoGen with defs.  The no-autogen form will disable the option.  This option is enabled by default.  This option is a member
              of the autogen class of options.

              This  is  the default output mode.  Specifying no-autogen is equivalent to output=-.  If you supply an argument to this option, that
              program will be started as if it were AutoGen and its standard in will be set to the output definitions of this program.

       template=file
              Template Name.

              Specifies the template name to be used for generating the final output.

       agarg=ag-opt
              AutoGen Argument.  This option may appear an unlimited number of times.  This option must not appear in combination with any of  the
              following options: output.

              This is a pass-through argument.  It allows you to specify any arbitrary argument to be passed to AutoGen.

       base-name=name
              Base name for output file(s).  This option must not appear in combination with any of the following options: output.

              When  output  is going to AutoGen, a base name must either be supplied or derived.  If this option is not supplied, then it is taken
              from the template option.  If that is not provided either, then it is set to the base name of the current directory.

       help   Display usage information and exit.

       more-help
              Pass the extended usage information through a pager.

       save-opts [=cfgfile]
              Save the option state to cfgfile.  The default is the last configuration file listed in the OPTION PRESETS section, below.  The com‐
              mand will exit after updating the config file.

       load-opts=cfgfile, no-load-opts
              Load  options  from cfgfile.  The no-load-opts form will disable the loading of earlier config/rc/ini files.  --no-load-opts is han‐
              dled early, out of order.

       version [{v|c|n}]
              Output version of program and exit.  The default mode is `v', a simple version.  The `c' mode will print copyright  information  and
              `n' will print the full copyright notice.

OPTION PRESETS
       Any  option  that is not marked as not presettable may be preset by loading values from configuration ("RC" or ".INI") file(s).  The homerc
       file is "/dev/null", unless that is a directory.  In that case, the file ".getdefsrc" is searched for within that directory.

FILES
       See OPTION PRESETS for configuration files.

EXIT STATUS
       One of the following exit values will be returned:

       0  (EXIT_SUCCESS)
              Successful program execution.

       1  (EXIT_FAILURE)
              The operation failed or the command syntax was not valid.

       66  (EX_NOINPUT)
              A specified configuration file could not be loaded.

       70  (EX_SOFTWARE)
              libopts had an internal operational error.  Please report it to autogen-users@lists.sourceforge.net.  Thank you.

SEE ALSO
       This program is documented more fully in the Getdefs section of the Add-On chapter in the AutoGen Info system documentation.

AUTHORS
       Bruce Korb

COPYRIGHT
       Copyright (C) 1999-2014 Bruce Korb all rights reserved.  This program is released under the terms of the GNU General Public  License,  ver‐
       sion 3 or later.

BUGS
       Please send bug reports to: autogen-users@lists.sourceforge.net

NOTES
       This manual page was AutoGen-erated from the getdefs option definitions.

GNU AutoGen (1.5)                                                   2016-01-10                                                          getdefs(1)
