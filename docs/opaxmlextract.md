
opaxmlextract(8)                                                                            IFSFFCLIRG (Man Page)                                                                            opaxmlextract(8)



NAME
       opaxmlextract



       (Linux)  Extracts element values from XML input and outputs the data in CSV format. opaxmlextract is intended to be used with opareport, to parse and filter its XML output, and to allow the filtered
       output to be imported into other tools such as spreadsheets and customer-written scripts. opaxmlextract can also be used with any well-formed XML stream to extract element values  into  a  delimited
       format.

       Five sample scripts are available as prototypes for customized scripts. They combine various calls to opareport with a call to opaxmlextract with commonly used parameters.

Syntax
       opaxmlextract [-v][-H][-d delimiter][-e extract_element]
       [-s suppress_element][-X input_file] [-P param_file]

Options
       --help    Produces full help text.


       -v/--verbose
                 Produces verbose output. Includes output progress reports during extraction and output prepended wildcard characters on element names in output header record.


       -H/--noheader
                 Does not output element name header record.


       -d/--delimit delimiter
                 Uses single character or string as the delimiter between element names and element values. Default is semicolon.


       -e/--extract extract_element
                 Specifies  the  name  of  the XML element to extract. Elements can be nested in any order, but are output in the order specified. Elements can be specified multiple times, with a different
                 attribute name or attribute value. An optional attribute (or attribute and value) can also be specified with elements:



                 ·      -e element

                 ·      -e element:attrName

                 ·      -e element:attrName:attrValue






       NOTE:



              ·      Elements can be compound values separated by a dot. For example, Switches.Node is a Node element contained within a Switches element.

              ·      To output the attribute value as opposed to the element value, a specification such as -e FIs.Node:id can be used. This will return the value of the id attribute of any  Node  elements
                     within FIs element.

              ·      If  desired,  a  specific element can be selected by its attribute value, such as -e MulticastFDB.Value:LID:0xc000 which will return the value of the Value element within Multicast FDB
                     element where the Value element has an attribute of LID with a value of 0xc000.

              ·      A given element can be specified multiple times each with a different AttrName or attrValue.




       -s/--suppress suppress_element
                 Specifies the name of the XML element to suppress extraction. Can be used multiple times (in any order). Supports the same syntax as -e.


       -X/--infile input_file
                 Parses XML from input_file.


       -P/--pfile param_file
                 Reads command parameters from param_file.


Example
       Here is an example of opareport output filtered by opaxmlextract :

       # opareport -o comps -s -x | opaxmlextract -d ; -e NodeDesc
       -e SystemImageGUID -e NumPorts -s Neighbor
       Getting All Node Records...
       Done Getting All Node Records
       Done Getting All Link Records
       Done Getting All Cable Info Records
       Done Getting All SM Info Records
       Getting All Port Counters...
       Done Getting All Port Counters
       NodeDesc;SystemImageGUID;NumPorts
       phs1fnivd13u07n4 hfi1_0;0x00117501016033c7;1
       phs1fnivd13u07n2 hfi1_0;0x00117501016033ef;1
       phs1fnivd13u07n1 hfi1_0;0x001175010160347a;1
       phs1fnivd13u07n3 hfi1_0;0x0011750101603593;1
       phs1swivd13u21;0x00117501ff6a5619;48
       phs1fnivd13u07n1 hfi1_0;;




Details
       opaxmlextract is a flexible and powerful tool to process an XML stream. The tool:

       ·      Requires no specific element names to be present in the XML.

       ·      Assumes no hierarchical relationship between elements.

       ·      Allows extracted element values to be output in any order.

       ·      Allows an element's value to be extracted only in the context of another specified element.

       ·      Allows extraction to be suppressed during the scope of specified elements.

       opaxmlextract takes the XML input stream from either stdin or a specified input file. opaxmlextract does not use or require a connection to a fabric.

       opaxmlextract works from two lists of elements supplied as command line or input parameters. The first is a list of elements whose values are to be extracted, called extraction elements. The  second
       is  a  list of elements for which extraction is to be suppressed, called suppression elements. When an extraction element is encountered and extraction is not suppressed, the value of the element is
       extracted for later output in an extraction record. An extraction record contains a value for all extraction elements, including those which have a null value.

       When a suppression element is encountered, then no extraction is performed during the extent of that element, from start through end. Suppression is maintained for elements specified inside the sup‐
       pression  element,  including  elements which may happen to match extraction elements. Suppression can be used to prevent extraction in sections of XML that are present, but not of current interest.
       For example, NodeDesc or NodeGUID inside a Neighbor specification of opareport.

       opaxmlextract attempts to generate extraction records with data values that are valid at the same time. Specifying extraction elements that are valid in the same scope produces a single  record  for
       each group of extraction elements. However, mixing extraction elements from different scopes (including different XML levels) may cause opaxmlextract to produce multiple records.

       opaxmlextract outputs an extraction record under the following conditions:

       ·      One  or  more extraction elements containing a non-null value go out of scope (that is, the element containing the extraction elements is ended) and a record containing the element values has
              not already been output.

       ·      A new and different value is specified for an extraction element and an extraction record containing the previous value has not already been output.

       Element names (extraction or suppression) can be made context-sensitive with an enclosing element name using the syntax element1.element2. In this case, element2 is extracted (or extraction is  sup‐
       pressed) only when element2 is enclosed by element1.

       The  syntax  also  allows  '  *  '  to be specified as a wildcard. In this case, *.element3 specifies element3 enclosed by any element or sequence of elements (for example, element1.element3 or ele‐
       ment1.element2.element3). Similarly, element1.*.element3 specifies element3 enclosed by element1 with any number of (but at least 1) intermediate elements.

       opaxmlextract prepends any entered element name not containing a ' * ' (anywhere) with ' *. ', matching the element regardless of the enclosing elements.

       NOTE: Any element names that include a wildcard should be quoted to the shell attempting to wildcard match against filenames.



       At the beginning of operation, opaxmlextract, by default, outputs a delimited header record containing the names of the extraction elements. The order of the names is the same as  specified  on  the
       command  line  and is the same order as that of the extraction record. Output of the header record can be disabled with the -H option. By default, element names are shown as they were entered on the
       command line. The -v option causes element names to be output as they are used during extraction, with any prepended wildcard characters.

       Options (parameters) to opaxmlextract can be specified on the command line, with a parameter file, or using both methods. A parameter file is specified with -P  param_file.  When  a  parameter  file
       specification is encountered on the command line, option processing on the command line is suspended, the parameter file is read and processed entirely, and then command line processing is resumed.

       Option  syntax within a parameter file is the same as on the command line. Multiple parameter file specifications can be made, on the command line or within other parameter files. At each point that
       a parameter file is specified, current option processing is suspended while the parameter file is processed, then resumed. Options are processed in the order they are encountered on the command line
       or in parameter files. A parameter file can be up to 8192 bytes in size and may contain up to 512 parameters.



Copyright(C) 2015-2018                                                                        Intel Corporation                                                                              opaxmlextract(8)
