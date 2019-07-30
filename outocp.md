outocp(1)                                                                        General Commands Manual                                                                        outocp(1)

NAME
       outocp - debug an OCP file

SYNOPSIS
       outocp OCPFILE[.ocp]

DESCRIPTION
       outocp  is  used  for  debugging  Omega Compiled Translation Process (OCP) files.  It generates some statistics about the OCP file, and then runs through the states that the file
       defines.

       Omega Translation Processes are rules used to translate one character set to another and to choose between characters with one or more  context-sensitive  variants.   OTPs  could
       also be used to change the case or hyphenation of text.

BUGS
       None known, but report any found to <omega@ens.fr> (mailing list).

SEE ALSO
       ocp2otp(1), otp2ocp(1), omega(1).

       <https://ctan.org/pkg/omega>

AUTHOR
       mkocp is part of Omega.  The primary authors of Omega are John Plaice and Yannis Haralambous.

       This  manual  page was written by C.M. Connelly <cmc@debian.org>, for the Debian GNU/Linux system.  It may be used by other distributions without contacting the author.  Any mis‐
       takes or omissions in the manual page are my fault; inquiries about or corrections to this manual page should be directed to me (and not to the primary author).

TeX Live                                                                                April 2017                                                                              outocp(1)
