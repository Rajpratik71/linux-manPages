h5diff(1)                                                                                  General Commands Manual                                                                                  h5diff(1)



NAME
       h5diff - Compares two HDF5 files and reports the differences.

SYNOPSIS
       h5diff file1 file2 [OPTIONS] [object1 [object2 ] ]

DESCRIPTION
       h5diff is a command line tool that compares two HDF5 files, file1 and file2, and reports the differences between them.

       Optionally,  h5diff  will  compare  two objects within these files. If only one object, object1, is specified, h5diff will compare object1 in file1 with object1 in file2. In two objects, object1 and
       object2, are specified, h5diff will compare object1 in file1 with object2 in file2. These objects must be HDF5 datasets.

       object1 and object2 must be expressed as absolute paths from the respective file's root group.

       Additional information, with several sample cases, can be found in the document H5diff Examples.

OPTIONS
       file1 file2
              The HDF5 files to be compared.

       -h     Print all differences.

       -r     Print only the names of objects that differ; do not print the differences. These objects may be HDF5 datasets, groups, or named datatypes.

       -n count
              Print difference up to count differences, then stop. count must be a positive integer.

       -d delta
              Print only differences that are greater than the limit delta. delta must be a positive number. The comparison criterion is whether the absolute value of the difference  of  two  corresponding
              values is greater than delta (e.g., |a-b| > delta, where a is a value in file1 and b is a value in file2).

       -p relative
              Print  only differences that are greater than a relative error. relative must be a positive number. The comparison criterion is whether the absolute value of the difference 1 and the ratio of
              two corresponding values is greater than relative (e.g., |1-(b/a)| > relative where a is a value in file1 and b is a value in file2).

       object1 object2
              Specific object(s) within the files to be compared.

EXAMPLES
       The following h5diff call compares the object /a/b in file1 with the object /a/c in file2:
           h5diff file1 file2 /a/b /a/c

       This h5diff call compares the object /a/b in file1 with the same object in file2:
           h5diff file1 file2 /a/b

       And this h5diff call compares all objects in both files:
           h5diff file1 file2

SEE ALSO
       h5dump(1), h5ls(1), h5repart(1), h5import(1), gif2h5(1), h52gif(1), h5perf(1)



                                                                                                                                                                                                    h5diff(1)
