regdbdump(8)                        Linux                        regdbdump(8)

NAME
       regdbdump - parse and print out regulatory rules file

SYNOPSIS
       regdbdump <path-to-regulatory.bin>

Description
       regdbdump can be used to parse the regulatory.bin file, the Linux
       wireless regulatory database used by crda, and print out its contents
       in human readable format.  regdbdump will return non zero if the digi‐
       tal signature regdbdump was built with cannot verify the signature of
       the regulatory database.  Should this happen unintentionally chances
       are your regulatory.bin file is corrupted or has been tampered with.

SEE ALSO
       regulatory.bin(5) crda(8) iw(8)

       http://wireless.kernel.org/en/developers/Regulatory/

regdbdump                      23 January 2009                   regdbdump(8)
