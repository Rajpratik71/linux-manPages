STAP-REPORT(1)                                                                             General Commands Manual                                                                             STAP-REPORT(1)



NAME
       stap-report - collect system information that is useful for debugging systemtap bugs



SYNOPSIS
       stap-report


DESCRIPTION
       The  stap-report executable collects system information that is useful for debugging systemtap bugs. It is a good idea to include such a report in bug reports especially if you send them directly to
       the upstream. stap-report can be run either as a normal user or as root. The report will be more complete if stap-report is run as root.


EXAMPLES
              $ stap-report > report.txt
              $ head report.txt
              == id ==
              uid=1000(user) gid=1000(user) groups=122(stapdev),123(stapusr),129(stapsys)
              == stap -V ==
              Systemtap translator/driver (version 2.2.1/0.153, Debian version 2.2.1-1)
              Copyright (C) 2005-2013 Red Hat, Inc. and others
              This is free software; see the source for copying conditions.
              enabled features: AVAHI LIBSQLITE3 NSS TR1_UNORDERED_MAP NLS
              == which stap ==
              /usr/bin/stap
              == locate --regex '/stap(run)?$' | xargs ls -ald ==



SEE ALSO
       stap(1)


BUGS
       Use the Bugzilla link of the project web page or our mailing list.  http://sourceware.org/systemtap/,<systemtap@sourceware.org>.



                                                                                                                                                                                               STAP-REPORT(1)
