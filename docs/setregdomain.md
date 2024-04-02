segregdomain(1)                                                                                 User Commands                                                                                 segregdomain(1)



NAME
       setregdomain - set regulatory domain based on country code

SYNOPSIS
       setregdomain

DESCRIPTION
       setregdomain sets the regulatory domain for your system; it takes no arguments and is normally called via system script (eg, udev) rather than manually by an administrator.

       The  regulatory  domain  is  represented  by  an  ISO  /  IEC  3166-1 alpha2 country code.  By default, setregdomain attempts to determine the appropriate country code by examining the target of the
       /etc/localtime symbolic link.  That information is used to look-up the matching country code in the /usr/share/zoneinfo/zone.tab file.

       The country code look-up may fail.  This could be due to faulty or incomplete information in the /usr/share/zoneinfo/zone.tab file, or the use of an actual file rather than a symlink for /etc/local‐
       time  , among other possibilities.  In those cases the system administrator should define a COUNTRY environment variable in the /etc/sysconfig/regdomain file.  This value will be used as the country
       code and the country code look-up will be skipped.

FILES
       /etc/sysconfig/regdomain /etc/localtime /usr/share/zoneinfo/zone.tab

SEE ALSO
       iw(1)



CRDA                                                                                              2014-11-19                                                                                  segregdomain(1)
