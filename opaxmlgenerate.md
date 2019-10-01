
opaxmlgenerate(8)                                                                           IFSFFCLIRG (Man Page)                                                                           opaxmlgenerate(8)



NAME
       opaxmlgenerate



       (Linux)  Takes  comma-separated-values (CSV) data as input and generates sequences of XML containing user-specified element names and element values within start and end tag specifications. Use this
       tool to create an XML representation of fabric data from its CSV form.

Syntax
       opaxmlgenerate [-v] [-d delimiter] [-i number] [-g element]
       [-h element] [-e element] [-X input_file] [-P param_file]

Options
       --help    Produces full help text.


       -g/--generate element
                 Generates value for element using value in next field from the input file. Can be used multiple times on the command line. Values are assigned to elements in order.


       -h/--header element
                 Name of the XML element that is the enclosing header start tag.


       -e/--end element
                 Name of the XML element that is the enclosing header end tag.


       -d/--delimit delimiter
                 Specifies the delimiter character that separates values in the input file. Default is semicolon.


       -i/--indent number
                 Number of spaces to indent each level of XML output. Default is 0.


       -X/--infile input_file
                 Generates XML from CSV in input_file. One record per line with fields in each record separated by the specified delimiter.


       -P/--pfile param_file
                 Uses input command line options (parameters) from param_file.


       -v/--verbose
                 Produces verbose output. Includes output progress reports during extraction.



Details
       opaxmlgenerate takes the CSV data from an input file. It generates fragments of XML, and in combination with a script, can be used to generate complete XML sequences. opaxmlgenerate does not use nor
       require a connection to an Intel(R) Omni-Path Fabric.

       opaxmlgenerate  reads CSV element values and applies element (tag) names to those values. The element names are supplied as command line options to the tool and constitute a template that is applied
       to the input.

       Element names on the command line are of three (3) types, distinguished by their command line option - Generate, Header, and Header_End. The Header and Header_End types together constitute enclosing
       element types. Enclosing elements do not contain a value, but serve to separate and organize Generate elements.

       Generate  elements,  along  with a value from the CSV input file, cause XML in the form of <element_name> value</element_name> to be generated. Generate elements are normally the majority of the XML
       output since they specify elements containing the input values. Header elements cause an XML header start tag of the form: <element_name> to be generated. Header_End elements cause an XML header end
       tag  of  the  form </element_name> to be generated. Output of enclosing elements is controlled entirely by the placement of those element types on the command line. opaxmlgenerate does not check for
       matching start and end tags or proper nesting of tags.

       Options (parameters) to opaxmlgenerate can be specified on the command line, with a parameter file, or both. A parameter file is specified with -P param_file. When a parameter file specification  is
       encountered  on  the  command  line, option processing on the command line is suspended, the parameter file is read and processed entirely, and then command line processing is resumed. Option syntax
       within a parameter file is the same as on the command line. Multiple parameter file specifications can be made, on the command line or within other parameter files. At each point  that  a  parameter
       file  is  specified,  current  option  processing  is suspended while the parameter file is processed, then resumed. Options are processed in the order they are encountered on the command line or in
       parameter files. A parameter file can be up to 8192 bytes in size and may contain up to 512 parameters.


Using opaxmlgenerate to Create Topology Input Files
       opaxmlgenerate can be used to create scripts to translate from user-specific format into the opareport topology_input file format. opaxmlgenerate itself works against a CSV style file with one  line
       per record. Given such a file it can produce hierarchical XML output of arbitrary complexity and depth.

       The typical flow for a script which translates from a user-specific format into opareport topology_input would be:

       ·      As  needed,  reorganize  the data into link and node data CSV files, in a sequencing similar to that used by opareport topology_input. One link record per line in one temporary file, one node
              record per line in another temporary file and one SM per line in a third temporary file.

       ·      The script must directly output the boilerplate for XML version, etc.

       ·      opaxmlgenerate can be used to output the Link section of the topology_input, using the link record temporary file.

       ·      opaxmlgenerate can be used to output the Node sections of the topology_input using the node record temporary file. If desired, there could be separate node record temporary files for HFIs and
              Switches.

       ·      opaxmlgenerate can be used to output the SM section of the topology_input, if desired.

       ·      The script must directly output the closing XML tags to complete the topology_input file.



Copyright(C) 2015-2018                                                                        Intel Corporation                                                                             opaxmlgenerate(8)
