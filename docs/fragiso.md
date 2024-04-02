FRAGISO(8)                                                                                 System Manager's Manual                                                                                 FRAGISO(8)



NAME
       fragiso - split rpm packages from an iso and reassemble the iso later on


SYNOPSIS
       fragiso make iso fiso
       fragiso list fiso
       fragiso fill [-m] fiso iso


DESCRIPTION
       fragiso  can  be  used  to convert an iso file into a fragment file, which is a list describing all of the rpms on the iso and a data chunk containing everything but the rpms. It is used by drpmsync
       when an iso needs to be transferred. The idea is that often the rpms on the iso are already available on the destination host, so it saves bandwidth to first transfer the fragmented  iso,  copy  the
       locally available rpms, transfer the unavailable rpms and reassemble the iso file.

       fragiso  make  converts  the iso into the fragment iso, fragiso list can be used to extract the rpm information. This information consists of the offset and length of all rpms and the lead/signature
       header md5sum plus the header/payload md5sum. To reassemble the iso one has to copy the rpms at the right offset into a new file and then use fragiso fill later on to provide all data not  contained
       in the rpms. The -m option tells fragiso to print the resulting md5sum of the iso to stdout.  It can be used for verification purposes.


SEE ALSO
       drpmsync(8)


AUTHOR
       Michael Schroeder <mls@suse.de>



                                                                                                   Mar 2007                                                                                        FRAGISO(8)
