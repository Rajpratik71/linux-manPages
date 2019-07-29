yara(1)                                                       General Commands Manual                                                      yara(1)

NAME
       yara - find files matching patterns and rules written in a special-purpose language.

SYNOPSIS
       yara [OPTION]... RULES_FILE FILE | DIR | PID

DESCRIPTION
       yara  scans  the  given  FILE,  all files contained in directory DIR, or the process indentified by PID looking for matches of patterns and
       rules provided in a special purpose-language. The rules are read from RULES_FILE.

       The options to yara(1) are:

       -t tag --tag=tag
              Print rules tagged as tag and ignore the rest. This option can be used multiple times.

       -i identifier --identifier=identifier
              Print rules named identifier and ignore the rest. This option can be used multiple times.

       -n  --negate
              Print rules that doesn't apply (negate)

       -D  --print-module-data
              Print module data.

       -g  --print-tags
              Print the tags associated to the rule.

       -m  --print-meta
              Print metadata associated to the rule.

       -s  --print-strings
              Print strings found in the file.

       -p number --threads=number
              Use the specified number of threads to scan a directory.

       -l number --max-rules=number
              Abort scanning after a number of rules matched.

       -a seconds --timeout=seconds
              Abort scanning after a number of seconds has elapsed.

       -k slots --stack-size=slots
              Set maximum stack size to the specified number of slots.

       -d identifier=value
              Define an external variable. This option can be used multiple times.

       -x module=file
              Pass file's content as extra data to module. This option can be used multiple times.

       -r  --recursive
              Scan files in directories recursively.

       -f  --fast-scan
              Speeds up scanning by searching only for the first occurrence of each pattern.

       -w  --no-warnings
              Disable warnings.

       -v  --version
              Show version information.

EXAMPLES
       $ yara /foo/bar/rules1 /foo/bar/rules2 .

              Apply rules on /foo/bar/rules1 and /foo/bar/rules2 to all files on current directory. Subdirectories are not scanned.

       $ yara -t Packer -t Compiler /foo/bar/rules bazfile

              Apply rules on /foo/bar/rules to bazfile.  Only reports rules tagged as Packer or Compiler.

       $ cat /foo/bar/rules1 | yara -r /foo

              Scan all files in the /foo directory and its subdirectories. Rules are read from standard input.

       $ yara -d mybool=true -d myint=5 -d mystring="my string" /foo/bar/rules bazfile

              Defines three external variables mybool myint and mystring.

       $ yara -x cuckoo=cuckoo_json_report /foo/bar/rules bazfile

              Apply rules on /foo/bar/rules to bazfile while passing the content of cuckoo_json_report to the cuckoo module.

AUTHOR
       Victor M. Alvarez <plusvic@gmail.com>;<vmalvarez@virustotal.com>

Victor M. Alvarez                                               September 22, 2008                                                         yara(1)
