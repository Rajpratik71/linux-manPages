COMBINEDELTARPM(8)                                                                         System Manager's Manual                                                                         COMBINEDELTARPM(8)



NAME
       combindeltarpm - combine multiple deltarpms to a single one


SYNOPSIS
       combinedeltarpm [-v] [-V version] [-z compression] [-S signaturerpm] olddeltarpms...  newdeltarpm


DESCRIPTION
       combinedeltarpm  creates a new deltarpm from multiple old ones.  Applying the rsulting deltarpm has the same effect as applying each of the old ones in the specified order. Use the -v option to make
       combinedeltarpm more verbose about its work.

       combinedeltarpm normally produces a V3 format deltarpm, use the -V option to specify a different version if desired. The -z option can be used to specify a different compression method, the  default
       is to use the same compression method as used in the last of the old deltarpms.

       If you want to use a different header signature you can also specify a rpm with the -S option which will be used as signature reference. This feature can be used to if a deltarpm was made against an
       unsigned rpm which later got signed.


MEMORY CONSIDERATIONS
       The implementation of combinedeltarpm currently unpacks the add-blocks of the deltarpms in memory, thus it needs about twice the uncompressed payload size of the target rpm.


SEE ALSO
       makedeltarpm(8) applydeltarpm(8)


AUTHOR
       Michael Schroeder <mls@suse.de>



                                                                                                   May 2005                                                                                COMBINEDELTARPM(8)
