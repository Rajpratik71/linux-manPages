h5dump(1)                                                                                  General Commands Manual                                                                                  h5dump(1)



NAME
       h5dump - Displays HDF5 file contents.

SYNOPSIS
       h5dump [OPTIONS] file

DESCRIPTION
       h5dump enables the user to examine the contents of an HDF5 file and dump those contents, in human readable form, to an ASCII file.

       h5dump  dumps  HDF5 file content to standard output. It can display the contents of the entire HDF5 file or selected objects, which can be groups, datasets, a subset of a dataset, links, attributes,
       or datatypes.

       The --header option displays object header information only.

       Names are the absolute names of the objects. h5dump displays objects in the order same as the command order. If a name does not start with a slash, h5dump begins searching for the  specified  object
       starting at the root group.

       If an object is hard linked with multiple names, h5dump displays the content of the object in the first occurrence. Only the link information is displayed in later occurrences.

       h5dump  assigns  a  name  for  any unnamed datatype in the form of #oid1:oid2, where oid1 and oid2 are the object identifiers assigned by the library. The unnamed types are displayed within the root
       group.

       Datatypes are displayed with standard type names. For example, if a dataset is created with H5T_NATIVE_INT type and the standard type name for integer on that machine is H5T_STD_I32BE,  h5dump  dis‐
       plays H5T_STD_I32BE as the type of the dataset.

       h5dump  can also dump a subset of a dataset. This feature operates in much the same way as hyperslabs in HDF5; the parameters specified on the commnd line are passed to the function H5Sselect_hyper‐
       slab and the resulting selection is displayed.

       The h5dump output is described in detail in the DDL for HDF5, the Data Description Language document.

       Note: It is not permissable to specify multiple attributes, datasets, datatypes, groups, or soft links with one flag. For example, one may not issue the command
              WRONG:   h5dump -a /attr1 /attr2 foo.h5
       to display both /attr1 and /attr2. One must issue the following command:
              CORRECT:   h5dump -a /attr1 -a /attr2 foo.h5

       It's possible to select the file driver with which to open the HDF5 file by using the --filedriver (-f) command-line option. Acceptable values for the  --filedriver  option  are:  "sec2",  "family",
       "split",  "multi",  and "stream". If the file driver flag isn't specified, then the file will be opened with each driver in turn and in the order specified above until one driver succeeds in opening
       the file.

XML OUTPUT
       With the --xml option, h5dump generates XML output. This output contains a complete description of the file, marked up in XML. The XML conforms to the HDF5 Document Type Definition  (DTD)  available
       at http://hdf.ncsa.uiuc.edu/DTDs/HDF5-File.dtd.

       The XML output is suitable for use with other tools, including the HDF5 Java Tools.

