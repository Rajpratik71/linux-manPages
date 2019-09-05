YARAC(1)                                                       compile rules to yara                                                      YARAC(1)

NAME
       yarac - compile rules to yara

SYNOPSIS
       yarac [OPTION]... [RULE_FILE]... OUTPUT_FILE

DESCRIPTION
       To  invoke  YARA you will need two things: a file with the rules you want to use (either in source code or compiled form) and the target to
       be scanned.  The target can be a file, a folder, or a process.

       Rule files can be passed directly in source code form, or can be previously compiled with the yarac tool. You may prefer to use your  rules
       in compiled form if you are going to invoke YARA multiple times with the same rules.  This way you’ll save time, because for YARA is faster
       to load compiled rules than compiling the same rules over and over again.

       The rules will be applied to the target specified as the last argument to YARA, if it’s a path to a directory all the files contained in it
       will be scanned.

OPTIONS
       -d <identifier>=<value>
              define external variable.

       -w     disable warnings.

       -v     show version information.

EXAMPLE
       The -d is used to define external variables. For example:

       -d flag=true

       -d beast=666

       -d name="James Bond"

SEE ALSO
       yara(1)

AUTHOR
       yarac  was  written  by  Victor  M.  Alvarez  <vmalvarez@virustotal.com>.   This manual page was written by Joao Eriberto Mota Filho <erib‐
       erto@eriberto.pro.br> for the Debian project (but may be used by others).

YARAC 2.0                                                            Jan 2014                                                             YARAC(1)
