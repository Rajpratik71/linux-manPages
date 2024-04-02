
opafmconfigdiff(8)                                                                          IFSFFCLIRG (Man Page)                                                                          opafmconfigdiff(8)



NAME
       opafmconfigdiff



       Performs a file difference between two configuration files corresponding to two FM instances described by file1 and file2.

Syntax
       opafmconfigdiff [-f] [-l] [-d 'diff_args'] file1 file2

Options
       --help    Produces full help text.


       -f        Filters out FM parameters that are not part of the consistency check. Removes configuration tags that do not cause consistency checks on the FM to fail from diff.


       -l        Includes comments in XML to indicate original line numbers.


       -d 'diff_args'
                 Specifies additional arguments to add to diff command. For example, enter uw for unified format ignoring whitespace.


       file1 file2
                 Specifies the names of the configuration files to be compared.


Example
       opafmconfigdiff /etc/opa-fm/opafm.xml /usr/share/opa-fm/opafm.xml
       opafmconfigdiff -f /etc/opa-fm/opafm.xml /usr/share/opa-fm/opafm.xml
       opafmconfigdiff -d -uw /etc/opa-fm/opafm.xml /usr/share/opa-fm/
       opafm.xml



Copyright(C) 2015-2018                                                                        Intel Corporation                                                                            opafmconfigdiff(8)
