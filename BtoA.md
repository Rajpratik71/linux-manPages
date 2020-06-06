BtoA(1)                                                                              PKI Binary to ASCII Conversion Tool                                                                              BtoA(1)



NAME
       BtoA  - Convert binary base-64 encoded data to ASCII base-64 encoded data.


SYNOPSIS
       BtoA <input_file> <output_file>


DESCRIPTION
       The BtoA command provides a command-line utility used to convert binary base-64 encoded data to ASCII base-64 encoded data.


OPTIONS
       The following parameters are mandatory:

       <input_file>
              Specifies the path to the file which contains the base-64 encoded binary data.


       <output_file>
              Specifies the path to the file where the utility should write the ASCII output.


EXAMPLES
       This example command takes the base-64 binary data in the binary_data.der file and writes the ASCII equivalent of the data to the ascii_data.pem file:

              BtoA binary_data.der ascii_data.pem

AUTHORS
       Matthew Harmsen <mharmsen@redhat.com>.


COPYRIGHT
       Copyright  (c)  2016  Red  Hat,  Inc.  This  is  licensed  under  the  GNU  General  Public  License,  version  2  (GPLv2).  A  copy  of this license is available at http://www.gnu.org/licenses/old-
       licenses/gpl-2.0.txt.


SEE ALSO
       AtoB(1),pki(1)



version 10.3                                                                                    July 20, 2016                                                                                         BtoA(1)
