Pgmtexture User Manual(0)                                                                                                                                                           Pgmtexture User Manual(0)



NAME
       pgmtexture - calculate textural features on a PGM image


SYNOPSIS
       pgmtexture

       [-d d]

       [pgmfile]


DESCRIPTION
       This program is part of Netpbm(1)

       pgmtexture reads a PGM image as input and calculates textural features based on spatial dependence matrices at 0, 45, 90, and 135 degrees for a distance d (default = 1).

       Textural features include:



       ·      Angular Second Moment

       ·      Contrast

       ·      Correlation

       ·      Variance

       ·      Inverse Difference Moment

       ·      Sum Average

       ·      Sum Variance

       ·      Sum Entropy

       ·      Entropy

       ·      Difference Variance

       ·      Difference Entropy

       ·      Information Measures of Correlation

       ·      Maximal Correlation Coefficient



       Algorithm taken from: Haralick, R.M., K. Shanmugam, and I. Dinstein. 1973. Textural features for image classification.  IEEE Transactions on Systems, Man, and Cybertinetics, SMC-3(6):610-621.


LIMITATIONS
       The method for finding the Maximal Correlation Coefficient, which requires finding the second largest eigenvalue of a matrix Q, does not always converge.


SEE ALSO
       pgm(5) , pamsharpness(1) , pamsharpmap(1) , pgmedge(1) , pgmminkowski(1)



AUTHOR
       Copyright (C) 1991 by Texas Agricultural Experiment Station, employer for hire of James Darrell McCauley.



netpbm documentation                                                                             22 Aug 1991                                                                        Pgmtexture User Manual(0)
