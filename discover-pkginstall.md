discover-pkgintsall(8)                  System Manager's Manual                 discover-pkgintsall(8)

NAME
       discover-pkginstall — intsall packages for available hardware using discover(1)

SYNOPSIS
       discover-pkginstall [-l]  [-n]  [-v]

Description
       discover-pkginstall install packages based on detected hardware.  It will use the discover-data
       database to map for hardware to debian packages, install the packages by default.  Packages us‐
       ing  module-assistant  will be automatically built and the result installed if module-assistant
       is installed or pulled in as a dependency.

Options
       -l        Only list the detected packages

       -n        Echo the aptitude and module-assistant invocations instead of running them.

       -v        Be verbose.

See Also
       aptitude(8), discover(1), module-assistant(8)

                                                                                discover-pkgintsall(8)
