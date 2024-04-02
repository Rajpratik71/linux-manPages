
opasorthosts(8)                                                                             IFSFFCLIRG (Man Page)                                                                             opasorthosts(8)



NAME
       opasorthosts



       Sorts  its  standard input in a typical host name order and sorts to standard output. Hosts are sorted alphabetically (case-insensitively) by any alpha-numeric prefix, and then sorted numerically by
       any numeric suffix. Host names may end in a numeric field which may optionally have leading zeros. Unlike a pure alphabetic sort, this command results in intuitive sequencing of host names such  as:
       host1, host2, host10.

       This command does not remove duplicates; any duplicates are listed in adjacent lines.

       Use this command to build mpi_hosts input files for applications or cable tests that place hosts in order by name.

Syntax
       opasorthosts < hostlist> output_file

Options
       --help    Produces full help text.


       hostlist  Specifies the list of host names.


       output_file
                 Specifies the sorted list output.


Examples
       opasorthosts < host.xml > Sorted_host

       Standard Input

                 opasorthosts
                 osd04
                 osd1
                 compute20
                 compute3
                 mgmt1
                 mgmt2
                 login

       Standard Output

                 compute3
                 compute20
                 login
                 mgmt1
                 mgmt2
                 osd1
                 osd04



Copyright(C) 2015-2018                                                                        Intel Corporation                                                                               opasorthosts(8)
