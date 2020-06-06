H5COPY:(1)                                                                                      User Commands                                                                                      H5COPY:(1)



NAME
       h5copy: - Copies HDF5 objects from a file to a new file

DESCRIPTION
       usage: h5copy [OPTIONS] [OBJECTS...]

              OBJECTS

       -i, --input
              input file name

       -o, --output
              output file name

       -s, --source
              source object name

       -d, --destination
              destination object name

              OPTIONS

       -h, --help
              Print a usage message and exit

       -p, --parents
              No error if existing, make parent groups as needed

       -v, --verbose
              Print information about OBJECTS and OPTIONS

       -V, --version
              Print version number and exit

       -f, --flag
              Flag type

              Flag type is one of the following strings:

       shallow
              Copy only immediate members for groups

       soft   Expand soft links into new objects

       ext    Expand external links into new objects

       ref    Copy references and any referenced objects, i.e., objects that the references point to.

              Referenced objects are copied in addition to the objects

              specified  on the command line and reference datasets are populated with correct reference values. Copies of referenced datasets outside the copy range specified on the command line will nor‐
              mally have a different name from the original.

              (Default:Without this option, reference value(s) in any

              reference datasets are set to NULL and referenced objects are not copied unless they are otherwise within the copy range specified on the command line.)

       noattr Copy object without copying attributes

       allflags
              Switches all flags from the default to the non-default setting

              These flag types correspond to the following API symbols

              H5O_COPY_SHALLOW_HIERARCHY_FLAG H5O_COPY_EXPAND_SOFT_LINK_FLAG H5O_COPY_EXPAND_EXT_LINK_FLAG H5O_COPY_EXPAND_REFERENCE_FLAG H5O_COPY_WITHOUT_ATTR_FLAG H5O_COPY_ALL

SEE ALSO
       The full documentation for h5copy: is maintained as a Texinfo manual.  If the info and h5copy: programs are properly installed at your site, the command

              info h5copy:

       should give you access to the complete manual.



h5copy: Version 1.8.7                                                                            August 2011                                                                                       H5COPY:(1)
