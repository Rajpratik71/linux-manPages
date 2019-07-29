envdir(8)                                                     System Manager's Manual                                                    envdir(8)

NAME
       envdir - runs another program with environment modified according to files in a specified directory.

SYNOPSIS
       envdir d child

DESCRIPTION
       d is a single argument.  child consists of one or more arguments.

       envdir sets various environment variables as specified by files in the directory named d.  It then runs child.

       If d contains a file named s whose first line is t, envdir removes an environment variable named s if one exists, and then adds an environ‐
       ment variable named s with value t.  The name s must not contain =. Spaces and tabs at the end of t are removed. Nulls in t are changed  to
       newlines in the environment variable.

       If  the file s is completely empty (0 bytes long), envdir removes an environment variable named s if one exists, without adding a new vari‐
       able.

EXIT CODES
       envdir exits 111 if it has trouble reading d, if it runs out of memory for environment variables, or if it cannot run child.  Otherwise its
       exit code is the same as that of child.

SEE ALSO
       supervise(8),  svc(8),  svok(8),  svstat(8),  svscanboot(8),  svscan(8),  readproctitle(8), fghack(8), pgrphack(8), multilog(8), tai64n(8),
       tai64nlocal(8), setuidgid(8), envuidgid(8), softlimit(8), setlock(8)

       http://cr.yp.to/daemontools.html

                                                                                                                                         envdir(8)
