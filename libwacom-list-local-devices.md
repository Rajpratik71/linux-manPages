libwacom-list-local-devices(1)          General Commands Manual         libwacom-list-local-devices(1)

NAME
       libwacom-list-local-devices - utility to list tablet devices

SYNOPSIS
       libwacom-list-local-devices [--database /path/to/datadir]

DESCRIPTION
       libwacom-list-local-devices  is  a debug utility to list connected tablet devices identified by
       libwacom. It is usually used to check whether a libwacom data file is correct,  present  and/or
       applies to a specific device.

OPTIONS
       --database /path/do/datadir
               Sets  the  data  directory  path to be used. This is only useful when testing against a
               modified data path. Only libwacom developers need this option.

NOTES
       The Linux kernel provides separate /dev/input/event* nodes for the  stylus,  the  pad  and  the
       touch  part  of  the  tablet.  This usually results in a connected tablet being listed multiple
       times with this tool. This behavior is expected and should not be seen as a bug.

                                                                        libwacom-list-local-devices(1)