OPTIONS
       -h     or --help Print a usage message and exit.

       -B     or --bootblock Print the content of the boot block. (This option is not yet implemented.)

       -H     or --header Print the header only; no data is displayed.

       -A     Print the header and value of attributes; data of datasets is not displayed.

       -i     or --object-ids Print the object ids.

       -r     or --string Print 1-bytes integer datasets as ASCII.

       -V     or --version Print version number and exit.

       -a P   or --attribute=P Print the specified attribute.

       -d P   or --dataset=P Print the specified dataset.

       -f D   or --filedriver=D Specify which driver to open the file with.

       -g P   or --group=P Print the specified group and all members.

       -l P   or --soft-link=P Print the value(s) of the specified soft link.

       -o F   or --output=F Output raw data into file F.

       -t T   or --datatype=T Print the specified named datatype.

       -w N   or --width=N Set the number of columns of output.

       -x     or --xml Output XML using XML schema (default) instead of DDL.

       -u     or --use-dtd Output XML using XML DTD instead of DDL.

       -D U   or --xml-dtd=U In XML output, refer to the DTD or schema at U instead of the default schema/DTD.

       -X S   or --xml-dns=S In XML output, (XML Schema) use qualified names in the XML: ":": no namespace, default: "hdf5:"

       -s L   or --start=L Offset of start of subsetting selection. Default: the beginning of the dataset.

       -S L   or --stride=L Hyperslab stride. Default: 1 in all dimensions.

       -c L   or --count=L Number of blocks to include in the selection.

       -k L   or --block=L Size of block in hyperslab. Default: 1 in all dimensions.

       --     Indicate that all following arguments are non-options. E.g., to dump a file called `-f', use h5dump -- -f.

       file   The file to be examined.

       The option parameters listed above are defined as follows:

       D      which  file driver to use in opening the file. Acceptable values are "sec2", "family", "split", "multi", and "stream". Without the file driver flag the file will be opened with each driver in
              turn and in the order specified above until one driver succeeds in opening the file.

       P      The full path from the root group to the object

       T      The name of the datatype

       F      A filename

       N      An integer greater than 1

       L      A list of integers, the number of which is equal to the number of dimensions in the dataspace being queried

       U      A URI (as defined in [IETF RFC 2396], updated by [IETF RFC 2732]) that refers to the DTD to be used to validate the XML

       Subsetting paramaters can also be expressed in a convenient compact form, as follows:
              --dataset="/foo/mydataset[START;STRIDE;COUNT;BLOCK]"

       All of the semicolons (;) are required, even when a parameter value is not specified. When not specified, default parameter values are used.


EXAPLES
       1.     Dumping the group /GroupFoo/GroupBar in the file quux.h5:
                        h5dump -g /GroupFoo/GroupBar quux.h5

       2.     Dumping the dataset Fnord in the group /GroupFoo/GroupBar in the file quux.h5:
                        h5dump -d /GroupFoo/GroupBar/Fnord quux.h5

       3.     Dumping the attribute metadata of the dataset Fnord which is in group /GroupFoo/GroupBar in the file quux.h5:
                        h5dump -a /GroupFoo/GroupBar/Fnord/metadata quux.h5

       4.     Dumping the attribute metadata which is an attribute of the root group in the file quux.h5:
                        h5dump -a /metadata quux.h5

       5.     Producing an XML listing of the file bobo.h5:
                        h5dump --xml bobo.h5 > bobo.h5.xml

       6.     Dumping a subset of the dataset /GroupFoo/databar/ in the file quux.h5
              h5dump -d /GroupFoo/databar --start="1,1" --stride="2,3" --count="3,19" --block="1,1" quux.h5

       7.     The same example using the short form to specify the subsetting parameters:
              h5dump -d "/GroupFoo/databar[1,1;2,3;3,19;1,1]" quux.h5

CURRENT STATUS
       The current version of h5dump displays the following information:
              * Group
                     o group attribute (see Attribute)
                     o group member
              * Dataset
                     o dataset attribute (see Attribute)
                     o dataset type (see Datatype)
                     o dataset space (see Dataspace)
                     o dataset data
              * Attribute
                     o attribute type (see Datatype)
                     o attribute space (see Dataspace)
                     o attribute data
              * Datatype
                     o integer type
                            - H5T_STD_I8BE, H5T_STD_I8LE, H5T_STD_I16BE, ...
                     o floating point type
                            - H5T_IEEE_F32BE, H5T_IEEE_F32LE, H5T_IEEE_F64BE, ...
                     o string type
                     o compound type
                            - named, unnamed and transient compound type - integer, floating or string type member
                     o opaque types
                     o reference type
                            - object references
                            - data regions
                     o enum type
                     o variable-length datatypes
                            - atomic types only
                            - scalar or single dimensional array of variable-length types supported
              * Dataspace
                     o scalar and simple space
              * Soft link
              * Hard link
              * Loop detection


SEE ALSO
       h5ls(1), h5diff(1), h5repart(1), h5import(1), gif2h5(1), h52gif(1), h5perf(1)

              * HDF5 Data Description Language syntax at file:///usr/share/doc/libhdf5-doc/html/ddl.html
              * HDF5 XML Schema at http://hdf.ncsa.uiuc.edu/DTDs/HDF5-File.xsd
              * HDF5 XML information at http://hdf.ncsa.uiuc.edu/HDF5/XML/






                                                                                                                                                                                                    h5dump(1)
