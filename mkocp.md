mkocp(1)                                                                         General Commands Manual                                                                         mkocp(1)

NAME
       mkocp - frontend to otp2ocp(1)

SYNOPSIS
       mkocp OTPFILE

DESCRIPTION
       mkocp is used to create or recreate Omega Compiled Process files (binary) from Omega Translation Process (text) files.

       Omega  Translation  Processes are used to translate one character set to another and to choose between characters with one or more context-sensitive variants.  OTPs could also be
       used to change the case or hyphenation of text.

       OTPs are defined in text files, and compiled into binary code (OCPs) using mkocp (this script) or directly with otp2ocp(1).

FILES
       OTPFILE
              An Omega Typesetting Process filter file.

SEE ALSO
       omega(1), otp2ocp(1).

       <https://ctan.org/pkg/omega>

AUTHOR
       mkocp is part of Omega.  The primary authors of Omega are John Plaice and Yannis Haralambous.

       This manual page was written by C.M. Connelly <cmc@debian.org>, for the Debian GNU/Linux system.  It may be used by other distributions without contacting the author.   Any  mis‐
       takes or omissions in the manual page are my fault; inquiries about or corrections to this manual page should be directed to me (and not to the primary author).

Omega                                                                                   April 2017                                                                               mkocp(1)
