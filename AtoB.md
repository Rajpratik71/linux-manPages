AtoB(1)                                                                              PKI ASCII to Binary Conversion Tool                                                                              AtoB(1)



NAME
       AtoB  - Convert ASCII base-64 encoded data to binary base-64 encoded data.


SYNOPSIS
       AtoB <input_file> <output_file>


DESCRIPTION
       The AtoB command provides a command-line utility used to convert ASCII base-64 encoded data to binary base-64 encoded data.


OPTIONS
       The following parameters are mandatory:

       <input_file>
              Specifies the path to the file containing the base-64 encoded ASCII data.


       <output_file>
              Specifies the path to the file where the utility should write the binary output.


EXAMPLES
       This example command takes the base-64 ASCII data in the ascii_data.pem file and writes the binary equivalent of the data to the binary_data.der file:

              AtoB ascii_data.pem binary_data.der

AUTHORS
       Matthew Harmsen <mharmsen@redhat.com>.


COPYRIGHT
       Copyright  (c)  2016  Red  Hat,  Inc.  This  is  licensed  under  the  GNU  General  Public  License,  version  2  (GPLv2).  A  copy  of this license is available at http://www.gnu.org/licenses/old-
       licenses/gpl-2.0.txt.


SEE ALSO
       BtoA(1),pki(1)



version 10.3                                                                                    July 20, 2016                                                                                         AtoB(1)
