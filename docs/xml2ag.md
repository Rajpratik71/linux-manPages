xml2ag(1)                                                          User Commands                                                         xml2ag(1)

NAME
       xml2ag - XML to AutoGen Definiton Converter

SYNOPSIS
       xml2ag [-flags] [-flag [value]] [--option-name[[=| ]value]] [ <def-file> ]

       This program will convert any arbitrary XML file into equivalent AutoGen definitions, and invoke AutoGen.

DESCRIPTION
       The template will be derived from either:
       *  the --override-tpl command line option
       *  a top level XML attribute named, "template"
       One or the other must be provided, or the program will exit with a failure message.

       The “base-name” for the output will similarly be either:
       *  the --base-name command line option
       *  the base name of the .xml file

OPTIONS
   All other options are derived from autogen
       -O file, --output=file
              Output file in lieu of AutoGen processing.

              By default, the output is handed to an AutoGen for processing.  However, you may save the definitions to a file instead.

   All other options
       These  options  are  mostly  just passed throug to autogen.  The one exception is --override-tpl which replaces the default template in the
       output definitions.  It does not get passed through on the command line.

       -L dir, --templ-dirs=dir
              Search for templates in DIR.  This option may appear an unlimited number of times.

              Pass-through AutoGen argument

       -T tpl-file, --override-tpl=tpl-file
              Use TPL-FILE for the template.

              Pass-through AutoGen argument

       -l tpl-file, --lib-template=tpl-file
              Load AutoGen macros from TPL-FILE.  This option may appear an unlimited number of times.

              Pass-through AutoGen argument

              NOTE: THIS OPTION IS DEPRECATED

       --definitions=file
              Read definitions from FILE.

              Pass-through AutoGen argument

       --shell=shell
              name or path name of shell to use.

              Pass-through AutoGen argument

       -m, --no-fmemopen
              Do not use in-mem streams.

              Pass-through AutoGen argument

       --equate=char-list
              characters considered equivalent.

              Pass-through AutoGen argument

       -b name, --base-name=name
              Specify NAME as the base name for output.

              Pass-through AutoGen argument

       --source-time
              set mod times to latest source.

              Pass-through AutoGen argument

       --writable, - Fl -not-writable
              Allow output files to be writable.  The not-writable form will disable the option.

              Pass-through AutoGen argument

       --loop-limit=lim
              Limit on increment loops.  This option takes an integer number as its argument.  The value of lim is constrained to being:
                  exactly -1, or
                  in the range  1 through 0x1000000
              The default lim for this option is:
                   256

              Pass-through AutoGen argument

       -t seconds, --timeout=seconds
              Limit server shell operations to SECONDS.  This option takes an integer number as its argument.  The value of seconds is constrained
              to being:
                  in the range  0 through 3600

              Pass-through AutoGen argument

       --trace=level
              tracing level of detail.  This option takes a keyword as its argument.  The argument sets an enumeration value that can be tested by
              comparing them against the option value macro.  The available keywords are:
                  nothing       debug-message server-shell
                  templates     block-macros  expressions
                  everything
                  or their numeric equivalent.

              The default level for this option is:
                   nothing

              Pass-through AutoGen argument

       --trace-out=file
              tracing output file or filter.

              Pass-through AutoGen argument

       --show-defs
              Show the definition tree.

              Pass-through AutoGen argument

       --used-defines
              Show the definitions used.

              Pass-through AutoGen argument

       -C, --core
              Leave a core dump on a failure exit.

              Many systems default to a zero sized core limit.  If the system has the sys/resource.h header and if this option is supplied, then
              in the failure exit path, autogen will attempt to set the soft core limit to whatever the hard core limit is.  If that does not
              work, then an administrator must raise the hard core size limit.

       -s suffix, --skip-suffix=suffix
              Skip the file with this SUFFIX.  This option may appear an unlimited number of times.  This option must not appear in combination
              with any of the following options: select-suffix.

              Pass-through AutoGen argument

       -o suffix, --select-suffix=suffix
              specify this output suffix.  This option may appear an unlimited number of times.

              Pass-through AutoGen argument

       -D value, --define=value
              name to add to definition list.  This option may appear an unlimited number of times.

              Pass-through AutoGen argument

       -U name-pat, --undefine=name-pat
              definition list removal pattern.  This option may appear an unlimited number of times.

              Pass-through AutoGen argument

       -M type, --make-dep [type]
              emit make dependency file.  This option may appear an unlimited number of times.

              Pass-through AutoGen argument

       -?, --help
              Display usage information and exit.

       -!, --more-help
              Pass the extended usage information through a pager.

       -v [{v|c|n --version [{v|c|n}]}]
              Output version of program and exit.  The default mode is `v', a simple version.  The `c' mode will print copyright information and
              `n' will print the full copyright notice.

EXIT STATUS
       One of the following exit values will be returned:

       0  (EXIT_SUCCESS)
              Successful program execution.

       1  (EXIT_FAILURE)
              The operation failed or the command syntax was not valid.

       70  (EX_SOFTWARE)
              libopts had an internal operational error.  Please report it to autogen-users@lists.sourceforge.net.  Thank you.

AUTHORS
       Bruce Korb

COPYRIGHT
       Copyright (C) 1992-2015 Bruce Korb all rights reserved.  This program is released under the terms of the GNU General Public License, ver‐
       sion 3 or later.

BUGS
       Please send bug reports to: autogen-users@lists.sourceforge.net

NOTES
       This manual page was AutoGen-erated from the xml2ag option definitions.

GNU AutoGen (5.18.7)                                                2016-01-10                                                           xml2ag(1)
