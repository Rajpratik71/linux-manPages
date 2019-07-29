HWLOC-DIFF(1)                                                          hwloc                                                         HWLOC-DIFF(1)

NAME
       hwloc-diff - Compute differences between two XML topologies

SYNOPSIS
       hwloc-diff [options] <input1.xml> <input2.xml>

       hwloc-diff [options] <input1.xml> <input2.xml> <output.xml>

OPTIONS
       --refname <name>
                 Use  <name> as the identifier for the reference topology in the output XML difference.  It is meant to tell which topology should
                 be used when applying the resulting difference.  hwloc-patch may use that name  to  automatically  load  the  relevant  reference
                 topology XML.  By default, <input1.xml> is used without its full path.

       --version Report version and exit.

DESCRIPTION
       hwloc-diff  computes the difference between two XML topologies and stores the result into <output.xml> if any, or dumps it to stdout other‐
       wise.

       The output difference may later be applied to another topology with hwloc-patch.

       hwloc-compress-dir may be used for computing the diffs between all XML files in a directory.

       NOTE: It is highly recommended that you read the hwloc(7) overview page before reading this man page.  Most of the  concepts  described  in
       hwloc(7) directly apply to the hwloc-diff utility.

EXAMPLES
       hwloc-diff's operation is best described through several examples.

       Compute the difference between two XML topologies and output it to stdout:

           $ hwloc-diff fourmi023.xml fourmi024.xml
           Found 11 differences, exporting to stdout
           <?xml version="1.0" encoding="UTF-8"?>
           ...

       Output the difference to file diff.xml instead:

           $ hwloc-diff fourmi023.xml fourmi024.xml diff.xml
           Found 11 differences, exporting to diff.xml

       When the difference is too complex to be represented:

           $ hwloc-diff fourmi023.xml avakas-frontend1.xml
           Found 1 differences, including 1 too complex ones.
           Cannot export differences to stdout

       Directly compute the difference between two topologies and apply it to another one:

           $ hwloc-diff fourmi023.xml fourmi024.xml | hwloc-patch fourmi025.xml -

RETURN VALUE
       Upon successful execution, hwloc-diff outputs the difference.  The return value is 0.

       If the difference is too complex to be represented, an error is returned and the output is not generated.

       hwloc-diff also returns nonzero if any kind of error occurs, such as (but not limited to) failure to parse the command line.

SEE ALSO
       hwloc(7), lstopo(1), hwloc-patch(1), hwloc-compress-dir(1)

1.11.2                                                             Dec 17, 2015                                                      HWLOC-DIFF(1)
