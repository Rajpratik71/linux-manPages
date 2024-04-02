autogen(1)                                                         User Commands                                                        autogen(1)

NAME
       autogen - The Automated Program Generator

SYNOPSIS
       autogen [-flags] [-flag [value]] [--option-name[[=| ]value]] [ <def-file> ]

       AutoGen creates text files from templates using external definitions.

DESCRIPTION
       AutoGen is designed for generating program files that contain repetitive text with varied substitutions.  The goal is to simplify the main‐
       tenance of programs that contain large amounts of repetitious text.  This is especially valuable if there are several blocks of  such  text
       that must be kept synchronized.

       One  common  example is the problem of maintaining the code required for processing program options.  Processing options requires a minimum
       of four different constructs be kept in proper order in different places in your program.  You need at least: The  flag  character  in  the
       flag  string, code to process the flag when it is encountered, a global state variable or two, and a line in the usage text.  You will need
       more things besides this if you choose to implement long option names, configuration file processing, environment variables and so on.

       All of this can be done mechanically; with the proper templates and this program.

OPTIONS
   The following options select definitions, templates and scheme functions to use
       -L dir, --templ-dirs=dir
              Search for templates in DIR.  This option may appear an unlimited number of times.

              Add a directory to the list of directories autogen searches when opening a template, either as the primary template or  an  included
              one.  The last entry has the highest priority in the search list.  That is to say, they are searched in reverse order.

       -T tpl-file, --override-tpl=tpl-file
              Use TPL-FILE for the template.  This option may not be preset with environment variables or in initialization (rc) files.

              Definition  files  specify the standard template that is to be expanded.  This option will override that name and expand a different
              template.

       -l tpl-file, --lib-template=tpl-file
              Load AutoGen macros from TPL-FILE.  This option may appear an unlimited number of times.

              DEFINE macros are saved from this template file for use in processing the main macro file.  Template  text  aside  from  the  DEFINE
              macros is is ignored.

              Do not use this.  Instead, use the INCLUDE macro in your template.

              NOTE: THIS OPTION IS DEPRECATED

       --definitions=file,  Fl -no-definitions
              Read  definitions  from FILE.  The no-definitions form will disable the option.  This option is enabled by default.  This option may
              not be preset with environment variables or in initialization (rc) files.

              Use this argument to specify the input definitions file with a command line option.  If you do not specify this option,  then  there
              must be a command line argument that specifies the file, even if only to specify stdin with a hyphen (-).  Specify, --no-definitions
              when you wish to process a template without any active AutoGen definitions.

       --shell=shell
              name or path name of shell to use.

              By default, when AutoGen is built, the configuration is probed for a reasonable Bourne-like shell to use for shell  script  process‐
              ing.  If a particular template needs an alternate shell, it must be specified with this option on the command line, with an environ‐
              ment variable (SHELL) or in the configuration/initialization file.

       -m, --no-fmemopen
              Do not use in-mem streams.

              If the local C library supports "fopencookie(3GNU)", or "funopen(3BSD)" then AutoGen prefers to use in-memory  stream  buffer  opens
              instead  of anonymous files.  This may lead to problems if there is a shortage of virtual memory.  If, for a particular application,
              you run out of memory, then specify this option.  This is unlikely in a modern 64-bit virtual memory environment.

              On platforms without these functions, the option is accepted but ignored.  fmemopen(POSIX) is not adequate because its string buffer
              is  not  reallocatable.   open_memstream(POSIX)  is also not adequate because the stream is only opened for output.  AutoGen needs a
              reallocatable buffer available for both reading and writing.

       --equate=char-list
              characters considered equivalent.  The default char-list for this option is:
                   _-^

              This option will alter the list of characters considered equivalent.  The default are the three characters,  "_-^".   (The  last  is
              conventional on a Tandem/HP-NonStop, and I used to do a lot of work on Tandems.)

   The following options modify how output is handled
       -b name, --base-name=name
              Specify NAME as the base name for output.  This option may not be preset with environment variables or in initialization (rc) files.

              A template may specify the exact name of the output file.  Normally, it does not.  Instead, the name is composed of the base name of
              the definitions file with suffixes appended.  This option will override the base name derived from the definitions file name.   This
              is  required  if  there is no definitions file and advisable if definitions are being read from stdin.  If the definitions are being
              read from standard in, the base name defaults to stdin.  Any leading directory components in the name will be silently removed.   If
              you  wish  the  output  file  to appear in a particular directory, it is recommended that you "cd" into that directory first, or use
              directory names in the format specification for the output suffix lists, see: pseudo macro.

       --source-time, - Fl -no-source-time
              set mod times to latest source.  The no-source-time form will disable the option.

              If you stamp your output files with the DNE macro output, then your output files will always be different, even if the  content  has
              not  really  changed.   If  you  use this option, then the modification time of the output files will change only if the input files
              change.  This will help reduce unneeded builds.

       --writable, - Fl -not-writable
              Allow output files to be writable.  The not-writable form will disable the option.

              This option will leave output files writable.  Normally, output files are read-only.

   The following options are often useful while debugging new templates
       They specify limits that prevent the template from taking overly long or producing more output than expected.

       --loop-limit=lim
              Limit on increment loops.  This option takes an integer number as its argument.  The value of lim is constrained to being:
                  exactly -1, or
                  in the range  1 through 0x1000000
              The default lim for this option is:
                   256

              This option prevents runaway loops.  For example, if you accidentally specify, "FOR x (for-from 1) (for-to -1) (for-by 1)", it will
              take a long time to finish.  If you do have more than 256 entries in tables, you will need to specify a new limit with this option.

       -t seconds, --timeout=seconds
              Limit server shell operations to SECONDS.  This option takes an integer number as its argument.  The value of seconds is constrained
              to being:
                  in the range  0 through 3600

              AutoGen works with a shell server process.  Most normal commands will complete in less than 10 seconds.  If, however, your commands
              need more time than this, use this option.

              The valid range is 0 to 3600 seconds (1 hour).  Zero will disable the server time limit.

       --trace=level
              tracing level of detail.  This option takes a keyword as its argument.  The argument sets an enumeration value that can be tested by
              comparing them against the option value macro.  The available keywords are:
                  nothing       debug-message server-shell
                  templates     block-macros  expressions
                  everything
                  or their numeric equivalent.

              The default level for this option is:
                   nothing

              This option will cause AutoGen to display a trace of its template processing.  There are six levels, each level including messages
              from the previous levels:

              nothing Does no tracing at all (default)

              debug-message Print messages from the "DEBUG" AutoGen macro (see: DEBUG).

              server-shell Traces all input and output to the server shell.  This includes a shell "independent" initialization script about 30
              lines long.  Its output is discarded and not inserted into any template.

              templates Traces the invocation of DEFINEd macros and INCLUDEs

              block-macros Traces all block macros.  The above, plus IF, FOR, CASE and WHILE.

              expressions Displays the results of expression evaluations.

              everything Displays the invocation of every AutoGen macro, even TEXT macros (i.e. the text outside of macro quotes).  Additionally,
              if you rebuild the ``expr.ini'' file with debugging enabled, then all calls to AutoGen defined scheme functions will also get
              logged:
                  cd ${top_builddir}/agen5
                  DEBUG_ENABLED=true bash bootstrap.dir expr.ini
                  make CFLAGS='-g -DDEBUG_ENABLED=1'

              Be aware that you cannot rebuild this source in this way without first having installed the autogen executable in your search path.
              Because of this, "expr.ini" is in the distributed source list, and not in the dependencies.

       --trace-out=file
              tracing output file or filter.

              The output specified may be a file name, a file that is appended to, or, if the option argument begins with the pipe operator (|), a
              command that will receive the tracing output as standard in.  For example, --traceout='| less' will run the trace output through the
              less program.  Appending to a file is specified by preceding the file name with two greater-than characters (>>).

       --show-defs
              Show the definition tree.  This option may not be preset with environment variables or in initialization (rc) files.

              This will print out the complete definition tree before processing the template.

       --used-defines
              Show the definitions used.  This option may not be preset with environment variables or in initialization (rc) files.

              This will print out the names of definition values searched for during the processing of the template, whether actually found or
              not.  There may be other referenced definitions in a template in portions of the template not evaluated.  Some of the names listed
              may be computed names and others AutoGen macro arguments.  This is not a means for producing a definitive, all-encompassing list of
              all and only the values used from a definition file.  This is intended as an aid to template documentation only.

       -C, --core
              Leave a core dump on a failure exit.

              Many systems default to a zero sized core limit.  If the system has the sys/resource.h header and if this option is supplied, then
              in the failure exit path, autogen will attempt to set the soft core limit to whatever the hard core limit is.  If that does not
              work, then an administrator must raise the hard core size limit.  in the definitions files and template files" They specify which
              outputs and parts of outputs to produce.

       -s suffix, --skip-suffix=suffix
              Skip the file with this SUFFIX.  This option may appear an unlimited number of times.  This option may not be preset with environ‐
              ment variables or in initialization (rc) files.  This option must not appear in combination with any of the following options:
              select-suffix.

              Occasionally, it may not be desirable to produce all of the output files specified in the template.  (For example, only the .h
              header file, but not the .c program text.)  To do this specify --skip-suffix=c on the command line.

       -o suffix, --select-suffix=suffix
              specify this output suffix.  This option may appear an unlimited number of times.  This option may not be preset with environment
              variables or in initialization (rc) files.

              If you wish to override the suffix specifications in the template, you can use one or more copies of this option.  See the suffix
              specification in the @ref{pseudo macro} section of the info doc.

       -D value, --define=value
              name to add to definition list.  This option may appear an unlimited number of times.

              The AutoGen define names are used for the following purposes:

              Sections of the AutoGen definitions may be enabled or disabled by using C-style #ifdef and #ifndef directives.

              When defining a value for a name, you may specify the index for a particular value.  That index may be a literal value, a define
              option or a value #define-d in the definitions themselves.

              The name of a file may be prefixed with $NAME/.  The $NAME part of the name string will be replaced with the define-d value for
              NAME.

              When AutoGen is finished loading the definitions, the defined values are exported to the environment with, putenv(3).  These values
              can then be used in shell scripts with ${NAME@} references and in templates with (getenv "NAME").

              While processing a template, you may specify an index to retrieve a specific value.  That index may also be a define-d value.

              It is entirely equivalent to place this name in the exported environment.  Internally, that is what AutoGen actually does with this
              option.

       -U name-pat, --undefine=name-pat
              definition list removal pattern.  This option may appear an unlimited number of times.  This option may not be preset with environ‐
              ment variables or in initialization (rc) files.

              Similar to 'C', AutoGen uses #ifdef/#ifndef preprocessing directives.  This option will cause the matching names to be removed from
              the list of defined values.

   This option is used to automate dependency tracking
       -M type, --make-dep [type]
              emit make dependency file.  This option may appear an unlimited number of times.  This option may not be preset with environment
              variables or in initialization (rc) files.

              This option behaves fairly closely to the way the -M series of options work with the gcc compiler, except that instead of just emit‐
              ting the predecessor dependencies, this also emits the successor dependencies (output target files).  By default, the output depen‐
              dency information will be placed in <base-name>.d, but may also be specified with -MF<file>.  The time stamp on this file will be
              manipulated so that it will be one second older than the oldest primary output file.

              The target in this dependency file will normally be the dependency file name, but may also be overridden with -MT<targ-name>.  Auto‐
              Gen will not alter the contents of that file, but it may create it and it will adjust the modification time to match the start time.

              NB: these second letters are part of the option argument, so -MF <file> must have the space character quoted or omitted, and -M "F
              <file>" is acceptable because the F is part of the option argument.

              -M may be followed by any of the letters M, F, P, T, Q, D, or G.  However, only F, Q, T and P are meaningful.  All but F have some‐
              what different meanings.  -MT<name> is interpreted as meaning <name> is a sentinel file that will depend on all inputs (templates
              and definition files) and all the output files will depend on this sentinel file.  It is suitable for use as a real make target.  Q
              is treated identically to T, except dollar characters ('$') are doubled.  P causes a special clean (clobber) phoney rule to be
              inserted into the make file fragment.  An empty rule is always created for building the list of targets.

              This is the recommended usage:
                    -MFwhatever-you-like.dep -MTyour-sentinel-file -MP
              and then in your Makefile, make the autogen rule:
                    -include whatever-you-like.dep
                    clean_targets += clean-your-sentinel-file
                  .sp
                    your-sentinel-file:
                        autogen -MT$@@ -MF$*.d .....
                  .sp
                    local-clean :
                        rm -f $(clean_targets)

              The modification time on the dependency file is adjusted to be one second before the earliest time stamp of any other output file.
              Consequently, it is suitable for use as the sentinel file testifying to the fact the program was successfully run.  (-include is the
              GNU make way of specifying "include it if it exists".  Your make must support that feature or your bootstrap process must create the
              file.)

              All of this may also be specified using the DEPENDENCIES_OUTPUT or AUTOGEN_MAKE_DEP environment variables.  If defined, dependency
              information will be output.  If defined with white space free text that is something other than true, false, yes, no, 0 or 1, then
              the string is taken to be an output file name.  If it contains a string of white space characters, the first token is as above and
              the second token is taken to be the target (sentinel) file as -MT in the paragraphs above.  DEPENDENCIES_OUTPUT will be ignored if
              there are multiple sequences of white space characters or if its contents are, specifically, false, no or 0.

   help, version and option handling
       -?, --help
              Display usage information and exit.

       -!, --more-help
              Pass the extended usage information through a pager.

       -> [cfgfile], --save-opts [=cfgfile]
              Save the option state to cfgfile.  The default is the last configuration file listed in the OPTION PRESETS section, below.  The com‐
              mand will exit after updating the config file.

       -< cfgfile, --load-opts=cfgfile, --no-load-opts
              Load options from cfgfile.  The no-load-opts form will disable the loading of earlier config/rc/ini files.  --no-load-opts is han‐
              dled early, out of order.

       -v [{v|c|n --version [{v|c|n}]}]
              Output version of program and exit.  The default mode is `v', a simple version.  The `c' mode will print copyright information and
              `n' will print the full copyright notice.

OPTION PRESETS
       Any option that is not marked as not presettable may be preset by loading values from configuration ("RC" or ".INI") file(s) and values
       from environment variables named:
         AUTOGEN_<option-name> or AUTOGEN
       The  environmental  presets take precedence (are processed later than) the configuration files.  The homerc files are "$HOME", and ".".  If
       any of these are directories, then the file .autogenrc is searched for within those directories.

ENVIRONMENT
       See OPTION PRESETS for configuration environment variables.

FILES
       See OPTION PRESETS for configuration files.

EXAMPLES
       Here is how the man page is produced:
           autogen -Tagman-cmd.tpl -MFman-dep -MTstamp-man opts.def

       This command produced this man page from the AutoGen option definition file.  It overrides the template  specified  in  opts.def  (normally
       options.tpl)  and  uses  agman-cmd.tpl.  It also sets the make file dependency output to man-dep and the sentinel file (time stamp file) to
       man-stamp.  The base of the file name is derived from the defined prog-name.

       The texi invocation document is produced via:
           autogen -Tagtexi-cmd.tpl -MFtexi-dep -MTtexi-stamp opts.def

EXIT STATUS
       One of the following exit values will be returned:

       0  (EXIT_SUCCESS)
              Successful program execution.

       1  (EXIT_OPTION_ERROR)
              The command options were misconfigured.

       2  (EXIT_BAD_TEMPLATE)
              An error was encountered processing the template.

       3  (EXIT_BAD_DEFINITIONS)
              The definitions could not be deciphered.

       4  (EXIT_LOAD_ERROR)
              An error was encountered during the load phase.

       5  (EXIT_FS_ERROR)
              a file system error stopped the program.

       6  (EXIT_NO_MEM)
              Insufficient memory to operate.

       128  (EXIT_SIGNAL)
              autogen exited due to catching a signal.  If your template includes string formatting, a number argument to a "%s"  formatting  ele‐
              ment  will  trigger  a  segmentation fault.  Autogen will catch the seg fault signal and exit with AUTOGEN_EXIT_SIGNAL(5).  Alterna‐
              tively, AutoGen may have been interrupted with a kill(2) signal.  Subtract 128 from the actual exit code to detect the  signal  num‐
              ber.

       66  (EX_NOINPUT)
              A specified configuration file could not be loaded.

       70  (EX_SOFTWARE)
              libopts had an internal operational error.  Please report it to autogen-users@lists.sourceforge.net.  Thank you.

AUTHORS
       Bruce Korb

COPYRIGHT
       Copyright  (C)  1992-2015 Bruce Korb all rights reserved.  This program is released under the terms of the GNU General Public License, ver‐
       sion 3 or later.

BUGS
       Please send bug reports to: autogen-users@lists.sourceforge.net

NOTES
       This manual page was AutoGen-erated from the autogen option definitions.

GNU AutoGen (5.18.7)                                                06 Dec 2015                                                         autogen(1)
