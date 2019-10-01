PROCESSCSV.PY(1)                                                                            Virtualization Support                                                                           PROCESSCSV.PY(1)



NAME
       processcsv.py - process virt-top CSV files

SUMMARY
        virt-top --csv data.csv
        processcsv.py < data.csv

DESCRIPTION
       virt-top is a top(1)-like utility for showing stats of virtualized domains.

       processcsv.py is a simple Python script that post-processes the output of "virt-top --csv".

       It is used like this:

        virt-top --csv data.csv
        processcsv.py < data.csv

       The second command will overwrite the following files in the current directory:

       "global.csv"
           This contains the global (host) statistics columns from the CSV file.

       "domainNN.csv" (multiple files)
           For each libvirt domain ID NN, a file is created containing the per-domain statistics from the CSV file.

SEE ALSO
       virt-top(1)

AUTHORS
       Richard W.M. Jones <rjones @ redhat . com>

COPYRIGHT
       (C) Copyright 2007-2012 Red Hat Inc., Richard W.M. Jones http://libvirt.org/

       This program is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation; either version 2 of the
       License, or (at your option) any later version.

       This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
       General Public License for more details.

       You should have received a copy of the GNU General Public License along with this program; if not, write to the Free Software Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.



virt-top-1.0.8                                                                                    2018-04-10                                                                                 PROCESSCSV.PY(1)
