KSVALIDATOR(1)                                                                             General Commands Manual                                                                             KSVALIDATOR(1)



NAME
       ksvalidator — verify the syntax of a kickstart file

SYNOPSIS
       ksvalidator [-e | --firsterror]  [-i | --followincludes]  [-l | --listversions]  [-v | --version VERSION]  INFILE

DESCRIPTION
       ksvalidator  is  a  program  that  takes  an input kickstart file and attempts to verify that it is syntactically correct.  This includes checking basics like proper quoting and making sure required
       options have values, and more advanced checks like verifying the file does not include deprecated or removed kickstart commands.  Mutually exclusive options  can  also  be  caught,  as  can  certain
       classes of partitioning errors (like using the same device name multiple times).

       ksvalidator  does  have  its limitations.  It cannot run validate the syntax of %pre, %pre-install, and %post scripts, nor does it attempt to run them.  It cannot check that the %packages section is
       valid.  Most importantly, it cannot guarantee that an input kickstart file will install properly, because it does not understand the complexities of partitioning and what potentially already  exists
       on disk.

EXIT STATUS
       ksvalidator returns 0 on success, and 1 if INFILE does not exist or there is an error parsing the kickstart file.

OPTIONS
       -e, --firsterror
                 Stop on the first warning or error.  By default, ksvalidator will attempt to process the entire file, potentially raising multiple errors.

       -i, --followincludes
                 Process  included files in the input file when they are seen, like anaconda would.  If the included file does not exist (this can happen for a variety of reasons, but the most common being
                 a %pre script that generates an included file) and this option is given, an error will be generated and processing halted.

       -l, --listversions
                 List all versions of kickstart syntax supported by ksvalidator.  This is useful for determining what values can be fed back in on a second run.

       -v, --version VERSION
                 Use this version of kickstart syntax when processing the file, or the latest if no version is given.

SEE ALSO
       ksflatten (1), ksverdiff (1)



                                                                                                                                                                                               KSVALIDATOR(1)
