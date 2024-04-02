KSFLATTEN(1)                                                                               General Commands Manual                                                                               KSFLATTEN(1)



NAME
       ksflatten — flatten a kickstart file

SYNOPSIS
       ksflatten [-c | --config INFILE]  [-o | --output OUTFILE]  [-v | --version VERSION]

DESCRIPTION
       ksflatten is a program that takes an input kickstart file potentially containing includes and generates an output file with all the includes inlined.

EXIT STATUS
       ksflatten returns 0 on success, and 1 if INFILE does not exist or there is an error parsing the kickstart file.

OPTIONS
       -c, --config INFILE
                 The name of the input kickstart file.

       -o, --output OUTFILE
                 Write the flattened kickstart file to OUTFILE, or stdout if no filename is given.

       -v, --version VERSION
                 Use this version of kickstart syntax when processing the file, or the latest if no version is given.

SEE ALSO
       ksvalidator (1), ksverdiff (1)



                                                                                                                                                                                                 KSFLATTEN(1)
