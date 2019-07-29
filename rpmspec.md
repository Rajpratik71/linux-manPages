RPMSPEC(8)                                                    System Manager's Manual                                                   RPMSPEC(8)

NAME
       rpmspec - RPM Spec Tool

SYNOPSIS
   QUERYING SPEC FILES:
       rpmspec {-q|--query} [select-options] [query-options] SPEC_FILE ...

   select-options
        [--rpms]
        [--srpms]

   query-options
        [--qf,--queryformat QUERYFMT]
        [--target TARGET_PLATFORM]

   QUERY OPTIONS
       The general form of an rpm spec query command is

       rpm {-q|--query} [select-options] [query-options]

       You may specify the format that the information should be printed in. To do this, you use the

        --qf|--queryformat QUERYFMT

       option, followed by the QUERYFMT format string.  See rpm(8) for details.

   SELECT OPTIONS
        --rpms Operate on the binary package header(s).
        --srpm Operate on the source package header(s).

SEE ALSO
       popt(3),
       rpm(8),
       rpmdb(8),
       rpmkeys(8),
       rpmsign(8),
       rpm2cpio(8),
       rpmbuild(8),

       rpmspec  --help - as rpm supports customizing the options via popt aliases it's impossible to guarantee that what's described in the manual
       matches what's available.

       http://www.rpm.org/ <URL:http://www.rpm.org/>

AUTHORS
       Marc Ewing <marc@redhat.com>
       Jeff Johnson <jbj@redhat.com>
       Erik Troan <ewt@redhat.com>
       Panu Matilainen <pmatilai@redhat.com>

Red Hat, Inc                                                      29 October 2010                                                       RPMSPEC(8)
