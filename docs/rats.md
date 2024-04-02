RATS(1)                                                       General Commands Manual                                                      RATS(1)

NAME
       rats - Rough Auditing Tool for Security

SYNOPSIS
       rats [options] [file]...

DESCRIPTION
       rats  is  a  rough auditing tool for security developed by Secure Software, Inc.  It is a tool for scanning C, Perl, PHP, and Python source
       code and flagging common security related programming errors such as buffer overflows and TOCTOU (Time Of Check, Time Of Use)  race  condi‐
       tions.   As  its  name  implies,  the  tool performs only a rough analysis of source code.  It will not find every error and will also find
       things that are not errors.  Manual inspection of your code is still necessary, but greatly aided with this tool.

       When started, RATS will scan each file or each file in the directory specified on the command line and produce a report  when  scanning  is
       complete.   What  vulnerabilities  are reported in the final report depend on the data contained in the vulnerability database or databases
       that are used and the warning level in use.

       For each vulnerability, the list of files and line numbers where it occured is given, followed by a brief description of the  vulnerability
       and suggested action.

OPTIONS
       -h, --help
              Displays a brief usage summary and exit.

       -a <fun>
              Report any occurence of function 'fun' in the source file(s)

       -d <filename>, --database <filename>, --db <filename>
              Specifies a vulnerability database to be loaded.  You may have multiple -d options and each database specified will be loaded.

       -i, --input
              Causes a list of function calls that were used which accept external input to be produced at the end of the vulnerability report.

       -l <lang>, --language <language>
              Force the specified language to be used regardless of filename extension.  Currently valid language names are "c", "perl", "php" and
              "python".

       -r, --references
              Causes references to vulnerable function calls that are not being used as calls themselves to be reported.

       -w <level>, --warning <level>
              Sets the warning level. Valid levels are 1, 2 or 3.

              1 includes only default and high severity.

              2 includes medium severity (default).

              3 includes low severity vulnerabilities.

       -x     Causes the default vulnerability databases (which are in the installation data directory, /usr/share/rats  by  default)  to  not  be
              loaded.

       -R, --no-recurssion
              Do not recurse subdirectories when encountered.

       --xml  Output in XML

       --html Output in HTML

       --follow-symlinks
              Follow  symlinks  and treat them like whatever they are pointing to.  If the symlink points to a directory it will be descended into
              unless -R is specified, if a pointing to a file, it will be treated as a file.

AUTHOR
       This manual page was orginally written by Adam Lazur <adam@lazur.org>, for the Debian GNU/Linux system (but may be used by others).

       Modified by Secure Software, Inc.

                                                                September 17, 2001                                                         RATS(1)
