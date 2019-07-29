Pngtopnm User Manual(0)                                                                                                                                                               Pngtopnm User Manual(0)



NAME
       pngtopnm - convert a PNG image into a PNM image


SYNOPSIS
       pngtopnm [-verbose] [-alpha | -mix] [-background=color] [-gamma=value] [-text=filename] [-time] [pngfile]

       Minimum  unique  abbreviation  of  option  is  acceptable.  You may use double hyphens instead of single hyphen to denote options.  You may use white space in place of the equals sign to separate an
       option name from its value.



DESCRIPTION
       This program is part of Netpbm(1)

       pngtopnm was obsoleted by pngtopam(1) , introduced with Netpbm 10.44 (September 2008).  pngtopam is backward compatible with pngtopnm, plus adds many additional functions, including the  ability  to
       produce a PAM image that includes an alpha (transparency) channel.

       Starting in Release 10.48, pngtopnm is just an alias for pngtopam.

       pngtopnm  remained in the Netpbm package through Release 10.47 because it may have fewer bugs than pngtopam in those releases, and may be faster in some environments.  But pngtopnm's incompatibility
       with the most current PNG libraries makes it impractical to maintain along with pngtopam now.

       In releases before 10.48, you can use the pngtopam documentation for pngtopnm, considering the following differences:




       ·      pngtopnm options are a subset of pngtopam's, as documented above.


       ·      Any change that the pngtopam manual says happened in or after Netpbm 10.44 doesn't apply to pngtopnm.



netpbm documentation                                                                             22 July 2008                                                                         Pngtopnm User Manual(0)
