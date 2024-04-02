swift-orphans(1)                                                                               OpenStack Swift                                                                               swift-orphans(1)



NAME
       swift-orphans - OpenStack Swift orphans tool


SYNOPSIS
       swift-orphans [-h|--help] [-a|--age] [-k|--kill] [-w|--wide] [-r|--run-dir]



DESCRIPTION
       Lists and optionally kills orphaned Swift processes. This is done by scanning /var/run/swift or the directory specified to the -r switch for .pid files and listing any processes that look like Swift
       processes but aren't associated with the pids in those .pid files. Any Swift processes running with the 'once' parameter are ignored, as those are usually for full-speed audit scans and such.

       Example (sends SIGTERM to all orphaned Swift processes older than two hours): swift-orphans -a 2 -k TERM

       The options are as follows:

           -a HOURS
           --age=HOURS
               Look for processes at least HOURS old; default: 24
           -k SIGNAL
           --kill=SIGNAL
               Send SIGNAL to matched processes; default: just list process information
           -w
           --wide
               Don't clip the listing at 80 characters



DOCUMENTATION
       More documentation about OpenStack Swift can be found at https://docs.openstack.org/swift/latest/




Linux                                                                                             3/15/2012                                                                                  swift-orphans(1)
