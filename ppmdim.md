Ppmdim User Manual(0)                                                                                                                                                                   Ppmdim User Manual(0)



NAME
       ppmdim - dim a PPM image


SYNOPSIS
       ppmdim dimfactor [ppmfile]


DESCRIPTION
       This program is part of Netpbm(1)

       This program is largely obsoleted by the more general pamfunc(1)
        (use the -multiplier option).  ppmdim remains for backward compatibility and also because its use of integer arithmetic may make it faster.

       ppmdim reads a PPM image input and diminishes its brightness by the specified dimfactor.  The dimfactor may be in the range from 0.0 (total blackness, deep night, nada, null, nothing) to 1.0 (origi-
       nal picture's brightness).


SEE ALSO
       ppm(5) , pamfunc(1) ,


AUTHOR
       Copyright (C) 1993 by Frank Neumann



netpbm documentation                                                                              June 2002                                                                             Ppmdim User Manual(0)
